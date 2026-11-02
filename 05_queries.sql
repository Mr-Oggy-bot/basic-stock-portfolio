
--Portfolio Summary View
CREATE OR REPLACE VIEW vw_portfolio_summary AS
SELECT i.investor_id,
       i.name,
       p.portfolio_name,
       s.symbol,
       h.total_quantity,
       s.current_price,
       (h.total_quantity * s.current_price) AS market_value
FROM investor i
JOIN portfolio p ON i.investor_id = p.investor_id
JOIN holdings h ON p.portfolio_id = h.portfolio_id
JOIN stock s ON h.stock_id = s.stock_id;



--Implementing some SQL queries
-- 1. Show All Investors
SELECT * FROM investor;

-- 2. Show All Stocks
SELECT symbol, stock_name, sector, current_price
FROM stock;

-- 3. Show Portfolio Summary
SELECT * FROM vw_portfolio_summary;

-- 4. Total Market Value Per Investor
SELECT name,
       SUM(market_value) AS total_value
FROM vw_portfolio_summary
GROUP BY name;

-- 5. Highest Value Portfolio
SELECT *
FROM (
    SELECT name,
           SUM(market_value) total_value
    FROM vw_portfolio_summary
    GROUP BY name
    ORDER BY total_value DESC
)
WHERE ROWNUM = 1;

-- 6. Investors Holding IT Stocks
SELECT DISTINCT i.name
FROM investor i
JOIN portfolio p ON i.investor_id = p.investor_id
JOIN holdings h ON p.portfolio_id = h.portfolio_id
JOIN stock s ON h.stock_id = s.stock_id
WHERE s.sector = 'IT';

-- 7. Stocks Price Above 2000
SELECT symbol, current_price
FROM stock
WHERE current_price > 2000;

-- 8. Count Stocks By Sector
SELECT sector, COUNT(*) total_stocks
FROM stock
GROUP BY sector;

-- 9. Sector Average Price
SELECT sector,
       ROUND(AVG(current_price),2) avg_price
FROM stock
GROUP BY sector;

-- 10. Holdings Greater Than 10 Qty
SELECT *
FROM holdings
WHERE total_quantity > 10;

-- 11. Transaction History of Investor 101
SELECT *
FROM trade_transactions
WHERE investor_id = 101;

-- 12. Buy Transactions Only
SELECT *
FROM trade_transactions
WHERE trans_type = 'BUY';

-- 13. Sell Transactions Only
SELECT *
FROM trade_transactions
WHERE trans_type = 'SELL';

-- 14. Most Expensive Stock
SELECT stock_name, current_price
FROM stock
WHERE current_price =
(
SELECT MAX(current_price) FROM stock
);

-- 15. Cheapest Stock
SELECT stock_name, current_price
FROM stock
WHERE current_price =
(
SELECT MIN(current_price) FROM stock
);

-- 16. Investor Count
SELECT COUNT(*) total_investors
FROM investor;

-- 17. Stocks Never Bought
SELECT stock_name
FROM stock
WHERE stock_id NOT IN
(
SELECT DISTINCT stock_id
FROM trade_transactions
);

-- 18. Total Trades Per Investor
SELECT investor_id,
       COUNT(*) total_trades
FROM trade_transactions
GROUP BY investor_id;

-- 19. Investors With More Than 1 Trade
SELECT investor_id,
       COUNT(*) total_trades
FROM trade_transactions
GROUP BY investor_id
HAVING COUNT(*) > 1;

-- 20. Total Quantity By Stock
SELECT stock_id,
       SUM(quantity) total_qty
FROM trade_transactions
GROUP BY stock_id;

-- 21. Current Portfolio Value > 20000
SELECT name,
       SUM(market_value) total_value
FROM vw_portfolio_summary
GROUP BY name
HAVING SUM(market_value) > 20000;

-- 22. Admin Logs
SELECT * FROM admin_log;

-- 23. Investors From Same Email Domain
SELECT name, email
FROM investor
WHERE email LIKE '%gmail.com';

-- 24. Order Stocks By Price Descending
SELECT stock_name, current_price
FROM stock
ORDER BY current_price DESC;

-- 25. Portfolio Names Created Today
SELECT portfolio_name
FROM portfolio
WHERE TRUNC(created_date)=TRUNC(SYSDATE);
