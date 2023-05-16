# SQL course
These are my lab works, in which I studied the following SQL structures that I used in my labs: DDL, DML and TCL in Microsoft SQL Server.

## Table of Contents

1. [Laboratory_1](#Laboratory_1)
   - [Description of the Laboratory_1](#Description-of-the-Laboratory_1)
   - [Task of the Laboratory_1](#Task-of-the-Laboratory_1)
   - [Main of the Laboratory_1](#Main-of-the-Laboratory_1)
     - [Create Database](#Create-Database)
     - [Create Table](#Create-Table)
     - [Insert Table](#Insert-Table)
     - [Create Foreign Key](#Create-Foreign-Key)
     - [Drop Foreign Key](#Drop-Foreign-Key)
     - [Drop Table](#Drop-Table)
2. [Laboratory_2](#Laboratory_2)
   - [Description of the Laboratory_2](#Description-of-the-Laboratory_2)
   - [Task of the Laboratory_2](#Task-of-the-Laboratory_2)
   - [Main of the Laboratory_2](#Main-of-the-Laboratory_2)
3. [Laboratory_3](#Laboratory_3)
   - [Description of the Laboratory_3](#Description-of-the-Laboratory_3)
   - [Task of the Laboratory_3](#Task-of-the-Laboratory_3)
   - [Main of the Laboratory_3](#Main-of-the-Laboratory_3)
4. [Laboratory_4](#Laboratory_4)
   - [Description of the Laboratory_4](#Description-of-the-Laboratory_4)
   - [Task of the Laboratory_4](#Task-of-the-Laboratory_4)
   - [Main of the Laboratory_4](#Main-of-the-Laboratory_4)
5. [Laboratory_5](#Laboratory_5)
   - [Description of the Laboratory_5](#Description-of-the-Laboratory_5)
   - [Task of the Laboratory_5](#Task-of-the-Laboratory_5)
   - [Main of the Laboratory_5](#Main-of-the-Laboratory_5)
6. [Laboratory_6](#Laboratory_6)
   - [Description of the Laboratory_6](#Description-of-the-Laboratory_6)
   - [Task of the Laboratory_6](#Task-of-the-Laboratory_6)
   - [Main of the Laboratory_6](#Main-of-the-Laboratory_6)
7. [Laboratory_7](#Laboratory_7)
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
