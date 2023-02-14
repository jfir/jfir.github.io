---
layout: post
categories: [ blog]
title: Ace Your Data Science Interview with SQL, Practice Questions and Tips
subtitle: Prepare for Data Analytics Interviews by Mastering SQL Concepts and Sample Questions!.
image: assets/img/sql.png
thumbnail-img: assets/img/sql.png
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

In this article, I will provide a selection of data science SQL interview practice questions, along with sample data and solutions. These questions are designed to help you prepare for a data science interview and get a better understanding of how to use SQL in a data science context. We will cover a range of topics, including data manipulation, data analysis, and SQL optimization.

Use the following tables to practice writing SQL queries.  

## Customers, Orders, and OrderItems Tables

Customers table:

| customer_id	| first_name	| last_name	|     email	   | phone_number |
|-----------__|-------------|-----------|--------------|--------------|
| 1	| Ahmed	| Ali	| ahmed.ali@example.com	| 555-1234 |
| 2	| Fatima	| Rahman	| fatima.rahman@example.com	| 555-5678 |
| 3	| Jacob	| Levy	| jacob.levy@example.com	| 555-2468 |
| 4	| Malik	| Jackson	| malik.jackson@example.com	| 555-3698 |
| 5	| Michaela	| Gomez	| michaela.gomez@example.com	| 555-9876 |
| 6	| Omar	| Rodriguez	| omar.rodriguez@example.com	| 555-2345 |
| 7	| Rachel	| Cohen	| rachel.cohen@example.com	| 555-6789 |
| 8	| Sofia	| Torres	| sofia.torres@example.com	| 555-1357 |
| 9	| Yusuf	| Ali	| yusuf.ali@example.com	| 555-4801 |
| 10	| Zara	| Patel	| zara.patel@example.com	| 555-9012 |

Flights table:

| flight_id | origin | destination | fare | flight_date | num_passengers | flight_hour | trip_type | purchase_lead | length_of_stay | flight_day | route | sales_channel | booking_complete |
|-----------|------------------|-----------------|-------|------------|----------------|---------------|-----------|---------------|----------------|-------------|------------|-------------|----------------|------------------|
| UA100006 | LAX | ORD | 200 | 2023-03-20 | 1 | Direct | One-way | 10 | 2 | 13 | Sunday | LAX-ORD | Web | Yes |
| DL100007 | LAX | JFK | 375 | 2023-03-21 | 2 | Direct | Roundtrip | 14 | 7 | 10 | Monday | LAX-JFK | Mobile | Yes |
| AC100008 | YYZ | JFK | 425 | 2023-03-22 | 3 | Travel Agent | Roundtrip | 7 | 5 | 7 | Tuesday | YYZ-JFK | Travel Agent | Yes |
| BA100009 | JFK | LHR | 500 | 2023-03-23 | 1 | Direct | One-way | 21 | 2 | 14 | Wednesday | JFK-LHR | Web | Yes |
| UA100010 | LHR | SFO | 700 | 2023-03-24 | 4 | Direct | Roundtrip | 21 | 10 | 16 | Thursday | LHR-SFO | Mobile | Yes |
| DL100011 | JFK | LAX | 325 | 2023-03-25 | 2 | Direct | One-way | 7 | 2 | 9 | Friday | JFK-LAX | Web | Yes |
| AC100012 | LAX | LHR | 600 | 2023-03-26 | 1 | Direct | One-way | 14 | 3 | 12 | Saturday | LAX-LHR | Travel Agent | Yes |
| BA100013 | LHR | JFK | 375 | 2023-03-27 | 2 | Direct | Roundtrip | 21 | 7 | 6 | Sunday | LHR-JFK | Web | Yes |
| UA100014 | JFK | SFO | 450 | 2023-03-28 | 3 | Direct | Roundtrip | 14 | 5 | 8 | Monday | JFK-SFO | Mobile | Yes |
| AC100015 | YYZ | JFK | 275 | 2023-03-29 | 1 | Direct | One-way | 7 | 1 | 13 | Tuesday | YYZ-JFK | Web | Yes |
| DL100016 | LAX | JFK | 375 | 2023-03-30 | 2 | Direct | Roundtrip | 21 | 7 | 11 | Wednesday | LAX-JFK | Mobile | Yes |
| UA100017 | LHR | ORD | 350 | 2023-03-31 | 3 | Direct | Roundtrip | 30 | 5 |
| UA100007 | JFK | LAX | 150 | 2023-04-05 | 2 | Direct | Round-trip | 8 | 4 | 14 | Tuesday | JFK-LAX | Mobile | Yes |
| UA100008 | ORD | DFW | 120 | 2023-05-02 | 1 | Non-stop | One-way | 5 | 1 | 11 | Thursday | ORD-DFW | Web | Yes |
| UA100009 | DEN | MIA | 180 | 2023-06-15 | 2 | Direct | Round-trip | 12 | 3 | 12 | Wednesday | DEN-MIA | Mobile | No |
| UA100010 | LGA | ATL | 110 | 2023-07-01 | 1 | Non-stop | One-way | 6 | 1 | 10 | Friday | LGA-ATL | Web | Yes |
| UA100011 | SFO | SEA | 90 | 2023-08-19 | 1 | Non-stop | One-way | 2 | 1 | 8 | Sunday | SFO-SEA | Mobile | No |
| UA100012 | MSP | LAX | 200 | 2023-09-10 | 2 | Direct | Round-trip | 7 | 3 | 15 | Tuesday | MSP-LAX | Web | Yes |
| UA100013 | DCA | BOS | 75 | 2023-10-07 | 1 | Non-stop | One-way | 4 | 1 | 7 | Friday | DCA-BOS | Mobile | Yes |
| UA100014 | SFO | JFK | 250 | 2023-11-15 | 2 | Direct | Round-trip | 10 | 4 | 16 | Tuesday | SFO-JFK | Web | No |
| UA100015 | LAX | IAH | 140 | 2023-12-01 | 1 | Non-stop | One-way | 3 | 1 | 9 | Thursday | LAX-IAH | Mobile | No |
| UA100016 | MCO | PHL | 110 | 2024-01-20 | 1 | Non-stop | One-way | 2 | 1 | 8 | Sunday | MCO-PHL | Web | Yes |

OrderItems:

| order_id	| customer_id	| flight_id	| order_date	| total_amount	| payment_status	|
| 1	| 2	| DL100007	| 2023-03-10	| 750	| Paid	|
| 2	| 4	| BA100009	| 2023-03-12	| 500	| Paid	|
| 3	| 6	| AC100012	| 2023-03-14	| 600	| Paid	|
| 4	| 3	| AC100008	| 2023-03-16	| 1275	| Paid	|
| 5	| 8	| BA100013	| 2023-03-18	| 750	| Paid	|
| 6	| 5	| UA100010	| 2023-03-20	| 2800	| Paid	|
| 7	| 1	| UA100006	| 2023-03-22	| 200	| Paid	|
| 8	| 10	| AC100015	| 2023-03-24	| 275	| Paid	|
| 9	| 7	| DL100011	| 2023-03-26	| 650	| Paid	|
| 10	| 9	| YYZ-JFK	| 2023-03-28	| 275	| Paid	|
| 11	| 4	| UA100017	| 2023-03-30	| 1050	| Unpaid	|
| 12	| 2	| UA100007	| 2023-04-02	| 300	| Paid	|
| 13	| 1	| UA100008	| 2023-04-05	| 120	| Paid	|
| 14	| 9	| UA100010	| 2023-07-01	| 220	| Unpaid	|

### SQL Script

{: .box-warning}
SELECT *
FROM Customers
WHERE Country = 'USA';

### SQL Practice Questions

###### Q1: How would you retrieve the top 10 customers by total purchases?

<details>
  <summary>A1:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q2: Write a query to find the average order value for each customer.

<details>
  <summary>A2:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q3: How would you find the customers who have placed more than 100 orders?

<details>
  <summary>A3:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q4: Write a query to find the most popular products (by number of orders).

<details>
  <summary>A4:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q5: Write a query to find the most popular products (by number of orders).

<details>
  <summary>A5:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q6: How would you find the total number of orders for each product?

<details>
  <summary>A6:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q7: Write a query to find the customers who have not placed an order in the last 6 months.

<details>
  <summary>A7:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q8: How would you find the customers who have placed orders in the last 6 months but not in the last 3 months?

<details>
  <summary>A8:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q9: Write a query to find the total sales for each month.

<details>
  <summary>A9:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q10: How would you find the products that have never been ordered?

<details>
  <summary>A10:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q11: Write a query to find the average order value for each product category.

<details>
  <summary>A11:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q12: Write a query to find the customers who have placed orders in every month of the year.

<details>
  <summary>A12:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q13: How would you find the total number of orders for each product category?

<details>
  <summary>A13:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q14: Write a query to find the customers who have placed orders with a total value greater than $1,000.

<details>
  <summary>A14:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q15: How would you find the average order value for each customer, grouped by country?

<details>
  <summary>A15:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q16: Write a query to find the top 5 customers by total purchases, grouped by country.

<details>
  <summary>A16:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q17: How would you find the products that have been ordered by at least 50 different customers?

<details>
  <summary>A17:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q18: Write a query to find the average order value for each customer, for orders placed in the last 3 months.

<details>
  <summary>A18:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q19: How would you find the total number of orders for each product, grouped by month?

<details>
  <summary>A19:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q20: Write a query to find the customers who have placed orders with a total value greater than $500, grouped by country.

<details>
  <summary>A20:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q21: How would you find the average order value for each product, grouped by country?

<details>
  <summary>A21:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q22: List the names of all customers who have placed an order.

<details>
  <summary>A22:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q23: List the names of all customers who have placed more than one order.

<details>
  <summary>A23:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---

###### Q24: List the names of all customers who have placed an order in the USA.

<details>
  <summary>A24:</summary>
  SELECT * FROM Customers WHERE Country = 'USA';
</details>

---
