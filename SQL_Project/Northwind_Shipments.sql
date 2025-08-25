
/* 
Our execs tasked us with investigating the recent late shipment complaints.
We'll first create a view that we can run some queries on.
We'll pull from multiple tables and include all the metrics we'll need
*/
DROP VIEW IF EXISTS order_metrics
;

CREATE VIEW order_metrics AS 
    SELECT 
        o.OrderID,
        s.CompanyName                                                   AS Shipper,
        o.ShipName                                                      AS Customer,
        o.OrderDate                                                     AS OrderDate,
        COALESCE(o.Freight,0)                                           AS Freight,
        (o.ShippedDate > o.RequiredDate)                                AS late_flag,   -- flags an order as late
        CASE WHEN o.ShippedDate > o.RequiredDate
            THEN JULIANDAY(o.ShippedDate) - JULIANDAY(o.RequiredDate)
        END                                                             AS days_late,
        SUM(d.UnitPrice * d.Quantity * (1-d.Discount))                  AS order_value
    FROM Orders o
    JOIN Shippers s ON s.ShipperID = o.ShipVia
    JOIN "Order Details" d ON d.OrderID = o.OrderID
    WHERE o.ShippedDate IS NOT NULL AND o.RequiredDate IS NOT NULL
    GROUP BY o.OrderID
;

/*
Now we'll run some queries we can export for further analysis later.


First we can check out effects related to customers and shippers.
A spreadsheet form of the table is included in the Excel folder and a screenshot of the resultant table is located in the screenshots folder labelled customer_shipper_late_summary
*/

SELECT
    Customer,
    Shipper,
    ROUND(100.00* SUM(late_flag)/COUNT(*),1)||'%'           AS Late_Frequency,      -- Proportion of shipments that are late
    ROUND(AVG(days_late),1)                                 AS Avg_Days_Late,
    SUM(late_flag)                                          AS Late_Orders,
    COUNT(*)                                                AS Total_Orders,
    SUM(CASE 
            WHEN late_flag = 1 
            THEN order_value 
        END)                                                AS Revenue_at_Risk,     -- The amount of revenue (quantity * price) of late shipments
    SUM(order_value)                                        AS Total_Revenue,
    ROUND(100.00 * 
        SUM(CASE WHEN late_flag = 1 THEN order_value END) /
        NULLIF(SUM(order_value), 0), 1)                     AS RaR_Rate,        -- A measure of the proportion of revenue on late shipments to total revenue for that group
    SUM(CASE WHEN late_flag = 1 THEN Freight ELSE 0 END)    AS Late_Freight,        
    SUM(Freight)                                            AS Total_Freight,
    ROUND(100.00* SUM(late_flag)/COUNT(*),2)                AS late_rate
FROM order_metrics
GROUP BY Customer, Shipper
HAVING COUNT(*) >= 10           -- eliminates results with <10 results which may skew the results 
ORDER BY late_rate desc
;

 
/* Then we'll go ahead and check our shippers for any seasonal effect.
A spreadsheet form of the table is included in the Excel folder and a screenshot of the resultant table is located in the screenshots folder labelled shipper_late_bytime
*/

SELECT
    Shipper,
    STRFTIME('%Y-%m', OrderDate)                            AS Date,
    ROUND(100.00* SUM(late_flag)/COUNT(*),1)||'%'           AS Late_Frequency,
    ROUND(AVG(days_late),1)                                 AS Avg_Days_Late,
    SUM(late_flag)                                          AS Late_Orders,
    COUNT(*)                                                AS Total_Orders,
    SUM(CASE 
            WHEN late_flag = 1 
            THEN order_value 
        END)                                                AS Revenue_at_Risk,
    SUM(order_value)                                        AS Total_Revenue,
    ROUND(100.00 * 
        SUM(CASE WHEN late_flag = 1 THEN order_value END) /
        NULLIF(SUM(order_value), 0), 1)                     AS RaR_Rate,
    SUM(CASE WHEN late_flag = 1 THEN Freight ELSE 0 END)    AS Late_Freight,
    SUM(Freight)                                            AS Total_Freight
FROM order_metrics
WHERE OrderDate > '2020-10'
GROUP BY Date, Shipper
HAVING COUNT(*) >= 10
ORDER BY Date desc
;


--We can take these tables for further analysis via your preferred means, I'll be using excel. 

