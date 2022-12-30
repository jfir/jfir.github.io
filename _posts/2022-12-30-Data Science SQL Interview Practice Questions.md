---
layout: post
categories: [ blog]
title: Data Science SQL Interview Practice Questions
subtitle: Practice the most common SQL questions which show up in Data Science & Data Analyst interviews!.
image: assets/img/My_Environment.png
thumbnail-img: assets/img/My_Environment.png
#cover-img: ["assets/img/My_Environment_Post.png" : "Caption of image", "assets/img/My_Environment_Post.png" : "Caption of image"]
tags: [SQL, Sqlite, VS Code, Markdown]
---

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
b { color: Blue }
</style>

<!--- -------Introduction-------- --->
As a data scientist, you will often be asked to demonstrate your SQL skills in interviews. This is because SQL is a critical tool for accessing, manipulating, and analyzing data in many data science projects. To prepare for a data science interview, it is important to practice your SQL skills and be able to answer a range of questions on different topics.

In this article, we will provide a selection of data science SQL interview practice questions, along with sample data and solutions. These questions are designed to help you prepare for a data science interview and get a better understanding of how to use SQL in a data science context. We will cover a range of topics, including data manipulation, data analysis, and SQL optimization.

Use the following tables to practice writing SQL queries.  

## Customers, Orders, and OrderItems Tables

Customers:

| CustomerID | Name          | Country |
|------------|---------------|---------|
| 1          | Alice Smith   | USA     |
| 2          | Bob Johnson   | USA     |
| 3          | Eve Williams  | USA     |
| 4          | Alice Johnson | Canada  |
| 5          | Bob Williams  | Canada  |
| 6          | Eve Smith     | Canada  |
| 7          | Alice Williams| UK      |
| 8          | Bob Smith     | UK      |
| 9          | Eve Johnson   | UK      |

Orders:

| OrderID | CustomerID | OrderDate | TotalValue |
|---------|------------|------------|------------|
| 1       | 1          | 2020-01-01 | 100        |
| 2       | 2          | 2020-01-01 | 200        |
| 3       | 3          | 2020-01-01 | 300        |
| 4       | 4          | 2020-01-01 | 400        |
| 5       | 5          | 2020-01-01 | 500        |
| 6       | 6          | 2020-01-01 | 600        |
| 7       | 7          | 2020-01-01 | 700        |
| 8       | 8          | 2020-01-01 | 800        |
| 9       | 9          | 2020-01-01 | 900        |
| 10      | 1          | 2020-02-01 | 100        |
| 11      | 2          | 2020-02-01 | 200        |
| 12      | 3          | 2020-02-01 | 300        |
| 13      | 4          | 2020-02-01 | 400        |
| 14      | 5          | 2020-02-01 | 500        |
| 15      | 6          | 2020-02-01 | 600        |
| 16      | 7          | 2020-02-01 | 700        |
| 17      | 8          | 2020-02-01 | 800        |
| 18      | 9          | 2020-02-01 | 900        |

OrderItems:

| OrderID | ProductID | Quantity |
|---------|-----------|----------|
| 1       | 1         | 1        |
| 2       | 1         | 2        |
| 3       | 1         | 3        |
| 4       | 2         | 4        |
| 5       | 2         | 5        |
| 6       | 2         | 6        |
| 7       | 3         | 7        |
| 8       | 3         | 8        |
| 9       | 3         | 9        |
| 10      | 1         | 1        |
| 11      | 1         | 2        |
| 12      | 1         | 3        |
| 13      | 2         | 4        |
| 14      | 2         | 5        |
| 15      | 2         | 6        |


```sql
SELECT *
FROM Customers
WHERE Country = 'USA';
```

### SQL Practice Questions

1. How would you retrieve the top 10 customers by total purchases?
    <details>
        <summary>Click to view the answer</summary>

            ```{sql}
                    SELECT *
                    FROM Customers
                    WHERE Country = 'USA'; 
            ```
    </details>

2. Write a query to find the average order value for each customer.

3. How would you find the customers who have placed more than 100 orders?

4. Write a query to find the most popular products (by number of orders).

5. How would you find the total number of orders for each product?

6. Write a query to find the customers who have not placed an order in the last 6 months.

7. How would you find the customers who have placed orders in the last 6 months but not in the last 3 months?

8. Write a query to find the total sales for each month.

9. How would you find the products that have never been ordered?

10. Write a query to find the average order value for each product category.

11. Write a query to find the customers who have placed orders in every month of the year.

12. How would you find the total number of orders for each product category?

13. Write a query to find the customers who have placed orders with a total value greater than $1,000.

14. How would you find the average order value for each customer, grouped by country?

15. Write a query to find the top 5 customers by total purchases, grouped by country.

16. How would you find the products that have been ordered by at least 50 different customers?

17. Write a query to find the average order value for each customer, for orders placed in the last 3 months.

18. How would you find the total number of orders for each product, grouped by month?

19. Write a query to find the customers who have placed orders with a total value greater than $500, grouped by country.

20. How would you find the average order value for each product, grouped by country?

21. List the names of all customers who have placed an order.

22. List the names of all customers who have placed more than one order.

23. List the names of all customers who have placed an order in the USA.
