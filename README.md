
# 🛒 Blinkit Data Analysis Project

This repository showcases a complete end-to-end data analysis project based on a fictional grocery dataset inspired by Blinkit. The project utilizes Excel, SQL, Python, and Power BI to deliver valuable business insights by analyzing sales, revenue, product demand, and more.
# Sample
![image](https://github.com/user-attachments/assets/ea0f4765-f9a6-45ad-bfba-18fb08f36836)
---

## 📁 Dataset Description

The dataset simulates grocery inventory and sales data from an e-commerce platform. It includes:

- `Item_Identifier`: Unique ID of the product
- `Item_Weight`: Weight of the product in kilograms
- `Item_Fat_Content`: Nutritional fat category (e.g., Low Fat, Regular)
- `Item_Visibility`: Percentage visibility of the item in the store
- `Item_Type`: Category of the item (e.g., Dairy, Snacks, Frozen Foods)
- `Outlet_Identifier`: Unique ID of the store
- `Outlet_Establishment_Year`: Year of establishment of the outlet
- `Outlet_Size`: Size of the store (Small, Medium, High)
- `Outlet_Location_Type`: Urban/Metro classification
- `Outlet_Type`: Type of outlet (e.g., Supermarket Type1, Grocery Store)
- `Sales`: Revenue generated from each item

---

## 🛠️ Tools & Technologies Used

- **📊 Microsoft Excel** – Initial exploration & dashboard
- **🗄️ SQL (SQL Server)** – Data cleaning and KPI extraction
- **🐍 Python (Jupyter Notebook)** – Data preprocessing & visualization
- **📈 Power BI** – Dynamic and interactive business dashboard

---

## 📊 Excel Analysis

The Excel dashboard includes:

- 🔹 Revenue by Item Category
- 🔹 Outlet Performance
- 🔹 Product Fat Content Comparison
- 🔹 Top Revenue-Generating Items
- 🔹 Item Visibility vs. Sales Trend

📂 **File**: `Excel Dashboard.xlsx`

---

## 🧾 SQL Analysis

SQL was used to clean the raw data and compute essential KPIs.

### ✅ Key SQL Tasks

- Cleaning inconsistent values in `item_fat_content`
- Total Sales calculation
- Average revenue per sale
- Counting total records

📂 **File**: `SQLQuery2.sql`

### 🧹 Example Query for Cleaning
```sql
UPDATE blinkit 
SET item_fat_content = 
  CASE 
    WHEN item_fat_content IN ('low fat', 'LF') THEN 'Low Fat'
    WHEN item_fat_content = 'reg' THEN 'Regular'
    ELSE item_fat_content
  END;
```

### 📌 Sample KPIs
```sql
-- Total Sales by Item Type
-- ojective: Identify the performance of different item types in terms of total sales.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
select 
item_type as fat_content, 
round(sum(sales)/1000,2) as Total_Sales_Thousands, 
concat(round(avg(sales),0),' RS') as Average_sales, 
round(count(sales),0) as Total_count, 
round(avg(rating),2) as AVG_RAT
from blinkit 
group by item_type
order by Total_Sales_Thousands desc;

```

---

## 🐍 Python Analysis

Python was used for deeper exploratory data analysis (EDA), including:

- Missing value imputation
- Data type conversions
- Univariate & bivariate analysis
- Correlation matrix
- Distribution plots

### 📚 Libraries Used
- `pandas`
- `numpy`
- `matplotlib`
- `seaborn`

📂 **File**: `Blinkit-Data-AnaIysis-Excel-Sql-Python-Powerbi.ipynb`

### 📈 Sample Visuals
- Revenue distribution by item category
- Various KPI charts
- Bussiness Problem visual charts

---

## 📈 Power BI Dashboard

The final dashboard in Power BI consolidates KPIs and visuals in an interactive format:

- 🔹 Total Sales and Average Sales KPIs
- 🔹 Sales by Outlet Location
- 🔹 Revenue by Item Type
- 🔹 Year-wise Outlet Performance
- 🔹 Dynamic filtering by outlet, item type, and fat content

📂 **File**: `BlinkIT Grocery Dashboard.pbix`

---

## 📌 Key Insights

- 🥇 **Top Item Types**: Some categories like Dairy and Snacks contribute significantly to revenue.
- 🏬 **Outlet Performance**: Outlets established earlier tend to have higher sales.
- 📉 **Item Visibility**: Items with extremely low or high visibility underperform.
- 💰 **MRP Impact**: Higher MRP items don’t always yield higher sales — pricing strategy needs optimization.

---

## 🚀 How to Use

1. Clone this repository:
```bash
git clone https://github.com/Sabari-787/Blinkit-Data-Analysis-Excel-Sql-Python-Powerbi.git
```

2. Open the SQL script (`SQLQuery2.sql`) in SQL Server to view and run the queries.

3. Open the Jupyter Notebook (`.ipynb`) using JupyterLab or VSCode to explore Python analysis.

4. Launch the Power BI dashboard by opening `BlinkIT Grocery Dashboard.pbix`.

5. View Excel analysis using `Excel Dashboard.xlsx`.

---

## 🖼️ Screenshots

![image](https://github.com/user-attachments/assets/fd49e335-0e1e-4eae-9775-a0696af0fe49)
## Excel Dashboard
![image](https://github.com/user-attachments/assets/83f19028-642f-4258-95d6-97578aab1e6c)
## Sample Sql query
![image](https://github.com/user-attachments/assets/fcc794ec-29e3-4a2d-94dc-b5022b931526)
## Sample Python code with Output
![image](https://github.com/user-attachments/assets/ea0f4765-f9a6-45ad-bfba-18fb08f36836)
## Powerbi Dashboard
---

## 🙌 Acknowledgements

This project is inspired by the data analytics workflow in retail e-commerce. It was created for learning and demonstration purposes.

---

## 📬 Contact

If you have questions or suggestions, feel free to reach out:

- 📧 Email: Sabarianandsba@gmail.com
- 🌐 GitHub: https://github.com/Sabari-787
