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
Markdown is a way of writing rich-text content for the web using Plaintext formatting syntax. Plaintext is just the regular alphabet, with a few familiar symbols, like asterisks ( * ) and backticks ( ` ). Formatting text in Markdown has a very gentle learning curve. It doesn’t do anything fancy like change the font size, color, or type. All you have control over is the display of the text—stuff like making things bold, creating headers, and organizing lists. In this post, you’ll learn all the Markdown’s major commands that will help you create an awesome GitHub README or web page.

Bold and Italics
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
#Heading 1
##Heading 2
###Heading 3
####Heading 4
#####Heading 5
######Heading 6
```


###### <b>Result</b>

#Heading 1
##Heading 2
###Heading 3
####Heading 4
#####Heading 5
######Heading 6


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


Links
------------------------------------------------------------

###### <b>Code</b>


<http://NestQuest.net>

[linked phrase](http://NestQuest.net)

![optional caption text](assets/img/md.png)


Images
------------------------------------------------------------

How about a yummy crepe?

###### <b>Code</b>

![Data Science](https://nestquest.net/assets/img/DS.png)

It can also be centered!

###### <b>Code</b>

![Data Science](https://nestquest.net/assets/img/DS.png){: .mx-auto.d-block :}


There are two ways to format code in Markdown. You can either use inline code, by putting backticks (`) around parts of a line, or you can use a code block, which some renderers will apply syntax highlighting to.

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