---
layout: post
categories: [ blog]
title: The Ultimate Markdown Towards Data Scientist
subtitle: Markdown Tips to Become a Better Data Scientist.
image: assets/img/md.png
thumbnail-img: assets/img/md.png
#cover-img: ["assets/img/aws.png" : "Caption of image", "assets/img/aws.png" : "Caption of image"]
tags: [Markdown, Python, R, Data Science]
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

In this post, you’ll learn all the Markdown’s major commands that will help you create an awesome **GitHub README**, a **NOTEBOOK**, or a **WEB PAGE** like the one you are reading.  

#### Paragraphs

If you need a hard line break, put two or more spaces at the end of a line.  
  
<o>Code</o>
  
```Markdown
text here  
```  
  
<o>Output</o>
  
Synthax here  

---

#### Horizontal rules
  
<o>Code</o>
  
```Markdown
text here  
```  
  
<o>Output</o>
  
Synthax here  

---

#### Bold and Italics
  
<o>Code</o>
   
```Markdown
*italic*  or _italic_  
**bold**  or __bold__  
```  
  
<o>Output</o>
  
*italic*  or _italic_  
**bold**  or __bold__  

---

#### Superscript

```superscript^2^ and subscript~2~```
  
<o>Output</o>
  
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
  
```Markdown
*   Item 1
*   Item 2
  * Item 2a
  * Item 2b
```
  
<o>Output</o>
  
* Item 1
* Item 2
  * Item 2a
  * Item 2b

Numbered list, The numbers are incremented automatically in the output.
  
<o>Code</o>
   
```Markdown
1.  Item 1

1.  Item 2.
```
  
<o>Output</o>
  
1. Item 1

1. Item 2.

---

#### Links
  
<o>Code</o>
  
```Markdown
<http://NestQuest.net>

[Vist My Web Site](http://NestQuest.net)
```
  
<o>Output</o>
  
<http://NestQuest.net>

[Vist My Web Site](http://NestQuest.net)

#### Images

Left Image?
  
<o>Code</o>
  
```Markdown
![Data Science](https://nestquest.net/assets/img/PvsR.png){width=4in}
```
  
<o>Output</o>
  
![Data Science](https://nestquest.net/assets/img/PvsR.png){width=4in}

It can also be centered!
  
<o>Code</o>
  
```Markdown
![Data Science](./assets/img/DS.jpg){width=4in}{: .mx-auto.d-block :}
```
  
<o>Output</o>
  
![Data Science](./assets/img/DS.jpg){width=4in}{: .mx-auto.d-block :}

```
![Internal Link](../assets/img/DS.png)
```

![Internal Link](../assets/img/DS.png)

---

#### Boxes

You can add notification, warning and error boxes like this:

###### Notification
  
<o>Code</o>
  
```Markdown
{: .box-note}
**Note:** This is a notification box.
```
  
<o>Output</o>
  
{: .box-note}
**Note:** This is a notification box.

###### Warning
  
<o>Code</o>
  
```Markdown
{: .box-warning}
**Warning:** This is a warning box.
```
  
<o>Output</o>
  
{: .box-warning}
**Warning:** This is a warning box.

###### Error
  
<o>Code</o>
  
```Markdown
{: .box-error}
**Error:** This is an error box.
```
  
<o>Output</o>
  
{: .box-error}
**Error:** This is an error box.

---

#### Tables 
  
<o>Code</o>
  
```Markdown
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
```  
  
<o>Output</o>
  
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
  
<o>Code</o>
  
Here's a another table:
  
```Markdown
| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |
```
  
<o>Output</o>
  
| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |

---

#### Codes 

There are two ways to format code in Markdown. You can either use inline code, by putting backticks (`) around parts of a line, or you can use a code block, which some renderers will apply syntax highlighting to.

Here's a Code chunk:
  
<o>Code</o>
  
```text
~~~python
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~
```
  
<o>Output</o>
  
~~~python
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same Code with syntax highlighting:
  
<o>Code</o>
  
```text
```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```
```
  
<o>Output</o>
  
```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

And here is the same Code yet again but with line numbers:
  
<o>Code</o>
  
{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}

---

#### Math
  
<o>Code</o>
  
