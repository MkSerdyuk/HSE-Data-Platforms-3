SHOW PARTITIONS lab.sales;

SELECT sale_date, COUNT(*) AS rows_count, SUM(amount) AS total
FROM lab.sales
GROUP BY sale_date
ORDER BY sale_date;

SELECT assert_true(COUNT(*) = 6 AND COUNT(DISTINCT sale_id) = 6)
FROM lab.sales;

SELECT assert_true(COUNT(*) = 3 AND SUM(amount) = 600.00)
FROM lab.sales
WHERE sale_date = '2026-10-01';

SELECT assert_true(COUNT(*) = 3 AND SUM(amount) = 1500.00)
FROM lab.sales
WHERE sale_date = '2026-10-02';
