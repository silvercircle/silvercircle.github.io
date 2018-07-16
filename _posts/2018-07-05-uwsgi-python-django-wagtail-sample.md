---
author: Alex Vie
title: uWSGI configuration example for a Django/Wagtail app
date: 2018-07-06T17:00:30+0200
modified: 2018-07-06T17:00:36+0200
layout: no_sidebar
menucontext: blog
share: 1
disqus: 1
reduced: big
tag: [first]
category: [Site,Development]
backlink: /blog
excerpt: >
    uWSGI is a widely accepted standard for deploying web applications in many different frameworks
    and languages, though it is particularly popular in the Python and to some lesser extent, the
    Ruby ecosystems.
    <br><br>
    This example shows a typical configuration for a Django web application in Python 3, using uWSGI
    in emperor mode.
---

# uWSGI configuration example for a Django/Wagtail app
{% include defs.md %}
{% include post_header.html %}

The following assumes that uWSGI is running in emperor - vassal configuration. In this mode, the
emperor should be seen as a master process that controls an arbitrary number of child instances.
Each instance consists of multiple processes and/or threads and deploys a single web application.
While the emperor runs as root in order to set up environments and enforce full control over all
child instances, the children usually run unprivileged. Communication between the front end web
server and the uWSGI application service happens via sockets, either TCP/UDP or (preferable, because
of superior performance and little overhead) Unix domain sockets.
{:dc}

The uWSGI emperor process is typically managed by systemd on modern Linux distributions and requires 
administrator privileges to control. Under normal circumstances the emperor will run and monitor its 
child instances. Adding and removing child instances is possible at runtime, though a restart of the 
emperor is necessary to recognize such configuration changes.

The main configuration file is `/etc/uwsgi/uwsgi.ini` and the child instances have one configuration
file per instance in `/etc/uwsgi/vassals`. Note that these paths are valid for OpenSUSE
distributions and can be different on your system. Check the man page(s).

While uWSGI can be seen as a universal solution, it is most popular in the Python ecosystem to
deploy web applications written in Python, using one of the popular frameworks like Django or
Flask. uWSGI supports *per instance* Python virtual environments, which makes it particularly useful
for deploying multiple web applications with different software requirements, as each application
will run within its own virtual Python environment. This method makes it relatively easy to run
multiple web applications that require different versions of the Django framework for example. A
single uWSGI installation can also host Python 2 and Python 3 applications at the same time, because
all configuration is local to a **single instance** and uWSGI uses a sophisticated plugin system to
support a wide range of client configurations.

#### The following languages / ecosystems are supported

* Python
* Ruby
* Lua
* Perl
* Simple CGI scripts (for example, written in bash)
* Golang (aka Google Go)
* PHP
* Java virtual machine
* V8 JavaScript
* Mono .NET

## Commented configuration file for a Django application

This is a heavily commented sample configuration, demonstrating a single vassal instance running a
Django application (the [Wagtail](https://wagtail.io) CMS framework). 

{% highlight ini linenos %}
[uwsgi]
plugin = python3                ; this instance uses python 3. There are plugins for many 
                                ; different systems.
uid = alex                      ; user id under which the instance should run.
gid = users                     ; group id under which the instance should run
socket = /home/alex/uwsgi.sock  ; the socket for communicating with the front end web server
chown-socket = nginx:nginx      ; only the web server process may access the socket
chmod-socket = 700              ; see above
threads = 20
master = 1
processes = 1
autoload = 1

    ; the settings to use. In this case, mysite/settings/dev.py contains the application
    ; configuration. there is also a production.py in the same directory, don't forget to
    ; switch for production operation as dev.py enables debugging which is NOT recommended
    ; for a live production site (it slows down stuff and may reveal things about your 
    ; application, a visitor is not supposed to see, because full debug messages will be sent
    ; to the client browser in case of any error)
env = DJANGO_SETTINGS_MODULE=mysite.settings.dev

    ; the module is the object that handles all requests. It's always the WSGIHandler() for
    ; django applications.
module = django.core.handlers.wsgi:WSGIHandler()

    ; the base directory for the web application. For a django application, this is the 
    ; same directory that contains the manage.py script.
    ; the uWSGI instance will chroot to this directoy and cannot access its parent for
    ; security reasons.
chdir = /home/alex/srv/djangoapp/mysite

    ; set a virtual environment for this instance. The base directory of the environment
    ; (which contains the bin/ and lib/ sub directories) must be specified here. If none
    ; is given, the default Python environment will be used.
virtualenv = /home/alex/srv/djangoapp/testproject

    ; where to mount the application. The wsgi.py sets up the main application and hands
    ; off control to the WSGI handler.
    ; 
    ; in this case, the app is mounted to the root of the domain. Multiple applications 
    ; can be mounted to different URL paths, if needed. Note that your webserver config
    ; must contain appropriate location sections..
mount = /=mysite/wsgi.py

    ; vacuum, if true, instructs the emperor to clean up sockets upon shutdown of a child 
    ; instance. Recommended.
vacuum = true

    ; this instructs the instance to monitor all source directories for code changes and 
    ; reload when needed. This should *NOT* be enabled for a production site as it comes
    ; with a performance penalty. It is very useful for a development environment though,
    ; because without it, a service restart would be required after changes to the app
    ; code.
py-autoreload = 1
{% endhighlight %}

## Web server configuration

Nginx ([https://nginx.com](https://nginx.com)) is a popular choice for a front end web server, because of its high
flexibility and excellent performance. Nginx supports uWSGI out-of-the-box with mechanisms that are
very similar to its fastcgi support. Anyone familiar with configuring Nginx with php-fpm for
example, should not run into many problems when setting up Nginx as an uWSGI front end. The basic
idea is that Nginx handles all requests and passes them to the backend web application when
necessary. Static resources (style sheets, script files etc.) can be served directly for best
performance.
{:dc}

### Define an upstream

In order to keep the configuration tidy and easy to read/maintain, I prefer using named upstreams
instead of defining them inline. Both methods are equally viable and basically, it's a matter of personal
preference which one to use. Named upstreams are easier to 
```ini
    upstream myapp {
        server unix:/home/alex/uwsgi.sock;
    }
```

This defines an upstream using a Unix domain socket which has been defined in the uWSGI
configuration (see above). The socket's permissions must allow Nginx read and write access, so
either use `chown-socket` or `chmod-socket` in the uWSGI configuration (or both if you want really
strict socket security). Remember that your web application can run under any user account and will
likely use your own user id, while Nginx will typically run under its own unprivileged uid and thus
cannot write to files it does not own. It's tempting to set the socket's permissions to 0777, making
it world read- and writable, but this is not the best idea. As a rule of thumb, permissions should
always be set using a minimalist approach - not more than absolutely needed. It's better to set the
permissions to 0600 and the owner to the uid used by Nginx for its worker processes.

### The server section

The following two elements are the bare minimum you need to have in your `server` section. The first
one defines the path for the static content. It is **important** to have this section in the
beginning so that the web server can serve static resources without passing the requests to the web
application. This will help your server's overall performance, particularly when using Nginx,
because Nginx is very efficient with serving static resources. Note that static content gets a generous
cache life time of 7 days and requests won't be logged which further improves performance. Content
also gets gzipped on the fly, which only makes sense if you do not minify or otherwise compress your
style sheets and scripts.

Don't forget to perform a `./manage.py collectstatic` whenever static content changes in order to
populate the static directory with all script, CSS and other files. This directory will always
be located below the root directory of your application, the folder that holds the `manage.py` 
script.

The second *location* section uses the upstream to pass all other requests (except for /static) to
the web application, using the named upstream defined above. Make sure you do not omit the `include
/etc/nginx/uwsgi_params` line, because this is important for setting up the environment and passing
crucial parameters to the web application. Without this line, your web app will very likely not work
at all or behave erratically.

```ini
   location /static {
    alias /home/alex/srv/djangoapp/mysite/static;
    access_log off;
    expires 7d;
    gzip on;
   }

   location / {
    include /etc/nginx/uwsgi_params;
    uwsgi_pass myapp;
    break;
   }
```
As already said, the above is the absolute minimum for configuring a virtual host for an uWSGI
application. 
