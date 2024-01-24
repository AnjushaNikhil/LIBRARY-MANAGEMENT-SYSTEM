/*Module End Project
Topic : Library Management System
You are going to build a project based on the Library Management System.
 It keeps track of all information about books in the library, their cost, status and total number of books available in the library.
Create a database named library and the following TABLES in the database:
1. Branch
2. Employee
3. Books
4. Customer
5. IssueStatus
6. ReturnStatus
Attributes for the tables:
1. Branch
Branch_no - Set as PRIMARY KEY 
Manager_Id 
Branch_address 
Contact_no
2. Employee 
Emp_Id – Set as PRIMARY KEY 
Emp_name 
Position 
Salary
Branch_no - Set as FOREIGN KEY and it refers to the Branch_no in the Branch table 
3. Books 
ISBN - Set as PRIMARY KEY 
Book_title 
Category 
Rental_Price 
Status [Give yes if book available and no if book not available] 
Author 
Publisher
4. Customer 
Customer_Id - Set as PRIMARY KEY 
Customer_name 
Customer_address 
Reg_date
5. IssueStatus 
Issue_Id - Set as PRIMARY KEY 
Issued_cust – Set as FOREIGN KEY and it refers to the customer_id in the CUSTOMER table  
Issued_book_name
Issue_date
Isbn_book – Set as FOREIGN KEY and it should refer to isbn in BOOKS table
6. ReturnStatus 
Return_Id - Set as PRIMARY KEY 
Return_cust 
Return_book_name 
Return_date 
Isbn_book2 - Set as FOREIGN KEY and it should refer to isbn in BOOKS table
Display all the tables and Write the queries for the following :
1. Retrieve the book title, category, and rental price of all available books.
2. List the employee names and their respective salaries in descending order of salary.
3. Retrieve the book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books in the month of June 2023.
9. Retrieve the book_title from the book table containing history.
10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees */

create database library;

use library;

create table Branch(
Branch_no int  PRIMARY KEY,
Manager_id int,
Branch_address varchar(100),
Contact_no int);

INSERT INTO Branch VALUES
 (1, 101, '123 Main St', 5551234),
  (2, 102, '456 Oak St', 5555678),
  (3, 103, '789 Pine St',5559012),
  (4, 104, '101 Elm St', 5553456),
  (5, 105, '202 Maple Ave',5557890),
  (6, 106, '303 Birch Ln', 5552345),
  (7, 107, '404 Cedar Rd', 5556789),
  (8, 108, '505 Walnut Dr', 5551234),
  (9, 109, '606 Spruce Ct', 5555678),
  (10, 110, '707 Fir Blvd', 5559012);
  

select * from Branch;
drop table branch;

create table Employee(
Emp_Id int PRIMARY KEY ,
Emp_name varchar(30) not null,
Position varchar(20) not null,
Salary decimal(10,2),
Branch_no int,
FOREIGN KEY(Branch_no) REFERENCES Branch(Branch_no));

INSERT INTO Employee VALUES
  (001, 'John Doe', 'Manager', 60000, 1),
  (002, 'Jane Smith', 'Clerk', 40000, 1),
  (003, 'Bob Johnson', 'Assistant Manager', 50000, 1),
  (004, 'Alice Williams', 'Librarian', 45000, 2),
  (005, 'Charlie Brown', 'Clerk', 40000, 3),
  (006, 'Diana Davis', 'Assistant Manager', 52000, 3),
  (007, 'Edward Evans', 'Librarian', 46000, 4),
  (008, 'Frank Fisher', 'Clerk', 41000, 4),
  (009, 'Grace Green', 'Manager', 65000, 4),
  (010, 'Harry Harris', 'Clerk', 42000, 5),
  (011, 'Ivy White', 'Manager', 60000.00, 1),
  (012, 'Jack Jones', 'Assistant Manager', 52000.00, 1),
  (013, 'Karen King', 'Clerk', 40000.00, 1),
  (014, 'Larry Lee', 'Librarian', 45000.00, 2),
  (015, 'Megan Miller', 'Manager', 65000.00, 3),
  (016, 'Nathan Nelson', 'Assistant Manager', 52000.00, 4),
  (017, 'Olivia Olson', 'Clerk', 40000.00, 4),
  (018, 'Peter Parker', 'Librarian', 46000.00, 4),
  (019, 'Quincy Quinn', 'Manager', 60000.00, 5),
  (020, 'Rachel Rogers', 'Clerk', 41000.00, 5);

select * from Employee;


create table Books(
ISBN int PRIMARY KEY,
Book_title varchar(100) not null,
Category varchar(50),
Rental_Price decimal(8,2),
Status Enum('Yes','no') Not null,
Author varchar(100),
Publisher varchar(100));

INSERT INTO Books VALUES
  ('1001', 'The Catcher in the Rye', 'Fiction', 3.99, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
  ('1002', 'To Kill a Mockingbird', 'Fiction', 4.99, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
  ('1003', '1984', 'Dystopian', 5.99, 'Yes', 'George Orwell', 'Secker & Warburg'),
  ('1004', 'The Great Gatsby', 'Classic', 3.99, 'No', 'F. Scott Fitzgerald', 'Scribner'),
  ('1005', 'The Hobbit', 'Fantasy', 6.99, 'Yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
  ('1006', 'The Renaissance: Art and Culture', 'History', 14.50, 'no', 'Michael Renaissance Scholar', 'Artistic Books'),
  ('1007', 'The Da Vinci Code', 'Mystery', 7.99, 'No', 'Dan Brown', 'Doubleday'),
  ('1008', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 6.99, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
  ('1009', 'The History of Ancient Civilizations', 'History', 12.99, 'yes', 'John Historian', 'Academic Press'),
  ('1010', 'The Hunger Games', 'Science Fiction', 5.99, 'No', 'Suzanne Collins', 'Scholastic');

select * from Books;

create table Customer(
Customer_Id  int PRIMARY KEY,
Customer_name varchar(20) not null,
Customer_address varchar(200),
Reg_date date);

INSERT INTO Customer VALUES
  (1, 'Alice Johnson', '123 Main St', '2021-01-01'),
  (2, 'Bob Smith', '456 Oak St', '2024-01-02'),
  (3, 'Charlie Brown', '789 Pine St', '2021-08-03'),
  (4, 'Diana Davis', '101 Elm St', '2024-01-04'),
  (5, 'Edward Evans', '202 Maple Ave', '2022-01-05'),
  (6, 'Frank Fisher', '303 Birch Ln', '2024-06-06'),
  (7, 'Grace Green', '404 Cedar Rd', '2021-04-07'),
  (8, 'Harry Harris', '505 Walnut Dr', '2020-03-08'),
  (9, 'Ivy White', '606 Spruce Ct', '2023-06-09'),
  (10, 'Jack Jones', '707 Fir Blvd', '2024-01-10');

select * from Customer;

create table IssueStatus(
Issue_Id int  PRIMARY KEY,
Issued_cust int,
Issued_book_name varchar(200) not null,
Issue_date date,
Isbn_book int,
FOREIGN KEY(Issued_cust) references Customer(customer_id),
FOREIGN KEY(Isbn_book) references Books(ISBN));

INSERT INTO IssueStatus(Issue_id,Issued_cust,Issued_book_name,Issue_date)  VALUES
  (201, 1, 'The Catcher in the Rye', '2023-06-15'),
  (202, 2, 'To Kill a Mockingbird', '2024-01-16'),
  (203, 3, '1984', '2023-06-17'),
  (204, 4, 'The Great Gatsby', '2024-01-18'),
  (205, 5, 'The Hobbit', '2024-01-19');

select * from IssueStatus;

create table ReturnStatus( 
Return_Id int PRIMARY KEY,
Return_cust int,
Return_book_name varchar(100) not null,
Return_date date, 
Isbn_book2 int,
FOREIGN KEY(Isbn_book2) references Books(ISBN));

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
  (301, 1, 'The Catcher in the Rye', '2024-02-01', '1001'),
  (302, 2, 'To Kill a Mockingbird', '2024-02-02', '1002'),
  (303, 3, '1984', '2024-02-03', '1003'),
  (304, 4, 'The Great Gatsby', '2024-02-04', '1004'),
  (305, 5, 'The Hobbit', '2024-02-05', '1005');


select * from ReturnStatus;



-- 1. Retrieve the book title, category, and rental price of all available books.
select Book_title,Category,Rental_Price from Books where status='Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
select Emp_name,Salary from employee order by salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select Customer_Id,Issued_book_name,Customer_name 
from issuestatus I 
JOIN Customer C ON I.Issued_cust=C.customer_id;


-- 4. Display the total count of books in each category.
select Category,count(*) as total_Books from books group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.  
select Emp_name,Position from employee where Salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name from customer
where Reg_date<'2022-01-01' AND
Customer_Id NOT IN(select Issued_cust from issuestatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
select Branch_no,count(*) as Total_employees from branch group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
select C.Customer_name from Customer C
Join issuestatus I  on I.Issued_cust=C.Customer_Id
where month(Issue_date)=6 AND year(Issue_date)=2023;

-- 9. Retrieve the book_title from the book table containing history.
select Book_title from books where Category='History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_no,count(*) as Total_Employees from Employee group by Branch_no having Total_Employees>5;








