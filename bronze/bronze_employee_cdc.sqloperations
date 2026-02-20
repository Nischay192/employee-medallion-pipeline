-- Bronze CDC table
CREATE TABLE IF NOT EXISTS bronze_employee_cdc (
    emp_id INT,
    emp_name STRING,
    department STRING,
    salary INT,
    join_date DATE,
    updated_at TIMESTAMP,
    operation STRING,        -- I, U, D
    is_deleted BOOLEAN
)
USING DELTA;

-- Simulated CDC data already inserted via PySpark
-- This table stores raw change events with minimal transformation
