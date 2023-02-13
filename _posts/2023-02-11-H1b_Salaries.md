---  
layout: post   
categories: [ blog, Portfolio]  
title: 'Unlocking 2022 H1B Visa Job Market Trends: A Data-Driven Guide to Making an Informed Career Decision' 
subtitle: Exploring Salaries and Market Trends for Data Science, Business Analyst, Big Data, and Quality Analyst Jobs 
image: assets/img/H1b.png 
thumbnail-img: assets/img/H1b.png 
#cover-img: ["assets/img/My_Environment_Post.png" : "Caption of image", "assets/img/My_Environment_Post.png" : "Caption of image"]  
tags: [Power BI, Python, Web Scraping, BeautifulSoup]  
---  
<style>  
r { color: Red }  
o { color: Orange }  
g { color: Green }  
b { color: Blue } 
f { font-size: 16px } 
</style>  
<!--- -------Introduction-------- --->  
This project proposes an analytical approach to exploring salary data for different job titles in the United States using data visualization tools such as Power BI. The data analyzed in this project is limited to 2022, and was collected from the source h1bdata.info using Python. The objective of the project is to gain valuable insights into the current job market and assist students and employees in making informed career decisions. The project is divided into 3 dashboards, each of which focuses on a specific aspect of job market analysis. Each dashboard will contain 3 to 4 graphs, maps, or pie charts, providing a visual representation of the salary data. Through a thorough examination of the data, we aim to answer questions regarding the average salaries for various job titles, how salaries vary by location, and the growth trends of specific job markets.


{: .box-warning}
**Note:** Importing necessary libraries.  

```python
import pandas as pd
from bs4 import BeautifulSoup
import requests
```


{: .box-warning}
**Note:** Scraping h1bdata website.  
**url:**  https://h1bdata.info


```python
# Create an empty DataFrame
df = pd.DataFrame(columns=['employer', 'job_title', 'salary', 'location', 'submit_date', 'start_date'])


# Setup of Source Data https://h1bdata.info/index.php?year={year}&job={job}
base_url = "https://h1bdata.info/index.php?"
job_titles = ["data+scientist", "senior+data+scientist", "data+analyst", "Big+Data", "machine+learning+engineer", "business+analyst", "Database+Engineer", "Quality+Assurance", "analyst", "qa+analyst", "quality+engineer", "data+engineer", "qa+engineer", "data+warehouse+specialist", "senior+analyst", "quality+analyst", "associate+data+scientist"]

for job in job_titles:
    for year in range(2018,2023):
        url = f"{base_url}&year={year}&job={job}"
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
**Note:** Result.  


|     |     employer	                    |    job_title      |	salary	|  location	         | submit_date	|  start_date  |
| --- | ----------------------------------- | --------------    | --------- | ------------------ | ------------ | ------------ |
|  1  | FORTRESS INFORMATION SECURITY LLC   | DATA SCIENTIST	| 45,980	| ORLANDO, FL	     | 04/09/2020	| 10/01/2020   |
|  2  | PERCOLATA CORPORATION	            | DATA SCIENTIST	| 46,060	| PALO ALTO, CA	     | 03/18/2016	| 09/02/2016   |
|  3  | MY LIFE REGISTRY LLC	            | DATA SCIENTIST	| 47,960	| FORT LEE, NJ	     | 02/18/2015	| 08/20/2015   |


{: .box-warning}
**Note:** Exporting Data for Analysis with Power BI.

```python
# Save file
from openpyxl import Workbook
df.to_excel("h1b_salaries.xlsx", index=False)
```

{: .box-warning}
**Note:** Power BI Analysis.
    
<iframe title="h1b_salaries" width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=b56f4a20-2a70-4d63-bb20-f0e4cf486e5e&autoAuth=true&ctid=db11c5e6-3fdd-486a-b831-4d10e1e5eb00" frameborder="0" allowFullScreen="true"></iframe>


In conclusion, this insightful data-driven study sheds light on the current state of the H1B visa job market in the United States, with a focus on four critical job categories: Data Science, Business Analyst, Big Data, and Quality Analyst. This project has the goal of providing valuable information and guidance to students and employees looking to make informed career decisions. Utilizing data visualization tools, the study presents a clear and concise representation of salary data analyzed from h1bdata.info using Python. This study addresses crucial questions regarding average salaries for different job titles, salary variations by location, and growth trends in specific job markets. The findings of this project will remain a valuable resource as the job market evolves and changes over time, making it a must-read for anyone pursuing a career in the United States.

