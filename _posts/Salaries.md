---  
layout: post   
categories: [ blog, Portfolio]  
title: 'Data-Driven Insights into 2022-2023 Job Market: Deciding the Best Career Path' 
subtitle: A Data Science Study on Job Market Trends and Salaries. 
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
f { font-size: 16px } 
</style>  
<!--- -------Introduction-------- --->  
This project proposes an analytical approach to exploring salary data for different job titles in the United States using data visualization tools such as Power BI. The data analyzed in this project is limited to the years 2022 and 2023, and was collected from the source h1bdata.info using the Python programming language. The objective of the project is to gain valuable insights into the current job market and assist students and employees in making informed career decisions. The project is divided into 4 dashboards, each of which focuses on a specific aspect of job market analysis. Each dashboard will contain 3 to 4 graphs, maps, or pie charts, providing a visual representation of the salary data. Through a thorough examination of the data, we aim to answer questions regarding the average salaries for various job titles, how salaries vary by location, and the growth trends of specific job markets.


{: .box-warning}
**Note:** Importing necessary libraries.  

```python
import pandas as pd
from bs4 import BeautifulSoup
import requests
```


{: .box-warning}
**Note:** Scraping Royal air Maroc Data (Africa).  
**url:**  https://www.airlinequality.com/airline-reviews/royal-air-maroc/page/1/?sortby=post_date%3ADesc&pagesize=100



```python
# Create an empty DataFrame
df = pd.DataFrame(columns=['employer', 'job_title', 'salary', 'location', 'submit_date', 'start_date'])

# Setup of Source Data
base_url = "https://h1bdata.info/index.php?em="
city = ""
job_titles = ["data+scientist", "Big+Data", "machine+learning+engineer", "business+analyst", "Database+Engineer", "Quality+Assurance"]

for job in job_titles:
    for year in range(2022,2023):
        url = f"{base_url}&job={job}&city={city}&year={year}"
        response = requests.get(url)
        content = response.content
        soup = BeautifulSoup(content, 'html.parser')
        # Find the table with class 'tablesorter tablesorter-blue hasStickyHeaders'
        table = soup.find('table', {'class': 'tablesorter tablesorter-blue hasStickyHeaders'})
        tbody = table.find('tbody')
        if tbody:
            # Find all rows in the table
            rows = tbody.find_all('tr')
            # Loop through each row
            for row in rows:    
                # Find all cells in the row
                cells = row.find_all(['td'])
                if len(cells) >= 6:
                    # Extract the text from each cell
                    employer = cells[0].text
                    job_title = cells[1].text
                    salary = cells[2].text
                    location = cells[3].text
                    submit_date = cells[4].text
                    start_date = cells[5].text
                else:
                    employer = 'NA'
                    job_title = 'NA'
                    salary = 'NA'
                    location = 'NA'
                    submit_date = 'NA'
                    start_date = 'NA'
                # Append the data to the DataFrame
                df_new_row = pd.DataFrame({'employer': [employer], 'job_title': [job_title], 'salary': [salary], 'location': [location], 'submit_date': [submit_date], 'start_date': [start_date]})
                df = pd.concat([df, df_new_row])

df.head(3)
```  


{: .box-warning}
Result.  


|     |     employer	                    |    job_title      |	salary	|  location	         | submit_date	|  start_date  |
| --- | ----------------------------------- | --------------    | --------- | ------------------ | ------------ | ------------ |
|  0  | FORTRESS INFORMATION SECURITY LLC   | DATA SCIENTIST	| 45,980	| ORLANDO, FL	     | 04/09/2020	| 10/01/2020   |
|  0  | PERCOLATA CORPORATION	            | DATA SCIENTIST	| 46,060	| PALO ALTO, CA	     | 03/18/2016	| 09/02/2016   |
|  0  | MY LIFE REGISTRY LLC	            | DATA SCIENTIST	| 47,960	| FORT LEE, NJ	     | 02/18/2015	| 08/20/2015   |


{: .box-warning}
**Note:** Scraping British Airways Data (Europe).  
**url:**  https://www.airlinequality.com/airline-reviews/british-airways/page/1/?sortby=post_date%3ADesc&pagesize=100



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

db.head(3)
```  

{: .box-warning}
Result.  


|     |     Date   | Region | Airline |        Title       | Rating | Date Flown | Recommended |        Review       |
| --- | ---------- | ------ | ------- | ------------------ | ------ | ---------- | ----------- | ------------------- |
| 1   | 2023-01-21 | Europe | BA      | flight the worst   |    2   | 2022-12-23 |     no      | Trip Verified  - ...|
| 2   | 2023-01-19 | Europe | BA      | race to the bottom |    3   | 2023-01-23 |     no      | Not Verified \|...  |
| 3   | 2023-01-19 | Europe | BA      | ticket and rebook  |    2   | 2023-01-23 |     no      | Not Verified \|...  |



{: .box-warning}
**Note:** Scraping United Airlines Data (USA).  
**url:**  https://www.airlinequality.com/airline-reviews/united-airlines/page/1/?sortby=post_date%3ADesc&pagesize=100



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

du.head(3)
```  

{: .box-warning}
Result.  

|     |     Date   | Region  | Airline |        Title          | Rating | Date Flown | Recommended |        Review       |
| --- | ---------- | ------- | ------- | --------------------- | ------ | ---------- | ----------- | ------------------- |
| 1   | 2023-01-23 | America | UA      | absolutely horrible   |    1   | 2023-01-23 |     no      | Trip Verified  - ...|
| 2   | 2023-01-23 | America | UA      | disappointment        |    1   | 2023-01-23 |     no      | Not Verified \|...  |
| 3   | 2023-01-21 | America | UA      | never travel United   |    1   | 2023-01-23 |     no      | Trip Verified \|... |



{: .box-warning}
**Note:** Scraping Qatar Airways Data (ASIA).  
**url:**  https://www.airlinequality.com/airline-reviews/qatar-airways/page/1/?sortby=post_date%3ADesc&pagesize=100



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

dq.head(3)
```

{: .box-warning}
Result.  


|     |     Date   | Region  | Airline |        Title          | Rating | Date Flown | Recommended |        Review       |
| --- | ---------- | ------- | ------- | --------------------- | ------ | ---------- | ----------- | ------------------- |
| 1   | 2023-01-23 | Asia    | QTR     | exceptional           |    10  | 2023-01-23 |     yes     | Trip Verified  - ...|
| 2   | 2023-01-18 | Asia    | QTR     | elderly A330          |    5   | 2023-01-23 |     no      | Trip Verified \|... |
| 3   | 2023-01-17 | Asia    | QTR     | choice of breakfast   |    4   | 2023-01-23 |     no      | Trip Verified \|... |


{: .box-warning}
**Note:** Concatenating Data Vertically.



```python
# Initialize an empty dataframe
df = pd.DataFrame()

# Merge the dataframes on a common column (e.g. 'id')
df = pd.concat([dm, db, du, dq], axis=0)
df.reset_index(drop=True, inplace=True)

# Clean Special Caracter
df['Review'] = df['Review'].str.replace('|', ':', regex=True)

#KPI: Reviews Length
df['Review_Length'] = df['Review'].apply(len)


df.head(3)
```

{: .box-warning}
Result.  


|     |     Date   | Region  | Airline |        Title          | Rating | Date Flown | Recommended |        Review       |
| --- | ---------- | ------- | ------- | --------------------- | ------ | ---------- | ----------- | ------------------- |
| 1   | 2023-01-23 | Africa  | QTR     | very unhelpful        |    1   | 2022-05-23 |     no      | Not Verified   - ...|
| 2   | 2023-01-16 | Africa  | QTR     | Worst experience      |    1   | 2022-12-23 |     no      | Trip Verified \|... |
| 3   | 2023-01-09 | Africa  | QTR     | loss of our luggage   |    1   | 2022-12-23 |     no      | Trip Verified \|... |



{: .box-warning}
**Note:** Histogram Plot of the Distribution of Review Lengths.



```python
# Histogram Plot of the Distribution of Review Lengths
df['Review_Length'].plot.hist(bins=10, xlabel='Review Length', ylabel='Number of Reviews',title='Distribution of Review Lengths')

# Show the plot
plt.show()
```


    
![png](https://nestquest.com/assets/img/airlines_output1.png)
    


{: .box-warning}
**Note:** KPI: Reviews Sentiment.



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


    
![png](https://nestquest.com/assets/img/airlines_output2.png)
    


{: .box-warning}
**Note:** Exporting Data for Analysis with Power BI.



```python
df.to_excel("D:\\airlines_reviews.xlsx", index=False)
```

![png](https://nestquest.com/assets/img/airlines_powerbi.png)

