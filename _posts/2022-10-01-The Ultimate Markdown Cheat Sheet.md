---
layout: post
categories: [ blog]
title: The Ultimate Markdown Towards Data Scientist
subtitle: Markdown Tips to Become a Better Data Scientist.
image: assets/img/md.png
thumbnail-img: assets/img/md.png
#cover-img: ["assets/img/aws.png" : "Caption of image", "assets/img/aws.png" : "Caption of image"]
tags: [Markdown, Python]
---
<style>
r { color: Red }
o { color: Orange }
g { color: Green }
b { color: Blue }
</style>
<!--- -------Introduction-------- --->
This is a demo post to show you how to write blog posts with markdown.  I strongly encourage you to [take 5 minutes to learn how to write in markdown](https://markdowntutorial.com/) - it'll teach you how to transform regular text into bold

Text formatting 
------------------------------------------------------------

###### <b>Code</b>

```
*italic*  or _italic_
**bold**   __bold__
`code`
superscript^2^ and subscript~2~
```

###### <b>Result</b>

*italic*  or _italic_
**bold**   __bold__
`code`
superscript^2^ and subscript~2~



Headings
------------------------------------------------------------


###### <b>Code</b>

```

# 1st Level Header

## 2nd Level Header

### 3rd Level Header
```


###### <b>Result</b>

# 1st Level Header

## 2nd Level Header

### 3rd Level Header


Lists
------------------------------------------------------------


###### <b>Code</b>

```
*   Bulleted list item 1
*   Item 2
  * Item 2a
  * Item 2b
```


##### <b>Result</b>

*   Bulleted list item 1
*   Item 2
  * Item 2a
  * Item 2b


###### <b>Code</b>

```
1.  Numbered list item 1

1.  Item 2. The numbers are incremented automatically in the output.
```

###### <b>Result</b>

1.  Numbered list item 1

1.  Item 2. The numbers are incremented automatically in the output.


Links
------------------------------------------------------------

###### <b>Code</b>


<http://example.com>

[linked phrase](http://example.com)

![optional caption text](path/to/img.png)


Tables 
------------------------------------------------------------

###### <b>Code</b>

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

Here's a useless table:

| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |

Images
------------------------------------------------------------

How about a yummy crepe?

###### <b>Code</b>

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg)

It can also be centered!

###### <b>Code</b>

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg){: .mx-auto.d-block :}


Here's a <b>Code</b> chunk:

###### <b>Code</b>

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same <b>Code</b> with syntax highlighting:

###### <b>Code</b>

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

And here is the same <b>Code</b> yet again but with line numbers:

###### <b>Code</b>

{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}

### Boxes
You can add notification, warning and error boxes like this:

#### Notification

###### <b>Code</b>

~~~
{: .box-note}
**Note:** This is a notification box.
~~~

{: .box-note}
**Note:** This is a notification box.

#### Warning

###### <b>Code</b>

~~~
{: .box-warning}
**Warning:** This is a warning box.
~~~

{: .box-warning}
**Warning:** This is a warning box.

#### Error

###### <b>Code</b>

~~~
{: .box-error}
**Error:** This is an error box.
~~~

{: .box-error}
**Error:** This is an error box.