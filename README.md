# SQL course
These are my lab works, in which I studied the following SQL structures that I used in my labs: DDL, DML and TCL in Microsoft SQL Server.

*SQL (Structured query language — мова структурованих запитів), складається з:*
- *DDL (Data Definition Language) — робота зі структурою бази,*
- *DML (Data Manipulation Language) — робота з рядочками,*
- *DCL (Data Control Language) — робота з правами,*
- *TCL (Transaction Control Language) — робота з транзакціями.*

*Data Definition Language*
- *CREATE — створення об'єкта (наприклад, таблиці);*
- *ALTER — зміна об'єкта (наприклад, додавання/зміна полів таблиці);*
- *DROP — видалення об'єкта.*

*Data Manipulation Language*
- *INSERT — вставлення рядочка;*
- *SELECT — вибірка;*
- *UPDATE — зміна;*
- *DELETE — видалення.*

*Transaction Control Language*
- *BEGIN TRANSACTION — почати транзакцію;*
- *COMMIT — прийняти зміни прийняті в транзакції;*
- *ROLLBACK — відкат.*

## Table of Contents

1. [Laboratory #1](#Laboratory-1)
   - [Description of the Laboratory_1](#Description-of-the-Laboratory_1)
   - [Task of the Laboratory_1](#Task-of-the-Laboratory_1)
   - [Main of the Laboratory_1](#Main-of-the-Laboratory_1)
     - [Create Database](#Create-Database)
     - [Create Table](#Create-Table)
     - [Insert Table](#Insert-Table)
     - [Create Foreign Key](#Create-Foreign-Key)
     - [Drop Foreign Key](#Drop-Foreign-Key)
     - [Drop Table](#Drop-Table)
2. [Laboratory #2](#Laboratory-2)
   - [Description of the Laboratory_2](#Description-of-the-Laboratory_2)
   - [Task of the Laboratory_2](#Task-of-the-Laboratory_2)
   - [Main of the Laboratory_2](#Main-of-the-Laboratory_2)
3. [Laboratory #3](#Laboratory-3)
   - [Description of the Laboratory_3](#Description-of-the-Laboratory_3)
   - [Task of the Laboratory_3](#Task-of-the-Laboratory_3)
   - [Main of the Laboratory_3](#Main-of-the-Laboratory_3)
4. [Laboratory #4](#Laboratory-4)
   - [Description of the Laboratory_4](#Description-of-the-Laboratory_4)
   - [Task of the Laboratory_4](#Task-of-the-Laboratory_4)
   - [Main of the Laboratory_4](#Main-of-the-Laboratory_4)
5. [Laboratory #5](#Laboratory-5)
   - [Description of the Laboratory_5](#Description-of-the-Laboratory_5)
   - [Task of the Laboratory_5](#Task-of-the-Laboratory_5)
   - [Main of the Laboratory_5](#Main-of-the-Laboratory_5)
6. [Laboratory #6](#Laboratory-6)
   - [Description of the Laboratory_6](#Description-of-the-Laboratory_6)
   - [Task of the Laboratory_6](#Task-of-the-Laboratory_6)
   - [Main of the Laboratory_6](#Main-of-the-Laboratory_6)
7. [Laboratory #7](#Laboratory-7)
   - [Description of the Laboratory_7](#Description-of-the-Laboratory_7)
   - [Task of the Laboratory_7](#Task-of-the-Laboratory_7)
   - [Main of the Laboratory_7](#Main-of-the-Laboratory_7)

# Laboratory #1

### Description of the Laboratory_1

#### **Task of the Laboratory_1**

*1. When performing laboratory work, the diagram should display three types of connections: 'one-to-one', 'one-to-many' and 'many-to-many'.*

*2. Tables must contain primary (Primary Key) and secondary keys (Foregin key)*

#### **Main of the Laboratory_1**

###### Create DataBase

```sql
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = '<base_name>')
CREATE DATABASE <base_name>;

USE <base_name>
```
###### Create Table

- *IDENTITY(1,1) - used to define a column in a table as an identity column. An identity column is a column that automatically generates unique numeric values for each new row inserted into the table.*
- *PRIMARY KEY - column or a set of columns in a database table that uniquely identifies each row in that table.*
- *NOT NULL - constraint ensures that every row in the table must have a valid, non-null value in the primary key column(s).*

```sql
CREATE TABLE <table_name>
(
	--"Different type of variable which I used in my laboratory"
	INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Variable_2 NVARCHAR(MAX) NOT NULL,
	Variable_3 NVARCHAR(MAX)
	Variable_4 BIT,
	Variable_5 DATETIME NOT NULL,
);
```

###### Insert Table

- *INSERT - used to insert new rows of data into a table*

```sql
INSERT INTO <table_name> (Variable_2, Variable_3, Variable_4, Variable_5)
VALUES
	('Value 1', 'Description 1', 1, '2023-05-16 10:00:00'),
	('Value 2', 'Description 2', 0, '2023-05-16 11:00:00'),
	('Value 3', 'Description 3', 1, '2023-05-16 12:00:00'),
 	('Value 4', 'Description 4', 1, '2023-05-16 13:00:00'),
 	('Value 5', 'Description 5', 0, '2023-05-16 14:00:00');
```

###### Create Foreign Key

- *Foreign Key - constraint that establishes a relationship between two tables. It is used to maintain referential integrity, ensuring that the data in the related tables remains consistent. A foreign key column in one table refers to the primary key column in another table.*

```sql
CREATE TABLE <table_name_1>
(
	VariableID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Variable_2 NVARCHAR(MAX) NOT NULL,
);

CREATE TABLE <table_name_2>
(
	VariableID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Variable_2 NVARCHAR(MAX) NOT NULL,
	CONSTRAINT <fk_name> FOREIGN KEY (VariableID) REFERENCES <table_name_1>(VariableID)
);
```

###### Drop Foreign Key

- *DROP - used to remove database objects such as tables, views, indexes, or constraints. *

```sql
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<fk_name>]') AND type = 'F')
	ALTER TABLE BookCopy DROP CONSTRAINT <fk_name>;
```

###### Drop table

```sql
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<table_name_1>]') AND type in (N'U'))
	DROP TABLE [dbo].[<table_name_1>];
```
# Laboratory #2
### Description of the Laboratory_2
#### **Task of the Laboratory_2**
######
#### **Main of the Laboratory_2**
###### 
# Laboratory #3
### Description of the Laboratory_3
#### **Task of the Laboratory_3**
###### 
#### **Main of the Laboratory_3**
###### 
# Laboratory #4
### Description of the Laboratory_4
#### **Task of the Laboratory_4**
###### 
#### **Main of the Laboratory_4**
###### 
# Laboratory #5
### Description of the Laboratory_5
#### **Task of the Laboratory_5**
###### 
#### **Main of the Laboratory_5**
###### 
# Laboratory #6
### Description of the Laboratory_6
#### **Task of the Laboratory_6**
###### 
#### **Main of the Laboratory_6**
###### 
# Laboratory #7
### Description of the Laboratory_7
#### **Task of the Laboratory_7**
###### 
#### **Main of the Laboratory_7**
######
