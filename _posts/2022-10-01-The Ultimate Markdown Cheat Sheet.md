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
Markdown is a way of writing rich-text content for the web using Plaintext formatting syntax. Plaintext is just the regular alphabet, with a few familiar symbols, like asterisks (*) and backticks (`).  

Formatting text in Markdown has a very gentle learning curve. It doesn’t do anything fancy like change the font size, color, or type. All you have control over is the display of the text—stuff like making things bold, creating headers, and organizing lists.  

In this post, you’ll learn all the Markdown’s major commands that will help you create an awesome GitHub README or a WEB PAGE like the one you are reading.  

#### Paragraphs
If you need a hard line break, put two or more spaces at the end of a line. 
  
<o>Code</o>
  
```
text here  
```
  
<o>Output</o>
  
Synthax here  

---
#### Horizontal rules
  
<o>Code</o>
  
```
text here  
```
  
<o>Output</o>
  
Synthax here  

---
#### Bold and Italics
  
<o>Code</o>
  
```
*italic*  or _italic_
**bold**   __bold__
```
  
<o>Output</o>
  
*italic*  or _italic_
**bold**   __bold__

---
#### Headings
```superscript^2^ and subscript~2~```

superscript^2^ and subscript~2~

---
#### Headings
  
<o>Code</o>
  
```
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```
  
<o>Output</o>
  
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

---
#### Lists
  
<o>Code</o>
  
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
  
<o>Code</o>
  
```
1.  Numbered list item 1

1.  Item 2. The numbers are incremented automatically in the output.
```

###### <b>Result</b>

1.  Numbered list item 1

1.  Item 2. The numbers are incremented automatically in the output.


Tables 
  
<o>Code</o>
  
```
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
```

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
  
<o>Code</o>
  
Here's a useless table:

```
| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |
```

| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |


#### Links
  
<o>Code</o>
  
```
<http://NestQuest.net>

[linked phrase](http://NestQuest.net)

![optional caption text](assets/img/md.png)
```

<http://NestQuest.net>

[linked phrase](http://NestQuest.net)

![optional caption text](assets/img/md.png)


#### Images

How about a yummy crepe?

<o>Code</o>
  
```
![Data Science](https://nestquest.net/assets/img/DS.png){width=4in}
```

![Data Science](https://nestquest.net/assets/img/DS.png){width=4in}


It can also be centered!

###### <o>Code</o>

![Data Science](./assets/img/DS.png){width=4in}{: .mx-auto.d-block :}


There are two ways to format code in Markdown. You can either use inline code, by putting backticks (`) around parts of a line, or you can use a code block, which some renderers will apply syntax highlighting to.

Here's a Code chunk:

###### <o>Code</o>

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same Code with syntax highlighting:

###### <o>Code</o>

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

And here is the same Code yet again but with line numbers:

###### <o>Code</o>

{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}

#### Boxes
You can add notification, warning and error boxes like this:

##### Notification

###### <o>Code</o>

~~~
{: .box-note}
**Note:** This is a notification box.
~~~

{: .box-note}
**Note:** This is a notification box.

##### Warning

###### <o>Code</o>

~~~
{: .box-warning}
**Warning:** This is a warning box.
~~~

{: .box-warning}
**Warning:** This is a warning box.

##### Error

###### <o>Code</o>

~~~
{: .box-error}
**Error:** This is an error box.
~~~

{: .box-error}
**Error:** This is an error box.