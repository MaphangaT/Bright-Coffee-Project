# ☕ Bright Coffee Shop Sales – Data Analytics Case Study

## Overview

## https://id-preview--db09423e-0efb-4b51-97ff-e7a7dcb87934.lovable.app/

Built the CEO a polished, editorial-style dashboard at / covering all 6 months (Jan–Jun 2023) of Bright Coffee data. It includes 4 KPI cards (revenue, transactions, avg ticket, SKUs) and 7 visualizations — monthly trend by store, store revenue, category mix donut, top 10 products, hour-of-day, day-of-week, and category-by-store stacked bars — each with a one-line key insight underneath. Warm coffee-house design system (Fraunces + Inter, espresso/terracotta/caramel palette, all HSL tokens).

This project presents an end-to-end data analytics case study for **Bright Coffee Shop**, focused on analyzing sales performance, customer behavior, and operational efficiency across multiple store locations.

The goal is to transform raw transactional data into actionable insights that support business decision-making and revenue growth.

---

## Business Objective

The objective of this case study is to analyze coffee shop sales data to answer key business questions:

* Which products generate the most revenue?
* What are the busiest hours and days?
* Which store locations perform best and worst?
* How do customer purchasing patterns vary?
* Which factors drive higher sales performance?
* What strategies can improve low-performing areas?

---

## Dataset Description

The dataset contains transactional-level sales data across multiple stores.

### Key Data Categories

### 1. Transaction Data

* `Transaction_ID`
* `Date`
* `Time`
* `Payment_Method`

### 2. Product Data

* `Product_ID`
* `Product_Category`
* `Product_Type`
* `Unit_Price`

### 3. Store Data

* `Store_ID`
* `Store_Location`

### 4. Metrics

* `Quantity`
* `Revenue` = Quantity × Unit Pr

## Tools & Technologies

* **SQL** – data cleaning, aggregations, KPI calculations
* **Power BI 

---

## Key Analysis Performed

### Data Cleaning

* Removed null and inconsistent records
* Standardized product categories and store names
* Created calculated fields (Revenue)
* Validated transaction-level accuracy

---

### Sales Analysis

Example query:

```sql
SELECT 
    DATE(Date) AS Sale_Date,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM coffee_sales
GROUP BY Sale_Date
ORDER BY Total_Revenue DESC;
```

---

### Time-Based Insights

* Identified **peak hours** (morning rush vs afternoon decline)
* Compared **weekday vs weekend performance**
* Analyzed hourly transaction volume

---

### Product Performance

* Top-selling products by revenue and quantity
* Category-level contribution to total sales
* Low-performing products for potential removal

---

### Store Performance

* Revenue comparison across locations
* Identification of best and worst performing stores
* Sales trends by location

---

## Key Insights

* Morning hours drive the highest sales (commuter effect)
* A small group of products contributes to the majority of revenue (Pareto effect)
* Certain store locations consistently outperform others
* Afternoon periods show lower engagement and sales
* Product category preferences vary by location

---

## Business Recommendations

### Increase Revenue During Slow Hours

* Introduce afternoon promotions (discounts, bundles)
* Launch loyalty rewards for off-peak purchases

### Optimize Product Mix

* Focus on high-performing items
* Remove or reprice underperforming products

### Improve Store Performance

* Replicate strategies from top-performing locations
* Adjust staffing based on peak hours

### Enhance Customer Experience

* Speed up service during peak hours
* Introduce personalized offers based on purchase behavior

---

## How to Run

1. Clone the repository

```bash
git clone https://github.com/yourusername/bright-coffee-sales.git
```

2. Run SQL scripts in your preferred SQL environment

3. Open the notebook for analysis

```bash
jupyter notebook notebooks/coffee_analysis.ipynb
```

---

## Author

**Thabo_Maphanga**
Data Analytics | SQL | Business Intelligence | Data Storytelling

---

## License

This project is for educational and portfolio purposes.
