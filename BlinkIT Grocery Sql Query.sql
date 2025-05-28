select * from dbo.blinkit;

select count(*) from blinkit;

-- cleaning the first column
select distinct item_fat_content from blinkit;

update blinkit 
set item_fat_content = 
case 
	when item_fat_content in ('low fat','LF') then 'Low Fat'
	when item_fat_content = 'reg' then 'Regular'
	else item_fat_content
end



-- 1st kpi -- The overall revenue generated from all the items sold
select concat(cast(sum(sales)/1000000 as decimal(10,2)),'M') as Total_Sales from blinkit;


-- 2nd kpi -- The average revenue per sale 
select round(avg(sales),0) as Average_sales from blinkit


--3rd kpi -- The total count of different items sold
select count(sales) as Item_sold from blinkit;

--4th kpi -- the average customer rating for the item  sold
select round(avg(rating),2) as AVG_RAT from blinkit;


--1st Granular Requirement -- Total sales by fat content
-- Objective: Analyze the impact of fat content on total sales.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.

select 
item_fat_content as fat_content, 
concat(round(sum(sales)/1000000,2),' M') as Total_Sales, 
concat(round(avg(sales),0),' RS') as Average_sales, 
round(count(sales),0) as Total_count, 
round(avg(rating),2) as AVG_RAT
from blinkit group by item_fat_content;



-- 2. Total Sales by Item Type•
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

-- 3. Fat Content by Outlet for Total Sales.
-- Objective: Compare total sales across different outlets segmented by fat content.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.

select 
Outlet_location_Type , item_fat_content,
round(sum(sales)/1000,2) as Total_Sales_Thousands, 
concat(round(avg(sales),2),' RS') as Average_sales, 
round(count(sales),0) as Total_count, 
round(avg(rating),2) as AVG_RAT
from blinkit 
group by Outlet_location_Type , item_fat_content
order by Total_Sales_Thousands desc;



SELECT Outlet_Location_Type,
		ISNULL( [Low Fat], 0) AS Low_Fat,
		ISNULL( [Regular], 0) AS Regular
FROM
(
SELECT Outlet_Location_Type, Item_Fat_Content,
		cast(sum(sales) as decimal(10,2)) AS Salles
FROM blinkit 
GROUP BY Outlet_Location_Type,item_fat_content
) AS SourceTab1el
PIVOT
(
SUM(salles)
FOR Item_Fat_content IN ([lOW Fat],[Regular])
)AS PivotTable
ORDER BY Outlet_Location_Type;






-- Total sales by Outlet Establishment
-- Objective: Evaluate how the age or type of outlet establishment influences total sales.

select * from blinkit;

select outlet_establishment_year ,outlet_location_type, sum(sales) 
from blinkit group by outlet_establishment_year,outlet_location_type order by 1 ;




-- Percentage of Sales by Outlet Size:
-- Objective: Analyze the correlation between outlet size and total sales.

select outlet_size ,cast(sum(sales) as decimal(10,2)), cast(sum(sales)*100/(select sum(sales) from blinkit) as decimal(10,2)) 
from blinkit group  by outlet_size;
select outlet_size ,cast(sum(sales) as decimal(10,2)), cast(sum(sales)*100/(sum(sum(sales)) over()) as decimal(10,2)) 
from blinkit group  by outlet_size;


-- Sales by Outlet Location:
-- Objective: Assess the geographic distribution of sales across different locations.
select outlet_location_type,sum(sales) from blinkit group by outlet_location_type;


-- All Metrics by Outlet Type:
-- Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of
-- Items, Average Rating) broken down by different outlet types.

select 
Outlet_type as OutLet, 
round(sum(sales)/1000,2) as Total_Sales_Thousands, 
concat(round(avg(sales),0),' RS') as Average_sales, 
round(count(sales),0) as Total_count, 
round(avg(rating),2) as AVG_RAT
from blinkit 
group by outlet_type
order by Total_Sales_Thousands desc;





