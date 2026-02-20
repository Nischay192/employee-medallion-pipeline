CREATE OR REPLACE TABLE gold_deleted_employee_metrics
USING DELTA AS
SELECT
    department,
    COUNT(*) AS deleted_employee_count
FROM silver_employee
WHERE is_deleted = true
GROUP BY department;
