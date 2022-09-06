---
category: AWS
layout: post
date: 2022-09-05
title:  "My Template with Pictures"
subtitle: Best Template ever!
description: "My review of Inception movie. Acting, plot and something else in this short description."
image: /img/hello_world.jpeg
tags: [alteryx, tableau, Python, Analytics]
bigimg: [{src: "/img/triangle.jpg", desc: "Triangle"}, {src: "/img/sphere.jpg", desc: "Sphere"}, {src: "/img/hexagon.jpg", desc: "Hexagon"}]
author: JEB
featured: true
hidden: false
rating: 4.5
---

You can write regular [markdown](http://markdowntutorial.com/) here and Jekyll will automatically convert it to a nice webpage.  I strongly encourage you to [take 5 minutes to learn how to write in markdown](http://markdowntutorial.com/) - it'll teach you how to transform regular text into bold/italics/headings/tables/etc.

**Here is some bold text**

## Here is a secondary heading

Here's a useless table:

| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |


How about a yummy crepe?

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg)

It can also be centered!

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg){: .center-block :}

Here's a code chunk:

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same code with syntax highlighting:

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

And here is the same code yet again but with line numbers:

{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}

## Boxes
You can add notification, warning and error boxes like this:

### Notification

{: .box-note}
**Note:** This is a notification box.

### Warning

{: .box-warning}
**Warning:** This is a warning box.

### Error

{: .box-error}
**Error:** This is an error box.


There are lots of powerful things you can do with the Markdown editor. If you've gotten pretty comfortable with writing in Markdown, then you may enjoy some more advanced tips about the types of things you can do with Markdown!

As with the last post about the editor, you'll want to be actually editing this post as you read it so that you can see all the Markdown code we're using.


## Special formatting

As well as bold and italics, you can also use some other special formatting in Markdown when the need arises, for example:

+ ~~strike through~~
+ ==highlight==
+ \*escaped characters\*


## Writing code blocks

There are two types of code elements which can be inserted in Markdown, the first is inline, and the other is block. Inline code is formatted by wrapping any word or words in back-ticks, `like this`. Larger snippets of code can be displayed across multiple lines using triple back ticks:

```
.my-link {
    text-decoration: underline;
}
```

#### HTML

```html
<li class="ml-1 mr-1">
    <a target="_blank" href="#">
    <i class="fab fa-twitter"></i>
    </a>
</li>
```

#### CSS

```css
.highlight .c {
    color: #999988;
    font-style: italic;
}
.highlight .err {
    color: #a61717;
    background-color: #e3d2d2;
}
```

#### JS

```js
// alertbar later
$(document).scroll(function () {
    var y = $(this).scrollTop();
    if (y > 280) {
        $('.alertbar').fadeIn();
    } else {
        $('.alertbar').fadeOut();
    }
});
```

#### Python

```python
print("Hello World")
```

#### Ruby

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

#### C

```c
printf("Hello World");
```




![walking]({{ site.baseurl }}/assets/images/8.jpg)

## Reference lists

The quick brown jumped over the lazy.

Another way to insert links in markdown is using reference lists. You might want to use this style of linking to cite reference material in a Wikipedia-style. All of the links are listed at the end of the document, so you can maintain full separation between content and its source or reference.

## Full HTML

Perhaps the best part of Markdown is that you're never limited to just Markdown. You can write HTML directly in the Markdown editor and it will just work as HTML usually does. No limits! Here's a standard YouTube embed code as an example:

<p><iframe style="width:100%;" height="315" src="https://www.youtube.com/embed/Cniqsc9QfDo?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe></p>

Beautiful Hugo adds a few custom shortcodes created by [Li-Wen Yip](https://www.liwen.id.au/heg/) and [Gert-Jan van den Berg](https://github.com/GjjvdBurg/HugoPhotoSwipe) for making galleries with [PhotoSwipe](http://photoswipe.com) .

{{< gallery caption-effect="fade" >}}
  {{< figure thumb="-thumb" link="/img/hexagon.jpg" >}}
  {{< figure thumb="-thumb" link="/img/sphere.jpg" caption="Sphere" >}}
  {{< figure thumb="-thumb" link="/img/triangle.jpg" caption="Triangle" alt="This is a long comment about a triangle" >}}
{{< /gallery >}}

## Example
The above gallery was created using the following shortcodes:
```
{{</* gallery caption-effect="fade" */>}}
  {{</* figure thumb="-thumb" link="/img/hexagon.jpg" */>}}
  {{</* figure thumb="-thumb" link="/img/sphere.jpg" caption="Sphere" */>}}
  {{</* figure thumb="-thumb" link="/img/triangle.jpg" caption="Triangle" alt="This is a long comment about a triangle" */>}}
{{</* /gallery */>}}
```

## Usage
For full details please see the [hugo-easy-gallery GitHub](https://github.com/liwenyip/hugo-easy-gallery/) page. Basic usages from above are:

- Create a gallery with open and close tags `{{</* gallery */>}}` and `{{</* /gallery */>}}`
- `{{</* figure src="image.jpg" */>}}` will use `image.jpg` for thumbnail and lightbox
- `{{</* figure src="thumb.jpg" link="image.jpg" */>}}` will use `thumb.jpg` for thumbnail and `image.jpg` for lightbox
- `{{</* figure thumb="-small" link="image.jpg" */>}}` will use `image-small.jpg` for thumbnail and `image.jpg` for lightbox
- All the [features/parameters](https://gohugo.io/extras/shortcodes) of Hugo's built-in `figure` shortcode work as normal, i.e. src, link, title, caption, class, attr (attribution), attrlink, alt
- `{{</* gallery caption-effect="fade" */>}}` will fade in captions for all figures in this gallery instead of the default slide-up behavior
- Many gallery styles for captions and hover effects exist; view the [hugo-easy-gallery GitHub](https://github.com/liwenyip/hugo-easy-gallery/) for all options
- Note that this theme will load the photoswipe gallery theme and scripts by default, no need to load photoswipe on your individual pages

<!--more-->
