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
select avg(sales) as Average_sales from blinkit









