CREATE TABLE IF NOT EXISTS silver_employee_scd (
    emp_id INT,
    emp_name STRING,
    department STRING,
    salary INT,
    join_date DATE,
    effective_start TIMESTAMP,
    effective_end TIMESTAMP,
    is_current BOOLEAN
)
USING DELTA;

MERGE INTO silver_employee_scd t
USING silver_employee s
ON t.emp_id = s.emp_id AND t.is_current = true

WHEN MATCHED AND (
    t.emp_name <> s.emp_name OR
    t.department <> s.department OR
    t.salary <> s.salary OR
    s.is_deleted = true
) THEN
  UPDATE SET
    t.effective_end = current_timestamp(),
    t.is_current = false

WHEN NOT MATCHED THEN
  INSERT (
    emp_id, emp_name, department, salary,
    join_date, effective_start, effective_end, is_current
  )
  VALUES (
    s.emp_id, s.emp_name, s.department, s.salary,
    s.join_date, current_timestamp(), NULL, true
  );
