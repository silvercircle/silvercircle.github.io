---
author: Alex Vie
title: Creating a simple tab control in Jekyll
layout: no_sidebar
reduced: big
date: 2017-11-02T16:38:51+0100
modified: 2017-11-02T16:38:59+0100
menucontext: blog
category: Jekyll
share: 1
disqus: 1
tag: [first,jekyll,css]
backlink: /blog
excerpt: >
    A include-able fragment to build a simple tab control in a Jekyll page. Simple and flexible, can 
    be adopted easily to other static page generators.
    <br>
    <br>
    This is HTML/CSS/Javascript only, and should work for any static site generator with an include 
    feature similar to Jekyll's.
image:
    source: jekyll
    width: 130px
    align: right
tabs:
    tab1:
        name: foo
        title: Page One
        source: source1
    tab2:
        name: bar
        title: Page Two
        source: source2
        content: >
            ## Headline

            This is the content of the second tab, it is defined in the frontmatter as **markdown**.
            

            A Link: [link](https://foo.bar.org)
    tab3:
        name: baz
        title: Page Three
        source: source3
        active: 1
---

# Creating a simple tab control in Jekyll

{% include post_header.html %}
{% include defs.md %}

This is a liquid template fragment t hat builds a tab control in a Jekyll page. It is supported by 
CSS and some jQuery Javascript that will follow below. It's supposed to be flexible and can contain 
an arbitrary number of tabs. Multiple tab controls on a single page are possible.
{:dc}

Because this is plain HTML, CSS and some JavaScript (jQuery required), the concept can work for 
other static site generators or even plain old-school HTML.
{% raw %}
```html
<div class="tabcontrol container">
    <ul class="tabcontrol tabs" style="{{include.headerstyle}}">
        {% for tab in include.tabs %}
            <li class="tabcontrol tab {% if {tab[1].active %}active{% endif %}" data-name="{{tab[1].name}}" data-target="tab_{{include.id}}" data-source="{{include.id}}__{{tab[1].source}}">
                {{tab[1].title}}
            </li>
            {% if tab[1].active %}
                {% assign defaultsource = tab[1].source %}
            {% endif %}
            {% if tab[1].content %}
            <div id="{{include.id}}__{{tab[1].source}}" class="hidden">
                {{tab[1].content | markdownify }}
            </div>
            {% endif %}
        {% endfor %}
    </ul>
    <div id="tab_{{include.id}}" class="tabcontrol body {{include.bodyclass}}" style="{{include.bodystyle}}" data-defaultsource="{{include.id}}__{{defaultsource}}">
    </div>
</div>
```
{% endraw %}

## List of parameters the include fragment can accept:

* `id` - mandatory: A DOM id for the body container. Must be unique and will be used as prefix for 
  all source elements..

* `tabs` - mandatory: An array of data elements that defines the tabs. If it's part of the page's 
  front matter, it must be specified as `page.foo`. 

* `headerstyle` - optional: valid CSS attributes and values for the tab control header (the `ul` 
  item containing the tabs). This will directly be passed as `style` attribute and should be 
  formatted like the content for such an attribute.

* `bodystyle` - optional: Same as above, but for the body element (the container for the content)..

* `bodyclass` - optional: Additional CSS class for the body element.

## How to define tabs

Tabs are defined as an array of YAML data items. They can be part of the document's front matter or 
reside under Jekyll's `_data` directory, accessible via the `site.data` name space. This method allows 
to define tab controls as re-usable components with the content either defined in the data file OR in 
your page. It's flexible enough to even mix content from the data file with content defined in the 
page.
{:dc}
```yaml
tabs: 
    tab1:
        name: foo
        title: Page One
        source: source1
    tab2:
        name: bar
        title: Page Two
        source: source2
        content: >
            ## Headline

            This is the content of the second tab, it is defined in the frontmatter as **markdown**.

            A Link: [link](https://foo.bar.org)
    tab3:
        name: baz
        title: Page Three
        active: 1
        source: source3
```
The root element (`page.tabs` in our case) is then passed to the include fragment which will iterate 
over the array generating the HTML code. The `title` is what will appear on the tabs and `source` 
specifies the DOM element id that contains the HTML content for that tab. These elements should be 
`DIVs` of class `hidden` (the *display* attribute must be set to *none*, because they are not 
supposed to show up in the document).

## The default page that should be visible on page load

The default tab must be specified using the `active` attribute. The value does not matter and can be 
anything as it is just checked for presence. If multiple tabs define the `active` attribute, the 
last one will take precedence. In our example above, `tab3` will be the default.
{:dc}
## How to set the content for a tab page

You can either include the DOM element in your markdown page, OR use the `content` property in which 
case, the DOM element will be created automatically with the given identifier. The `source` **must 
always be present** and **will automatically be prefixed with the ID followed by two underscores**. 
The `content` attribute can contain valid HTML and markdown and will be fed through `markdownify`.
{:dc}

To support multiple tab controls from the same template on a single page, the DOM ids for source 
elements are always prefixed with the id of the control (this is what is passed to the include in 
the `id` parameter), followed by two underscores.

#### Example

Assume the YAML `source` property for a tab specifies `source1`, then the element ID you use in the 
document *must* be `id__source1` where `id` is what you pass to to `tabcontrol.html` via the `id` 
parameter. This is **case sensitive**.

{:dc}
#### This is how such a source element should look like:

Assuming, the id of the tab control is **foo** and the tab definition defines `source` as 
**source3**:
```html
<div class="hidden" id="foo__source3" markdown="1">
## This is source element #3

The content for tab page 3.
</div>
```

## The (minimum) CSS

This is the bare bone CSS necessary for basic styling. Since the include allows you to pass 
additional classes for the tab control and body elements, you can easily expand the styling. Also, 
the include accepts `headerstyle` and `bodystyle` arguments, which must contain valid CSS and will 
be used as content for the `style` attribute.
{:dc}
```css
ul.tabcontrol.tabs {
    margin: 0;
    height: 25px;
    box-sizing: border-box;
    border-bottom: 1px solid $lightgrey;
}

ul.tabcontrol.tabs li.tab {
    float:left;
    padding:3px 5px;
    cursor: pointer;
    list-style-type: none;
    border: 1px solid $lightgrey;
    border-bottom: none;
    box-sizing: border-box;
    height: 24px;
    background: white;
    margin-right: 2px;
    font-family: $sans_font !important;
    font-size: 10pt !important;
    line-height: 100% !important;
    border-radius: 2px 2px 0 0;
}

ul.tabcontrol.tabs li.tabcontrol.tab.active {
    height: 28px;
    font-weight: bold !important;
    margin-top: -3px;
    border-top: 3px solid blue;
}

ul.tabcontrol.tabs li.tabcontrol.tab:first-child {
    border-left: 1px solid $lightgrey;
}

div.tabcontrol.body {
    padding: 0;
}

div.tabcontrol.body.fullborder {
    border: 1px solid $lightgrey;
    border-top: none;
    padding: 10px;
}

div.tabcontrol.body p:last-child, div.tabcontrol.body ul:last-child {
    margin-bottom: 0;
}
```

## The JavaScript code

This code requires jQuery and must be part of the `$(document).ready()` function. Ideally, the script 
to load the default content should execute early in the page's `ready()` handler, but this only 
matters if your page is heavy on scripts and does a lot in the `ready()` function. 

{% highlight javascript linenos %}
    // set the default content from data-defaultsource
    // if your page is script-heavy, you may want to make this execute early
    // in the $(document).ready() handler to avoid ugly delays.
    $('div.tabcontrol.body').each(function() {
        $(this).html($('#' + $(this).data('defaultsource')).html());
    });

    // handle click on tabs
    $('li.tabcontrol.tab').click(function() {
        $('#' + $(this).data('target')).html( $('#' + $(this).data('source')).html());
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });
{% endhighlight %}

## Demonstration

Here is a demonstration. The include fragment is called with the following parameters:
{% raw %} 
```liquid
{% include tabcontrol.html bodyclass="fullborder" tabs=page.tabs id="foo" %}
```
{% endraw %}
The elements `foo__source1` and `foo__source3` are defined in the document as hidden `DIVs` while 
`source2` gets its content from the document's front matter (see [above](#how-to-define-tabs)).
{% include tabcontrol.html tabs=page.tabs id="foo" bodyclass="fullborder" %}

## TODO

Make it fully responsive without looking like *crap*.

<div class="hidden" id="foo__source1" markdown="1">
## This is source element #1

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mauris sapien, feugiat id elit id, 
ultrices ultricies purus. Pellentesque nec elit enim. Cras vel pretium tellus. Maecenas nec sapien id 
metus semper iaculis sit amet et enim. Pellentesque quis dolor nec elit hendrerit feugiat a ac massa. 
Sed semper elementum magna, eu ornare odio. Curabitur gravida turpis nec lacus rhoncus molestie. 
Curabitur iaculis, mi facilisis feugiat vehicula, augue dui facilisis lacus, et tincidunt dui purus 
rutrum arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos 
himenaeos. Cras congue, nisl nec condimentum sodales, dolor purus dapibus quam, ut condimentum mi dui 
eget ante. Suspendisse dignissim felis risus, nec vehicula ante placerat ut. Aliquam erat volutpat. 
Praesent viverra euismod quam, a ultricies justo vehicula a.
{:dc}
 </div> 

<div class="hidden" id="foo__source3" markdown="1">
## This is source element #3

Nam consectetur in velit ut venenatis. Aliquam eget ante ac lorem rhoncus dignissim eget eget leo. 
Ut rhoncus eros nec erat maximus, in pretium leo dapibus. Nam ut blandit erat, in pretium metus. 
Pellentesque vitae mauris libero. Suspendisse fringilla justo non sollicitudin varius. Vivamus 
rhoncus lorem eu porttitor bibendum. Nullam risus turpis, imperdiet eget nisl in, tristique volutpat 
mauris.
{:dc}
</div>

