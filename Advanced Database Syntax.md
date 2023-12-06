# Advanced Database Syntax
## Joins
### Inner Join
- This command selects records that have matching values in both tables. It returns only the rows where there is a match in the specified columns of both tables.
    ```SQL
    SELECT * 
    FROM t1
    INNER JOIN t2 ON t1.column_name = t2.column_name;
    ```
### Left Join
- This command returns all records from the left table (table1) and the matched records from the right table (table2). If there is no match, NULL values are returned for columns from the right table.
    ```SQL
    SELECT * 
    FROM t1 
    LEFT JOIN t2 ON t1.column_name = t2.column_name;
    ```
### Right Join
- This command returns all records from the right table (table2) and the matched records from the left table (table1). If there is no match, NULL values are returned for columns from the left table.
    ```SQL
    SELECT * 
    FROM t1 
    RIGHT JOIN t2 ON t2.column_name = t2.column_name;
    ```
### Full Join or Full Outer Join
- This command returns all records when there is a match in either the left (table1) or right (table2) table records. If there is no match, NULL values are returned for columns from the table without a match.
    ```SQL
    SELECT * 
    FROM t1 
    FULL JOIN t2 ON t2.column_name = t2.column_name;
    ```
### Cross Join
- This command returns the Cartesian product of the two tables. In other words, it returns all possible combinations of rows from both tables. It does not require a specific column to join on.
    ```SQL
    SELECT *
    FROM table1
    CROSS JOIN table2;
    ```
### Self Join
- A SELF JOIN is a regular join, but the table is joined with itself. It is used when you want to combine rows from the same table based on a related column.
    ```SQL
    SELECT * 
    FROM Employee e1
    JOIN Employee e2 ON e1.manager_id = e2.manager_id;```
## Subqueries
### Scalar Subquery
- A subquery that **returns a single value**. It can be used in a place where a single value is expected, such as in a `SELECT` list or a `WHERE` clause.
    ```SQL
    SELECT column1, (SELECT MAX(column2) FROM table2) AS max_value
    FROM table1;
    ```
### Row Subquery
- A subquery that **returns one or more rows of values**. It can be used in places where a list of values or a single value is expected.
    ```SQL
    SELECT column1
    FROM table1
    WHERE column2 IN (SELECT column2 FROM table2 WHERE condition);
    ```
### Table Subquery
- A subquery that returns a table. It can be used in places where a table is expected, such as in the `FROM` clause.
    ```SQL
    SELECT *
    FROM (SELECT column1, column2 FROM table1) AS subquery;
    ```
