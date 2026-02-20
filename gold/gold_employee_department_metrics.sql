CREATE OR REPLACE TABLE gold_employee_department_metrics
USING DELTA AS
SELECT
    department,
    COUNT(*) AS active_employee_count,
    ROUND(AVG(salary), 2) AS avg_salary,
    MAX(updated_at) AS last_updated
FROM silver_employee
WHERE is_deleted = false
GROUP BY department;
