---  
layout: post   
categories: [ blog]  
title: SKYTRAX AIRLINE REVIEW ANALYSIS (Africa, Europe America and Asia)  
subtitle: Natural Language Processing project that analyzes the airline industries feedback data..  
image: assets/img/airlines.png  
thumbnail-img: assets/img/airlines.png 
#cover-img: ["assets/img/My_Environment_Post.png" : "Caption of image", "assets/img/My_Environment_Post.png" : "Caption of image"]  
tags: [Python, Web Scraping, Skytrax, BeautifulSoup, TextBlob, NLP]  
---  
<style>  
r { color: Red }  
o { color: Orange }  
g { color: Green }  
b { color: Blue }  
</style>  
<!--- -------Introduction-------- --->  
Air travel can be a source of stress, even for experienced travelers who are used to completing tasks such as checking bags and finding gates before settling into their plane seats.

As a data scientist, you may be called upon to use your skills to help airlines assess whether there are opportunities to improve the customer journey and turn negative experiences into positive ones. By using data analysis and visualization techniques, companies can quickly and consistently respond to customer feedback in a way that is aligned with their brand values and business objectives.

Python is a vital tool for many data science projects, as it allows for the access, manipulation, and analysis of data. There are also several libraries available, such as BeautifulSoup, matplotlib, and TextBlob, that offer a wide range of functionality for tasks such as data scraping, review, categorization, visualization, and sentiment analysis.

For this project, we will gather data by scraping it from [https://www.airlinequality.com], a trustworthy source for airline business reviews. We will specifically be collecting reviews for Royal Air Maroc, British Airways, United Airlines and Qatar Airlines. 

With BeautifulSoup library, we will gather all the links to the reviews and then extract the text data from each individual review link.

```python
import pandas as pd
import requests
from bs4 import BeautifulSoup
from dateutil import parser
import matplotlib.pyplot as plt
from textblob import TextBlob
from collections import Counter
from openpyxl import Workbook
```

Royal air Maroc Data Scraping (Africa)  
url: https://www.airlinequality.com/airline-reviews/royal-air-maroc/page/1/?sortby=post_date%3ADesc&pagesize=100

```python
base_url = f"https://www.airlinequality.com/airline-reviews/royal-air-maroc"
pagesize = 100
pages = 5
airline = f"RAM"
region = f"Africa"

# Create an empty DataFrame
dm = pd.DataFrame(columns=['Date', 'Region', 'Airline', 'Title', 'Rating', 'Date Flown', 'Recommended', 'Review'])    

for i in range(1, pages+1):
    url = f"{base_url}/page/{i}/?sortby=post_date%3ADesc&pagesize={pagesize}"
    response = requests.get(url)
    content = response.content
    soup = BeautifulSoup(content, 'html.parser')

    for div in soup.find_all("article", itemprop="review"):
        
        rating = div.find("span", itemprop="ratingValue")
        rating = rating.text if rating else "N/A"
        
        title = div.find("h2", class_="text_header").get_text().strip('"')
        
        date = div.find("time", itemprop="datePublished")
        if date:
            date = parser.parse(date.text)
            date = date.strftime('%Y-%m-%d')
        else:
            date = "N/A"
        
        review = div.find("div", class_="text_content").get_text().strip('✅')
        
        traveller = div.find("td", class_="review-rating-header type_of_traveller")
        traveller = traveller.text if traveller else "N/A"
        
        tr = div.find("td", text="Date Flown")
        if tr:
            tr = tr.find_parent("tr")
            date_flown = tr.find("td", class_="review-value")
            date_flown = date_flown.text if date_flown else "N/A"
            if date_flown:
                date_flown = parser.parse(date_flown)
                date_flown = date_flown.strftime('%Y-%m-%d')
            else:
                date_flown = "N/A"
        else:
            date_flown = "N/A"

            
        tr = div.find("td", class_="review-rating-header recommended")
        if tr:
            tr = tr.find_parent("tr")
            recommended = tr.find("td", class_=lambda x: x and x.startswith("review-value rating-"))
            recommended = recommended.text if recommended else "N/A"
        else:
            recommended = "N/A"

            
        # Append the data to the DataFrame
        dm_new_row = pd.DataFrame({'Region': [region],'Airline': [airline],'Rating': [rating], 'Title': [title], 'Date': [date], 'Review': [review], 'Date Flown': [date_flown], 'Recommended': [recommended]})
        dm = pd.concat([dm, dm_new_row])

dm.head(10)
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Region</th>
      <th>Airline</th>
      <th>Title</th>
      <th>Rating</th>
      <th>Date Flown</th>
      <th>Recommended</th>
      <th>Review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>Worst airline experience</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified |  Worst airline experience I h...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-09</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>loss of our luggage</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified |  Had a terrible experience wi...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-05</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>they lost part of our luggage</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  On the trip into Marrakech, ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-12-24</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>lack of any sense of customer service</td>
      <td>2</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified |  Scheduled departure 11:25 am...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-12-24</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>connecting flight had left without us</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified |  Our destination was Freetown v...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-12-22</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>the worst travel experience</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified |  Been the worst travel experi...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-11-13</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>nobody gave us an explanation</td>
      <td>2</td>
      <td>2022-11-17</td>
      <td>no</td>
      <td>Not Verified |  Disappointing service, flight ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-11-07</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>staff were very polite and caring</td>
      <td>10</td>
      <td>2022-11-17</td>
      <td>yes</td>
      <td>Trip Verified | I had a first time flight wit...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-10-31</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>I would recommend this airline</td>
      <td>9</td>
      <td>2022-10-17</td>
      <td>yes</td>
      <td>Trip Verified |  This review relates to the s...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-10-31</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>very professional ground staff</td>
      <td>7</td>
      <td>2022-10-17</td>
      <td>yes</td>
      <td>Trip Verified |  I flew with Royal Air Maroc ...</td>
    </tr>
  </tbody>
</table>
</div>



British Airways Data Scraping (Europe)  
url: https://www.airlinequality.com/airline-reviews/british-airways/page/1/?sortby=post_date%3ADesc&pagesize=100


```python
base_url = f"https://www.airlinequality.com/airline-reviews/british-airways"
pagesize = 100
pages = 45
airline = f"BA"
region = f"Europe"

# Create an empty DataFrame
db = pd.DataFrame(columns=['Date', 'Region', 'Airline', 'Title', 'Rating', 'Date Flown', 'Recommended', 'Review'])

for i in range(1, pages+1):
    url = f"{base_url}/page/{i}/?sortby=post_date%3ADesc&pagesize={pagesize}"
    response = requests.get(url)
    content = response.content
    soup = BeautifulSoup(content, 'html.parser')

    for div in soup.find_all("article", itemprop="review"):
        
        rating = div.find("span", itemprop="ratingValue")
        rating = rating.text if rating else "N/A"
        
        title = div.find("h2", class_="text_header").get_text().strip('"')
        
        date = div.find("time", itemprop="datePublished")
        if date:
            date = parser.parse(date.text)
            date = date.strftime('%Y-%m-%d')
        else:
            date = "N/A"
        
        review = div.find("div", class_="text_content").get_text().strip('✅')
        
        traveller = div.find("td", class_="review-rating-header type_of_traveller")
        traveller = traveller.text if traveller else "N/A"
        
        tr = div.find("td", text="Date Flown")
        if tr:
            tr = tr.find_parent("tr")
            date_flown = tr.find("td", class_="review-value")
            date_flown = date_flown.text if date_flown else "N/A"
            if date_flown:
                date_flown = parser.parse(date_flown)
                date_flown = date_flown.strftime('%Y-%m-%d')
            else:
                date_flown = "N/A"
        else:
            date_flown = "N/A"

            
        tr = div.find("td", class_="review-rating-header recommended")
        if tr:
            tr = tr.find_parent("tr")
            recommended = tr.find("td", class_=lambda x: x and x.startswith("review-value rating-"))
            recommended = recommended.text if recommended else "N/A"
        else:
            recommended = "N/A"

            
        # Append the data to the DataFrame
        db_new_row = pd.DataFrame({'Region': [region],'Airline': [airline],'Rating': [rating], 'Title': [title], 'Date': [date], 'Review': [review], 'Date Flown': [date_flown], 'Recommended': [recommended]})
        db = pd.concat([db, db_new_row])

db.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Region</th>
      <th>Airline</th>
      <th>Title</th>
      <th>Rating</th>
      <th>Date Flown</th>
      <th>Recommended</th>
      <th>Review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2023-01-17</td>
      <td>Europe</td>
      <td>BA</td>
      <td>you should let me use the lounge</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  Being a silver flyer and boo...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>Europe</td>
      <td>BA</td>
      <td>I find BA incredibly tacky</td>
      <td>3</td>
      <td>2022-04-17</td>
      <td>no</td>
      <td>Not Verified |  I find BA incredibly tacky and...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-09</td>
      <td>Europe</td>
      <td>BA</td>
      <td>This flight was so disappointing</td>
      <td>4</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  Flew ATL to LHR 8th Jan 2023...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-08</td>
      <td>Europe</td>
      <td>BA</td>
      <td>just an average airline</td>
      <td>5</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified |  Great thing about British Airw...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-06</td>
      <td>Europe</td>
      <td>BA</td>
      <td>Luggage is delayed"</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Not Verified | The staff are friendly. The pla...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-02</td>
      <td>Europe</td>
      <td>BA</td>
      <td>the worst business class experience I've ever had</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified | Probably the worst business c...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-02</td>
      <td>Europe</td>
      <td>BA</td>
      <td>not recommended for business class</td>
      <td>2</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified | Definitely not recommended, e...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-02</td>
      <td>Europe</td>
      <td>BA</td>
      <td>surprisingly a good product</td>
      <td>8</td>
      <td>2023-01-17</td>
      <td>yes</td>
      <td>Trip Verified |  BA shuttle service across th...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-01</td>
      <td>Europe</td>
      <td>BA</td>
      <td>Maybe the old charm will return soon</td>
      <td>6</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified | I must admit like many others...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-12-30</td>
      <td>Europe</td>
      <td>BA</td>
      <td>having to pay to reserve a specific seat</td>
      <td>4</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified |  When will BA update their Busi...</td>
    </tr>
  </tbody>
</table>
</div>



United Airlines Data Scraping  
url: https://www.airlinequality.com/airline-reviews/united-airlines/page/1/?sortby=post_date%3ADesc&pagesize=100


```python
base_url = f"https://www.airlinequality.com/airline-reviews/united-airlines"
pagesize = 100
pages = 45
airline = f"UA"
region = f"America"

# Create an empty DataFrame
du = pd.DataFrame(columns=['Date', 'Region', 'Airline', 'Title', 'Rating', 'Date Flown', 'Recommended', 'Review'])

for i in range(1, pages+1):
    url = f"{base_url}/page/{i}/?sortby=post_date%3ADesc&pagesize={pagesize}"
    response = requests.get(url)
    content = response.content
    soup = BeautifulSoup(content, 'html.parser')

    for div in soup.find_all("article", itemprop="review"):
        
        rating = div.find("span", itemprop="ratingValue")
        rating = rating.text if rating else "N/A"
        
        title = div.find("h2", class_="text_header").get_text().strip('"')
        
        date = div.find("time", itemprop="datePublished")
        if date:
            date = parser.parse(date.text)
            date = date.strftime('%Y-%m-%d')
        else:
            date = "N/A"
        
        review = div.find("div", class_="text_content").get_text().strip('✅')
        
        traveller = div.find("td", class_="review-rating-header type_of_traveller")
        traveller = traveller.text if traveller else "N/A"
        
        tr = div.find("td", text="Date Flown")
        if tr:
            tr = tr.find_parent("tr")
            date_flown = tr.find("td", class_="review-value")
            date_flown = date_flown.text if date_flown else "N/A"
            if date_flown:
                date_flown = parser.parse(date_flown)
                date_flown = date_flown.strftime('%Y-%m-%d')
            else:
                date_flown = "N/A"
        else:
            date_flown = "N/A"

            
        tr = div.find("td", class_="review-rating-header recommended")
        if tr:
            tr = tr.find_parent("tr")
            recommended = tr.find("td", class_=lambda x: x and x.startswith("review-value rating-"))
            recommended = recommended.text if recommended else "N/A"
        else:
            recommended = "N/A"

            
        # Append the data to the DataFrame
        du_new_row = pd.DataFrame({'Region': [region],'Airline': [airline],'Rating': [rating], 'Title': [title], 'Date': [date], 'Review': [review], 'Date Flown': [date_flown], 'Recommended': [recommended]})
        du = pd.concat([du, du_new_row])

du.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Region</th>
      <th>Airline</th>
      <th>Title</th>
      <th>Rating</th>
      <th>Date Flown</th>
      <th>Recommended</th>
      <th>Review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2023-01-17</td>
      <td>America</td>
      <td>UA</td>
      <td>No more United Airlines</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  I'm speechless. This flight ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>America</td>
      <td>UA</td>
      <td>fantastic at a difficult time</td>
      <td>10</td>
      <td>2023-01-17</td>
      <td>yes</td>
      <td>Trip Verified |  Thanks to the United Airline...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>America</td>
      <td>UA</td>
      <td>horrible customer service</td>
      <td>1</td>
      <td>2022-10-17</td>
      <td>no</td>
      <td>Trip Verified |  One of the horrible experien...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-14</td>
      <td>America</td>
      <td>UA</td>
      <td>It was horrible</td>
      <td>4</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified |  I had to fly United to get bac...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-14</td>
      <td>America</td>
      <td>UA</td>
      <td>annoyed by the rudeness of the pilot</td>
      <td>3</td>
      <td>2022-10-17</td>
      <td>no</td>
      <td>Trip Verified |  I was not able to check in 2...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-13</td>
      <td>America</td>
      <td>UA</td>
      <td>This time definitely hit a new low</td>
      <td>3</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  We took a two week trip to T...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-13</td>
      <td>America</td>
      <td>UA</td>
      <td>cares nothing about good service</td>
      <td>1</td>
      <td>2022-10-17</td>
      <td>no</td>
      <td>Trip Verified |  Our plane was delayed in arr...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-12</td>
      <td>America</td>
      <td>UA</td>
      <td>don’t want to give us compensation</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified |  Cancel our flight after waitin...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-09</td>
      <td>America</td>
      <td>UA</td>
      <td>baggage transfer at Chicago</td>
      <td>3</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  I had a problem with the emp...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-06</td>
      <td>America</td>
      <td>UA</td>
      <td>absolute nightmare of an experience</td>
      <td>2</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  I was on a flight from Colum...</td>
    </tr>
  </tbody>
</table>
</div>



Qatar Airways Data Scraping  
url: https://www.airlinequality.com/airline-reviews/qatar-airways/page/1/?sortby=post_date%3ADesc&pagesize=100


```python
base_url = f"https://www.airlinequality.com/airline-reviews/qatar-airways"
pagesize = 100
pages = 22
airline = f"QTR"
region = f"Asia"

# Create an empty DataFrame
dq = pd.DataFrame(columns=['Date', 'Region', 'Airline', 'Title', 'Rating', 'Date Flown', 'Recommended', 'Review'])

for i in range(1, pages+1):
    url = f"{base_url}/page/{i}/?sortby=post_date%3ADesc&pagesize={pagesize}"
    response = requests.get(url)
    content = response.content
    soup = BeautifulSoup(content, 'html.parser')

    for div in soup.find_all("article", itemprop="review"):
        
        rating = div.find("span", itemprop="ratingValue")
        rating = rating.text if rating else "N/A"
        
        title = div.find("h2", class_="text_header").get_text().strip('"')
        
        date = div.find("time", itemprop="datePublished")
        if date:
            date = parser.parse(date.text)
            date = date.strftime('%Y-%m-%d')
        else:
            date = "N/A"
        
        review = div.find("div", class_="text_content").get_text().strip('✅')
        
        traveller = div.find("td", class_="review-rating-header type_of_traveller")
        traveller = traveller.text if traveller else "N/A"
        
        tr = div.find("td", text="Date Flown")
        if tr:
            tr = tr.find_parent("tr")
            date_flown = tr.find("td", class_="review-value")
            date_flown = date_flown.text if date_flown else "N/A"
            if date_flown:
                date_flown = parser.parse(date_flown)
                date_flown = date_flown.strftime('%Y-%m-%d')
            else:
                date_flown = "N/A"
        else:
            date_flown = "N/A"

            
        tr = div.find("td", class_="review-rating-header recommended")
        if tr:
            tr = tr.find_parent("tr")
            recommended = tr.find("td", class_=lambda x: x and x.startswith("review-value rating-"))
            recommended = recommended.text if recommended else "N/A"
        else:
            recommended = "N/A"

            
        # Append the data to the DataFrame
        dq_new_row = pd.DataFrame({'Region': [region],'Airline': [airline],'Rating': [rating], 'Title': [title], 'Date': [date], 'Review': [review], 'Date Flown': [date_flown], 'Recommended': [recommended]})
        dq = pd.concat([dq, dq_new_row])

dq.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Region</th>
      <th>Airline</th>
      <th>Title</th>
      <th>Rating</th>
      <th>Date Flown</th>
      <th>Recommended</th>
      <th>Review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2023-01-17</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>no choice of breakfast food</td>
      <td>4</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  I have flown them a few time...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-17</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>what a wonderful experience</td>
      <td>9</td>
      <td>2023-01-17</td>
      <td>yes</td>
      <td>Trip Verified |  My first time flying with Qa...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>seat didn't recline properly</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified |  After being stranded in CDG ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-15</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>An outstanding experience</td>
      <td>10</td>
      <td>2023-01-17</td>
      <td>yes</td>
      <td>Trip Verified |  An outstanding experience. I...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-15</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>great standard of service</td>
      <td>8</td>
      <td>2023-01-17</td>
      <td>yes</td>
      <td>Trip Verified | Check-in and security check a...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-09</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>Great staff, delicious food</td>
      <td>10</td>
      <td>2022-12-17</td>
      <td>yes</td>
      <td>Trip Verified | Awesome experience, Great sta...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-04</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>said it was a system failure</td>
      <td>3</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Not Verified | I booked my flight with a third...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-03</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>ruins the experience with Air Canada</td>
      <td>6</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified | Very frustrated that when you...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2023-01-03</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>family is really thankful to him</td>
      <td>10</td>
      <td>2022-12-17</td>
      <td>yes</td>
      <td>Trip Verified |  My flight was from Istanbul ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>2022-12-31</td>
      <td>Asia</td>
      <td>QTR</td>
      <td>given exit row without charges</td>
      <td>9</td>
      <td>2022-12-17</td>
      <td>yes</td>
      <td>Trip Verified |  Doha-Bangkok 29 Dec. 2022 on...</td>
    </tr>
  </tbody>
</table>
</div>




```python
dq.isnull().sum()
```




    Date           0
    Region         0
    Airline        0
    Title          0
    Rating         0
    Date Flown     0
    Recommended    0
    Review         0
    dtype: int64



Concatenating Data Vertically


```python
# Initialize an empty dataframe
df = pd.DataFrame()

# Merge the dataframes on a common column (e.g. 'id')
df = pd.concat([dm, db, du, dq], axis=0)
df.reset_index(drop=True, inplace=True)
# pattern = "|".join(["✅", "\n", "\r", "\t", "\0", "\x0b"])
# df.loc[:,"Review"] = df.loc[:,"Review"].str.replace(pattern, '', regex=True)
df['Review'] = df['Review'].str.replace('|', ':')

df['Review_Length'] = df['Review'].apply(len)


df.head(10)
```

    C:\Users\jbahr\AppData\Local\Temp\ipykernel_21980\2528980113.py:9: FutureWarning: The default value of regex will change from True to False in a future version. In addition, single character regular expressions will *not* be treated as literal strings when regex=True.
      df['Review'] = df['Review'].str.replace('|', ':')
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Region</th>
      <th>Airline</th>
      <th>Title</th>
      <th>Rating</th>
      <th>Date Flown</th>
      <th>Recommended</th>
      <th>Review</th>
      <th>Review_Length</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2023-01-16</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>Worst airline experience</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified :  Worst airline experience I h...</td>
      <td>1829</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2023-01-09</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>loss of our luggage</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified :  Had a terrible experience wi...</td>
      <td>335</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2023-01-05</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>they lost part of our luggage</td>
      <td>1</td>
      <td>2023-01-17</td>
      <td>no</td>
      <td>Trip Verified :  On the trip into Marrakech, ...</td>
      <td>808</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2022-12-24</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>lack of any sense of customer service</td>
      <td>2</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified :  Scheduled departure 11:25 am...</td>
      <td>421</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2022-12-24</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>connecting flight had left without us</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Not Verified :  Our destination was Freetown v...</td>
      <td>709</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2022-12-22</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>the worst travel experience</td>
      <td>1</td>
      <td>2022-12-17</td>
      <td>no</td>
      <td>Trip Verified :  Been the worst travel experi...</td>
      <td>827</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2022-11-13</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>nobody gave us an explanation</td>
      <td>2</td>
      <td>2022-11-17</td>
      <td>no</td>
      <td>Not Verified :  Disappointing service, flight ...</td>
      <td>256</td>
    </tr>
    <tr>
      <th>7</th>
      <td>2022-11-07</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>staff were very polite and caring</td>
      <td>10</td>
      <td>2022-11-17</td>
      <td>yes</td>
      <td>Trip Verified : I had a first time flight wit...</td>
      <td>326</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2022-10-31</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>I would recommend this airline</td>
      <td>9</td>
      <td>2022-10-17</td>
      <td>yes</td>
      <td>Trip Verified :  This review relates to the s...</td>
      <td>1048</td>
    </tr>
    <tr>
      <th>9</th>
      <td>2022-10-31</td>
      <td>Africa</td>
      <td>RAM</td>
      <td>very professional ground staff</td>
      <td>7</td>
      <td>2022-10-17</td>
      <td>yes</td>
      <td>Trip Verified :  I flew with Royal Air Maroc ...</td>
      <td>831</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 10292 entries, 0 to 10291
    Data columns (total 9 columns):
     #   Column         Non-Null Count  Dtype 
    ---  ------         --------------  ----- 
     0   Date           10292 non-null  object
     1   Region         10292 non-null  object
     2   Airline        10292 non-null  object
     3   Title          10292 non-null  object
     4   Rating         10292 non-null  object
     5   Date Flown     10292 non-null  object
     6   Recommended    10292 non-null  object
     7   Review         10292 non-null  object
     8   Review_Length  10292 non-null  int64 
    dtypes: int64(1), object(8)
    memory usage: 723.8+ KB
    

KPI: Reviews Length


```python
# Plot the sentiment counts as a bar chart
df['Review_Length'].plot.bar(xlabel='Review Length', ylabel='Number of Reviews',title='Distribution of Review Lengths')

# Show the plot
plt.show()
```

![png](airlines_files/airlines_16_0.png)
    

KPI: Reviews Sentiment


```python
review_sentiments = []
for index, row in df.iterrows():
    review = row["Review"]
    if pd.isnull(review) or review.strip() == "":
        review_sentiments.append(None)
    else:
        polarity = TextBlob(review).sentiment.polarity
        if polarity > 0:
            review_sentiments.append('Positive')
        elif polarity == 0:
            review_sentiments.append('Neutral')
        else:
            review_sentiments.append('Negative')

df['Review_Sentiments'] = pd.Series(review_sentiments)

# Count the number of reviews for each sentiment
sentiment_counts = df['Review_Sentiments'].value_counts()

# Plot the sentiment counts as a bar chart
sentiment_counts.plot.bar(xlabel='Sentiment', ylabel='Number of Reviews',title='Distribution of Sentiments')

# Show the plot
plt.show()
```
    
![png](airlines_files/airlines_18_0.png)
    

Exporting Data for Analysis with Power BI


```python
df.to_excel("D:\\airlines_reviews.xlsx", index=False)
```
