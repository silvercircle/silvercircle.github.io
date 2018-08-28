---
author: Alex Vie
title: Serving .NET Core apps on Linux with nginx and Kestrel
date: 2018-08-26T23:00:30+0200
modified: 2018-08-26T23:00:30+0200
layout: no_sidebar
menucontext: blog
share: 1
disqus: 1
reduced: big
tag: [first]
category: [Site,Development]
backlink: /blog
excerpt: >
    A small explanation how to configure the Kestrel .NET Core web server to use Unix domain sockets
    on Linux, when acting as a backend server behind Nginx.
    <br><br>
    Code taken from the default .NET Core MVC application template and only slightly modified.
---

# Serving .NET Core apps on Linux with nginx and Kestrel
{% include defs.md %}
{% include post_header.html %}

Kestrel [is the default web
server](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel?view=aspnetcore-2.1&tabs=aspnetcore2x)
for .NET Core. It is a fast and modern server that makes it relatively easy to deploy .NET Core
apps, requiring little configuration. Kestrel can run standalone, but in a production environment,
it is often used as a backend behind a more standard server like Apache or Nginx. These servers will
then act as frontends, serving static content (which they usually do better than Kestrel) and
handing off requests for the web application to the backend server.
{:dc}

In such a configuration, the frontend and backend typically communicate via a standard TCP
connection. This has the advantage that front- and backend can run on different physical or virtual
servers. If this is not needed and both servers shall run on the same piece of hardware and OS, then
there is an option to use domain sockets to improve throughput.

## Unix domain sockets

These are special to Unix-like operating systems and work similar to named pipes in Windows, but are
represented by a file system object, following the *everything is a file* paradigm. Domain sockets
are generally much faster than TCP sockets, because they employ far less overhead. While TCP
connections must always go through the full networking stack, domain sockets are operating on a much
lower and less abstracted layer, with less latency and higher throughput resulting as their main benefits.
{:dc}

Kestrel on Linux can make use of domain sockets, but this is not very well documented and most
standard configurations do not use them, most likely because there is no way to use domain sockets on
Windows, which is still the main platform for ASP.NET. The following instructions are for .NET Core 2.1.0 or
higher on Linux (Ubuntu or Debian, but the code will, of course, work everywhere else). The example
shows code from the default MVC template when you create a new MVC/EF web application, using `dotnet
new`. 

{% highlight c# linenos %}
    // this is from Program.cs
    // this is the main entry point for the web application when it starts
    // it builds a IWebHost object and starts it.
    public class Program
    {
        /*
         * this has been modified to allow a Chmod on the socket. The permissions
         * must allow the web server to read and write from the socket, and the web server
         * will typically run as non-privileged user.
         */
        public static void Main(string[] args)
        {
            IWebHost the_host = CreateWebHostBuilder(args).Build();
            the_host.Start();
            Console.WriteLine("Started service async");
            Chmod.Set("/tmp/kestrel.sock");
            the_host.WaitForShutdown();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                // the following is important, otherwise domain sockets will be unavailable
                .UseLibuv()
                // tell Kestrel to create and listen on a domain socket in /tmp
                .UseKestrel(options => {options.ListenUnixSocket("/tmp/kestrel.sock");})
                .UseStartup<Startup>();
    }
{% endhighlight %}

This isn't much different from the default code except that it instructs the WebHostBuilder to use 
`Libuv` and the Kestrel instance to use a domain socket.

The following code is from `Startup.cs`. It mainly contains a small helper class to fix the
permissions on the socket file and disables `HttpsRedirect` feature of Kestrel. Since the Kestrel
server will never ever see a direct request and won't communicate via HTTP at all, it does not
really need HTTPS.

{% highlight c# linenos %}

    public class Chmod
    {
        [DllImport("libc", SetLastError = true)]
        private static extern int chmod(string pathname, int mode);

        // user permissions
        const int S_IRUSR = 0x100;
        const int S_IWUSR = 0x80;
        const int S_IXUSR = 0x40;

        // group permission
        const int S_IRGRP = 0x20;
        const int S_IWGRP = 0x10;
        const int S_IXGRP = 0x8;

        // other permissions
        const int S_IROTH = 0x4;
        const int S_IWOTH = 0x2;
        const int S_IXOTH = 0x1;

        public static void Set(string filename)
        {
            const int _0755 =
                S_IRUSR | S_IXUSR | S_IWUSR
                | S_IRGRP | S_IXGRP | S_IWGRP
                | S_IROTH | S_IXOTH | S_IWOTH;
            Console.WriteLine(Path.GetFullPath(filename));
            Console.WriteLine("Result = " + chmod(Path.GetFullPath(filename), (int)_0755));
        }        
    }
    
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            Console.WriteLine("Startup create");
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });


            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            //app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
{% endhighlight %}

Now, the final part is a Nginx sample configuration. This is very minimal, it just contains the
proxy handoff for everything. More advanced setups would contain location entries for static files
and other optimizations for sure. This should just show the basic method.

```
server {
    server_name  skylounge.example.org;
    access_log  /var/log/nginx/skylounge.access.log  main;
    error_log   /var/log/nginx/skylounge.error.log;
	charset utf-8;

    location / {
        proxy_pass http://unix:/tmp/kestrel.sock:/;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $http_host;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /srv/www/htdocs/;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/skylounge.ddns.net/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/skylounge.ddns.net/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
```
