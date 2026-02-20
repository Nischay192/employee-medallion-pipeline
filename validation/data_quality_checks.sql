-- Check total records
SELECT COUNT(*) FROM silver_employee;

-- Check deleted vs active
SELECT is_deleted, COUNT(*) 
FROM silver_employee
GROUP BY is_deleted;

-- Check duplicate active records (should be zero)
SELECT emp_id, COUNT(*)
FROM silver_employee_scd
WHERE is_current = true
GROUP BY emp_id
HAVING COUNT(*) > 1;

-- History check
SELECT emp_id, COUNT(*)
FROM silver_employee_scd
GROUP BY emp_id
HAVING COUNT(*) > 1;
