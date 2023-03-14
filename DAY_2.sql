
 # WHERE CLAUSE --------------------------------------

/*
The following shows the syntax of the WHERE clause:

SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;

    
# Operator Description

=	Equal to. You can use it with almost any data types.
<> or !=	Not equal to ==
<	Less than. You typically use it with numeric and date/time data types.
>	Greater than.
<=	Less than or equal to
>=	Greater than or equal to


# filtering cluase 

1. AND    # c1, c2, c3
2. OR     # c1:B.E C2:tybsc
3. LIKE   # similar last frist (single pattern)
4. IN     # if you multiple (1,2,3,4,5)
5. BETWEEN # between 12 and 34
6. LIMIT   # limit no of  records to display
7. IS NULL # to check missing values 

*/



# 1. find all employees whose job titles are Sales Rep:
---------------------------------------------

SELECT 
    employeeNumber, firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep' 
ORDER BY firstName;


# 2. find employees whose job titles 
# are Sales Rep and office codes 1
---------------------------------------------
 
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
    

# 3. finds employees whose job title is Sales Rep or 
# employees who locate
# the office with office code 1:
---------------------------------------------
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;

# 4. finds employees whose last names end with the string 'son':
---------------------------------------------

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'  
ORDER BY firstName;

# 5 To find employees whose first names start with  T, 
# end with m, and contain any single character between e.g., Tom , Tim 
---------------------------------------------

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    firstName LIKE 'T_m'  
ORDER BY firstName;

# 6. find all employees whose last names contain on
# 1 %
# 2. _
---------------------------------------------

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%on%'   
ORDER BY firstName;
---------------------------------------------

# 7. finds customers who locate in 
# California, USA, and have the credit limit greater than 100K.
---------------------------------------------
SELECT    
	customername, 
	country, 
	state, 
	creditlimit
FROM    
	customers
WHERE country = 'USA'
	and state = 'CA'
	AND creditlimit > 100000;

# 8. finds customers who locate in 
# California or USA, and have the credit limit greater than 10K.
---------------------------------------------


SELECT 
    customername, country, creditLimit
FROM
    customers
WHERE
    country = 'USA'
        or state = 'CA'
        AND creditlimit > 10000;
        
        
# 9. select orders from givin order number (10165,10287,10310)
---------------------------------------------

SELECT 
    *
FROM
    orders
WHERE
    orderNumber IN (10165 , 10287, 10310);


    
# 10. find products whose buy prices us between  90 and 100:
---------------------------------------------

SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;  

 -- buyPrice >= 90 AND buyPrice <= 100;
 
 
 # 11. find top five customers who have the highest credit:
----------------------------------------------------

SELECT 
   *
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;
 
 # 12.  find customers who do not have a sales representative
 ----------------------------------------------------
select * from customers;
 
SELECT 
    customerName, country, salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber  IS  NULL
ORDER BY customerName;
    

    
 # 13.  find customers who have a sales representative
  ----------------------------------------------------
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
    customerName;