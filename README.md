# DATA-ANALYSIS-WITH-COMPLEX-QUERIES

COMPANY: CODTECH IT SOLUTIONS

NAME: Marachu Ganesh

INTERN ID:CT06DL1050

DOMAIN: SQL

DURATION: 6 WEEEKS

MENTOR: NEELA SANTOSH

# DATA-ANALYSIS-WITH-COMPLEX-QUERIES

In this task, I worked with more advanced features of SQL such as **window functions**, **common table expressions (CTEs)**, and **subqueries**. The aim was to build on foundational SQL concepts and simulate real-world data analysis tasks such as ranking, aggregation, and filtering based on computed metrics. The operations were performed using a sample database schema consisting of two tables: `Staff` and `Transactions`.

The setup began by creating the two tables. The `Staff` table stores information about employees, including a unique ID, full name, and department. The `Transactions` table contains records of financial transactions linked to staff members through a foreign key reference. Each transaction has a transaction ID, the ID of the staff member who performed it, the transaction amount, and the date of the transaction.

Once the schema was created, I inserted sample data to simulate actual transactions performed by staff members across different departments. After setting up the data, the core part of the task involved writing and executing various types of SQL queries that use advanced features.

The first query involved the use of a **Common Table Expression (CTE)** combined with the `RANK()` window function. This query ranked each transaction performed by a staff member in descending order of amount, allowing us to see the highest-value transactions per employee. The use of CTE made the query more readable and modular. This kind of ranking operation is extremely useful in business scenarios like identifying top-performing employees or highlighting top sales per department.

In the second query, I used the `AVG()` window function partitioned by staff ID to calculate the **average transaction amount per staff member**. Unlike a regular `GROUP BY` query, window functions do not collapse the result set but instead retain the individual rows, making it possible to display both the raw data and the aggregated values together. This is valuable when generating reports that need to show both individual records and summaries.

The third query used a **subquery** along with a window function to compute the **overall average transaction amount** and then filtered for transactions that were above this average. This helped simulate real-world analytics where we are often required to filter or flag entries based on dynamic, computed thresholds rather than hardcoded values.

In the fourth and final query, the `ROW_NUMBER()` window function was used to assign a unique row number to each transaction per staff member, ordered by date. This technique is commonly used for pagination, sequential numbering, or identifying the most recent or earliest records per entity.

For all queries, I used **Visual Studio Code** to write and run the SQL scripts, connected to a **MySQL Server** backend. The database was initially designed and visualized using **MySQL Workbench**, which also helped in verifying schema relationships and data integrity.

This task helped deepen my understanding of SQL beyond basic SELECT and JOIN queries. I learned how to work with ranked datasets, perform advanced filtering, and analyze data trends using window functions. These skills are highly applicable in data analytics, business intelligence, and backend development, where efficient and readable SQL queries are essential.

Overall, Task 2 was a valuable experience in understanding how SQL can be used not just to retrieve data, but also to analyze and structure it in ways that directly support decision-making and insights generation. This task also sets the stage for exploring even more complex SQL topics such as recursive CTEs, stored procedures, and performance optimization in future tasks.

