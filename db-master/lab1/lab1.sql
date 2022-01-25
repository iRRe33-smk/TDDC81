/*
Lab 1 report <Arvid Kronvall arvkr827 and Isak Berntsson isabe723>
*/


/*
Drop all user created tables that have been created when solving the lab
*/

DROP TABLE IF EXISTS jbsale_supply, igbitems, igbitemview, igbtotal, igbtotal2 CASCADE;


/* Have the source scripts in the file so it is easy to recreate!*/

SOURCE company_schema.sql;
SOURCE company_data.sql;

/*
Question: 1) List all employees, i.e. all tuples in the jbemployee relation
*/

SELECT * from jbemployee;

/* RESULTS
+------+--------------------+--------+---------+-----------+-----------+
| id   | name               | salary | manager | birthyear | startyear |
+------+--------------------+--------+---------+-----------+-----------+
|   10 | Ross, Stanley      |  15908 |     199 |      1927 |      1945 |
|   11 | Ross, Stuart       |  12067 |    NULL |      1931 |      1932 |
|   13 | Edwards, Peter     |   9000 |     199 |      1928 |      1958 |
|   26 | Thompson, Bob      |  13000 |     199 |      1930 |      1970 |
|   32 | Smythe, Carol      |   9050 |     199 |      1929 |      1967 |
|   33 | Hayes, Evelyn      |  10100 |     199 |      1931 |      1963 |
|   35 | Evans, Michael     |   5000 |      32 |      1952 |      1974 |
|   37 | Raveen, Lemont     |  11985 |      26 |      1950 |      1974 |
|   55 | James, Mary        |  12000 |     199 |      1920 |      1969 |
|   98 | Williams, Judy     |   9000 |     199 |      1935 |      1969 |
|  129 | Thomas, Tom        |  10000 |     199 |      1941 |      1962 |
|  157 | Jones, Tim         |  12000 |     199 |      1940 |      1960 |
|  199 | Bullock, J.D.      |  27000 |    NULL |      1920 |      1920 |
|  215 | Collins, Joanne    |   7000 |      10 |      1950 |      1971 |
|  430 | Brunet, Paul C.    |  17674 |     129 |      1938 |      1959 |
|  843 | Schmidt, Herman    |  11204 |      26 |      1936 |      1956 |
|  994 | Iwano, Masahiro    |  15641 |     129 |      1944 |      1970 |
| 1110 | Smith, Paul        |   6000 |      33 |      1952 |      1973 |
| 1330 | Onstad, Richard    |   8779 |      13 |      1952 |      1971 |
| 1523 | Zugnoni, Arthur A. |  19868 |     129 |      1928 |      1949 |
| 1639 | Choy, Wanda        |  11160 |      55 |      1947 |      1970 |
| 2398 | Wallace, Maggie J. |   7880 |      26 |      1940 |      1959 |
| 4901 | Bailey, Chas M.    |   8377 |      32 |      1956 |      1975 |
| 5119 | Bono, Sonny        |  13621 |      55 |      1939 |      1963 |
| 5219 | Schwarz, Jason B.  |  13374 |      33 |      1944 |      1959 |
+------+--------------------+--------+---------+-----------+-----------+
25 rows in set (0.00 sec)
*/ 

/*
Question: 2) List the name of all departments in alphabetical order. Note: by “name” we mean
the name attribute for all tuples in the jbdept relation
*/

SELECT name from jbdept ORDER BY name ASC;

/* RESULTS
+------------------+
| name             |
+------------------+
| Bargain          |
| Book             |
| Candy            |
| Children's       |
| Children's       |
| Furniture        |
| Giftwrap         |
| Jewelry          |
| Junior Miss      |
| Junior's         |
| Linens           |
| Major Appliances |
| Men's            |
| Sportswear       |
| Stationary       |
| Toys             |
| Women's          |
| Women's          |
| Women's          |
+------------------+
19 rows in set (0.00 sec)
*/

/*  
Question: 3) What parts are not in store, i.e. qoh = 0? (qoh = Quantity On Hand)
*/

SELECT name FROM jbparts WHERE qoh = 0;

/* RESULTS
+-------------------+
| name              |
+-------------------+
| card reader       |
| card punch        |
| paper tape reader |
| paper tape punch  |
+-------------------+
4 rows in set (0.00 sec)
*/

/* 
Question 4) 4) Which employees have a salary between 9000 (included) and 10000 (included)?
*/

SELECT name FROM jbemployee WHERE salary >= 9000 and salary <= 10000;

/* RESULTS
+----------------+
| name           |
+----------------+
| Edwards, Peter |
| Smythe, Carol  |
| Williams, Judy |
| Thomas, Tom    |
+----------------+
4 rows in set (0.00 sec)
*/

/* 
Question 5) What was the age of each employee when they started working (startyear)?
*/

SELECT name, startyear-birthyear AS "Starting age" FROM jbemployee;

/* RESULTS
+--------------------+--------------+
| name               | Starting age |
+--------------------+--------------+
| Ross, Stanley      |           18 |
| Ross, Stuart       |            1 |
| Edwards, Peter     |           30 |
| Thompson, Bob      |           40 |
| Smythe, Carol      |           38 |
| Hayes, Evelyn      |           32 |
| Evans, Michael     |           22 |
| Raveen, Lemont     |           24 |
| James, Mary        |           49 |
| Williams, Judy     |           34 |
| Thomas, Tom        |           21 |
| Jones, Tim         |           20 |
| Bullock, J.D.      |            0 |
| Collins, Joanne    |           21 |
| Brunet, Paul C.    |           21 |
| Schmidt, Herman    |           20 |
| Iwano, Masahiro    |           26 |
| Smith, Paul        |           21 |
| Onstad, Richard    |           19 |
| Zugnoni, Arthur A. |           21 |
| Choy, Wanda        |           23 |
| Wallace, Maggie J. |           19 |
| Bailey, Chas M.    |           19 |
| Bono, Sonny        |           24 |
| Schwarz, Jason B.  |           15 |
+--------------------+--------------+
25 rows in set (0.00 sec)
*/

/* 
Question: 6) Which employees have a last name ending with “son”?
*/

SELECT name FROM jbemployee WHERE name LIKE '%son,%';

/* RESULTS
+---------------+
| name          |
+---------------+
| Thompson, Bob |
+---------------+
1 row in set (0.00 sec)

/*
Question: 7) Which items (note items, not parts) have been delivered by a supplier called
Fisher-Price? Formulate this query using a subquery in the where-clause.
*/

SELECT name FROM jbitem WHERE supplier IN ( SELECT id FROM jbsupplier
WHERE name = 'Fisher-Price');

/*RESULTS
+-----------------+
| name            |
+-----------------+
| Maze            |
| The 'Feel' Book |
| Squeeze Ball    |
+-----------------+
3 rows in set (0.01 sec)
*/

/*
Question: 8) Formulate the same query as above, but without a subquery.
*/

SELECT A.name FROM jbitem A INNER JOIN jbsupplier B WHERE A.supplier = B.id AND B.id = 89;

/*RESULTS
+-----------------+
| name            |
+-----------------+
| Maze            |
| The 'Feel' Book |
| Squeeze Ball    |
+-----------------+
3 rows in set (0.01 sec)
*/

/*
Question: 9) Show all cities that have suppliers located in them. Formulate this query using a
subquery in the where-clause.
*/

SELECT name from jbcity WHERE id IN ( SELECT city FROM jbsupplier);

/* RESULTS
+----------------+
| name           |
+----------------+
| Amherst        |
| Boston         |
| New York       |
| White Plains   |
| Hickville      |
| Atlanta        |
| Madison        |
| Paxton         |
| Dallas         |
| Denver         |
| Salt Lake City |
| Los Angeles    |
| San Diego      |
| San Francisco  |
| Seattle        |
+----------------+
15 rows in set (0.00 sec)
*/

/* 
Question: 10) What is the name and color of the parts that are heavier than a card reader?
Formulate this query using a subquery in the where-clause. (The SQL query must
not contain the weight as a constant.)
*/

SELECT name, color FROM jbparts WHERE weight IN
( SELECT DISTINCT weight FROM jbparts WHERE name = 'card reader');

/* RESULTS
+--------------+--------+
| name         | color  |
+--------------+--------+
| disk drive   | black  |
| tape drive   | black  |
| line printer | yellow |
| card punch   | gray   |
+--------------+--------+
4 rows in set (0.00 sec)
*/

/*
Question: 11) Formulate the same query as above, but without a subquery. (The query must not
contain the weight as a constant.)
*/

SELECT p.name, p.color FROM jbparts AS p, jbparts AS c WHERE c.name = 'card reader' AND p.weight > c.weight;

/* RESULTS
+--------------+--------+
| name         | color  |
+--------------+--------+
| disk drive   | black  |
| tape drive   | black  |
| line printer | yellow |
| card punch   | gray   |
+--------------+--------+
4 rows in set (0.00 sec)
*/

/*
Question: 12) What is the average weight of black parts?
*/

SELECT AVG(weight) FROM jbparts WHERE color = 'black';

/* RESULTS
+-------------+
| AVG(weight) |
+-------------+
|    347.2500 |
+-------------+
1 row in set (0.00 sec)
*/

/*
Question: 13) What is the total weight of all parts that each supplier in Massachusetts (“Mass”)
has delivered? Retrieve the name and the total weight for each of these suppliers.
Do not forget to take the quantity of delivered parts into account. Note that one
row should be returned for each supplier.
*/

select distinct(supplier), sum(mass) over(partition by supplier)  as weight_per_supplier from (   select supplier, quantity*weight as mass from (   select jbsupply.supplier as supplier, jbsupply.quan as quantity, jbparts.weight as weight from jbsupply , jbparts where jbsupply.part = jbparts.id and supplier in (   select id from jbsupplier where city IN(    select id from jbcity where state = "Mass"))) as temp1) as temp2;

/* RESULTS
+----------+---------------------+
| supplier | weight_per_supplier |
+----------+---------------------+
|       89 |             1135000 |
|      475 |                3120 |
+----------+---------------------+
*/

/* 
Question: 14) Create a new relation (a table), with the same attributes as the table items using
the CREATE TABLE syntax where you define every attribute explicitly (i.e. not
as a copy of another table). Then fill the table with all items that cost less than the
average price for items. Remember to define primary and foreign keys in your
table
*/

create or replace table igbitems (id int not null,   primary key (ID),   name varchar(150),
dept int,   foreign key (dept) references jbdept(id),
price int,   qoh int,    supplier int,   foreign key (supplier) references jbsupplier(id));
SELECT * from jbitem where price < (select avg(price) from jbitem); 
SELECT * FROM igbitems;

/* RESULTS
+-----+-----------------+------+-------+------+----------+
| id  | name            | dept | price | qoh  | supplier |
+-----+-----------------+------+-------+------+----------+
|  11 | Wash Cloth      |    1 |    75 |  575 |      213 |
|  19 | Bellbottoms     |   43 |   450 |  600 |       33 |
|  21 | ABC Blocks      |    1 |   198 |  405 |      125 |
|  23 | 1 lb Box        |   10 |   215 |  100 |       42 |
|  25 | 2 lb Box, Mix   |   10 |   450 |   75 |       42 |
|  26 | Earrings        |   14 |  1000 |   20 |      199 |
|  43 | Maze            |   49 |   325 |  200 |       89 |
| 106 | Clock Book      |   49 |   198 |  150 |      125 |
| 107 | The 'Feel' Book |   35 |   225 |  225 |       89 |
| 118 | Towels, Bath    |   26 |   250 | 1000 |      213 |
| 119 | Squeeze Ball    |   49 |   250 |  400 |       89 |
| 120 | Twin Sheet      |   26 |   800 |  750 |      213 |
| 165 | Jean            |   65 |   825 |  500 |       33 |
| 258 | Shirt           |   58 |   650 | 1200 |       33 |
+-----+-----------------+------+-------+------+----------+
14 rows in set (0.00 sec)
*/

/* 
Question: 15) Create a view that contains the items that cost less than the average price for
items
*/

create or replace view igbitemview as  
select * from jbitem where price < (select avg(price) from jbitem); 
select * from igbitemview; 


/* RESULTS
+-----+-----------------+------+-------+------+----------+
| id  | name            | dept | price | qoh  | supplier |
+-----+-----------------+------+-------+------+----------+
|  11 | Wash Cloth      |    1 |    75 |  575 |      213 |
|  19 | Bellbottoms     |   43 |   450 |  600 |       33 |
|  21 | ABC Blocks      |    1 |   198 |  405 |      125 |
|  23 | 1 lb Box        |   10 |   215 |  100 |       42 |
|  25 | 2 lb Box, Mix   |   10 |   450 |   75 |       42 |
|  26 | Earrings        |   14 |  1000 |   20 |      199 |
|  43 | Maze            |   49 |   325 |  200 |       89 |
| 106 | Clock Book      |   49 |   198 |  150 |      125 |
| 107 | The 'Feel' Book |   35 |   225 |  225 |       89 |
| 118 | Towels, Bath    |   26 |   250 | 1000 |      213 |
| 119 | Squeeze Ball    |   49 |   250 |  400 |       89 |
| 120 | Twin Sheet      |   26 |   800 |  750 |      213 |
| 165 | Jean            |   65 |   825 |  500 |       33 |
| 258 | Shirt           |   58 |   650 | 1200 |       33 |
+-----+-----------------+------+-------+------+----------+
14 rows in set (0.00 sec)
*/

/* 
Question: 16) What is the difference between a table and a view? One is static and the other is
dynamic. Which is which and what do we mean by static respectively dynamic?
*/

/* ANSWER:
A view does not actually hold any data.
Any query into a view will be translated into a query into the underlying table, this means reduced performace. it also means the size(memory) of a view is just the size of its schema, as it does not contain data.
A view is characterized as dynamic, because running a query into the view may have different results each time. The underlying tables might change via inserts or deletions. A table is static, it will never change unless you explicitly tell it to. 

/* 
Question: 17) Create a view that calculates the total cost of each debit, by considering price and
quantity of each bought item. (To be used for charging customer accounts). The
view should contain the sale identifier (debit) and total cost. Use only the implicit
join notation, i.e. only use a where clause but not the keywords inner join, right
join or left join,
*/

create or replace view igbtotal2 as 
SELECT distinct(debit) ,account ,  sum(total)over(partition by debit) as total from( 
select jbsale.debit, jbsale.quantity, jbdebit.account, jbitem.price, jbsale.quantity*jbitem.price as total  from jbsale, jbdebit, jbitem 
where jbsale.debit = jbdebit.id and  jbsale.item = jbitem.id )as T; 

SELECT * FROM igbtotal2;


/*RESULTS
+--------+----------+-------+
| debit  | account  | total |
+--------+----------+-------+
| 100581 | 10000000 |  2050 |
| 100582 | 14356540 |  1000 |
| 100586 | 14096831 | 13446 |
| 100592 | 10000000 |   650 |
| 100593 | 11652133 |   430 |
| 100594 | 12591815 |  3295 |
+--------+----------+-------+
6 rows in set (0.00 sec)
*/

/* 
Question: 18) Do the same as in (17), using only the explicit join notation, i.e. using only left, right or inner joins but no join condition in a where clause. Motivate why you use the join you do (left, right or inner), and why this is the correct one (unlike the
others).
*/

/* Motivation: 
 we used left join. Because we wanted to keep all fields in jbsale and only the "joining" on from right table.
 */

create or replace view igbtotal as 
select distinct(debit) ,  sum(total)over(partition by debit) as total from( 
select jbsale.quantity,jbsale.debit, jbdebit.account, jbitem.price, jbsale.quantity*jbitem.price as total  from jbsale  
left join jbdebit on jbsale.debit = jbdebit.id 
left join jbitem on jbsale.item = jbitem.id) as T; 

SELECT * FROM igbtotal;

/* RESULTS
+--------+-------+
| debit  | total |
+--------+-------+
| 100581 |  2050 |
| 100582 |  1000 |
| 100586 | 13446 |
| 100592 |   650 |
| 100593 |   430 |
| 100594 |  3295 |
+--------+-------+
6 rows in set (0.00 sec)
*/

/* QUESTION: 19) Oh no! An earthquake!
a) Remove all suppliers in Los Angeles from the table jbsupplier. This will not
work right away (you will receive error code 23000) which you will have to
solve by deleting some other related tuples. However, do not delete more
tuples from other tables than necessary and do not change the structure of the
tables, i.e. do not remove foreign keys. Also, remember that you are only
allowed to use “Los Angeles” as a constant in your queries, not “199” or
“900”.
b) Explain what you did and why
*/

/* a) */
delete from jbsale where item and debit != 1337 in (select id from jbitem where supplier in ( select id from jbsupplier where  city = (select id from jbcity where name = "Los Angeles")));

delete from jbitem where supplier and id != 1337 in ( select id from jbsupplier where  city = (select id from jbcity where name = "Los Angeles"));

delete from jbsupplier where city = (select id from jbcity where name = "Los Angeles");


/* RESULTS
+-----+--------------+------+
| id  | name         | city |
+-----+--------------+------+
|   5 | Amdahl       |  921 |
|  15 | White Stag   |  106 |
|  20 | Wormley      |  118 |
|  33 | Levi-Strauss |  941 |
|  42 | Whitman's    |  802 |
|  62 | Data General |  303 |
|  67 | Edger        |  841 |
|  89 | Fisher-Price |   21 |
| 122 | White Paper  |  981 |
| 125 | Playskool    |  752 |
| 213 | Cannon       |  303 |
| 241 | IBM          |  100 |
| 440 | Spooley      |  609 |
| 475 | DEC          |   10 |
| 999 | A E Neumann  |  537 |
+-----+--------------+------+
15 rows in set (0.00 sec)
*/

/* b) 
we had to first delete the tables who recursively used supplier_ID as a key.
our method for doing this was to try and simply delete the suppliers from LA, and then let the error messages guide us upwards. the debit != 1337 clause was simply a way of dealing with the requirement of using a primary key in a delete query. We also dropped the table created in 14 as this used supplier.ID as a key.
*/

/* Question: 20) An employee has tried to find out which suppliers that have delivered items that
have been sold. He has created a view and a query that shows the number of items
sold from a supplier.
mysql> CREATE VIEW jbsale_supply(supplier, item, quantity) AS
 -> SELECT jbsupplier.name, jbitem.name, jbsale.quantity
 -> FROM jbsupplier, jbitem, jbsale
 -> WHERE jbsupplier.id = jbitem.supplier
 -> AND jbsale.item = jbitem.id;
Query OK, 0 rows affected (0.01 sec)
mysql> SELECT supplier, sum(quantity) AS sum FROM jbsale_supply
 -> GROUP BY supplier;
+--------------+---------------+
| supplier | sum(quantity) |
+--------------+---------------+
| Cannon | 6 |
| Levi-Strauss | 1 |
| Playskool | 2 |
| White Stag | 4 |
| Whitman's | 2 |
+--------------+---------------+
5 rows in set (0.00 sec)
11
The employee would also like include the suppliers which has delivered some
items, although for whom no items have been sold so far. In other words he wants
to list all suppliers, which has supplied any item, as well as the number of these
items that have been sold. Help him! Drop and redefine jbsale_supply to
consider suppliers that have delivered items that have never been sold as well.
Hint: The above definition of jbsale_supply uses an (implicit) inner join that
removes suppliers that have not had any of their delivered items sold.
*/

create or replace view Q20 as (select name, sum(quan) as sold from ( SELECT 
A.name as name , jbsale.quantity as quan FROM 
(SELECT jbsupplier.name, jbitem.id FROM jbsupplier, jbitem WHERE jbsupplier.id = jbitem.supplier)
as A LEFT JOIN jbsale ON jbsale.item = A.id ) as T group by name);

select * from Q20;

/* RESULTS
+--------------+------+
| name         | sold |
+--------------+------+
| Cannon       |    6 |
| Fisher-Price | NULL |
| Koret        |    1 |
| Levi-Strauss |    1 |
| Playskool    |    2 |
| White Stag   |    4 |
| Whitman's    |    2 |
+--------------+------+
7 rows in set (0.00 sec)
*/



