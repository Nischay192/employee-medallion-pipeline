CREATE TABLE IF NOT EXISTS silver_employee (
    emp_id INT,
    emp_name STRING,
    department STRING,
    salary INT,
    join_date DATE,
    updated_at TIMESTAMP,
    is_deleted BOOLEAN
)
USING DELTA;

MERGE INTO silver_employee t
USING bronze_employee_cdc s
ON t.emp_id = s.emp_id

WHEN MATCHED AND s.operation = 'D' THEN
  UPDATE SET
    t.is_deleted = true,
    t.updated_at = s.updated_at

WHEN MATCHED AND s.operation IN ('U', 'I') THEN
  UPDATE SET
    t.emp_name = s.emp_name,
    t.department = s.department,
    t.salary = s.salary,
    t.join_date = s.join_date,
    t.updated_at = s.updated_at,
    t.is_deleted = false

WHEN NOT MATCHED AND s.operation = 'I' THEN
  INSERT (
    emp_id, emp_name, department, salary,
    join_date, updated_at, is_deleted
  )
  VALUES (
    s.emp_id, s.emp_name, s.department, s.salary,
    s.join_date, s.updated_at, false
  );
