# Retail Sales Analysis SQL Project

## 📌 Project Overview
**Project Title:** Retail Sales Analysis  
**Level:** Beginner  
**Database:** SQL_Analysis_project1  

This project demonstrates essential SQL skills for data analysts, including database creation, data cleaning, exploratory data analysis (EDA), and answering business questions using SQL queries.

---

## 🎯 Objectives
- **Database Setup:** Create and populate a retail sales database  
- **Data Cleaning:** Identify and remove records with missing or NULL values  
- **Exploratory Data Analysis (EDA):** Understand the dataset using basic SQL queries  
- **Business Analysis:** Answer real business questions using SQL  

---

## 🗄️ 1. Database Setup

### Create Database
```sql
CREATE DATABASE SQL_Analysis_project1;
USE SQL_Analysis_project1;
```
### Create Table
```sql
CREATE TABLE retails_sales (
  transication_id INT PRIMARY KEY,
  sale_date DATE,
  sale_time TIME,
  customer_id INT,
  gender VARCHAR(15),
  age INT,
  category VARCHAR(15),
  quantity INT,
  price_per_unit FLOAT,
  cogs FLOAT,
  total_sale FLOAT
);
```
## 2. Data Exploration & Cleaning
### View Records
SELECT * FROM retails_sales;
SELECT TOP 10 * FROM retails_sales;

