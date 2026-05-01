-- ============================================
-- Payroll Processor — MySQL Schema
-- Run this once to set up the database
-- ============================================

CREATE DATABASE IF NOT EXISTS payroll_db;
USE payroll_db;

-- Stores the raw employee input data
CREATE TABLE IF NOT EXISTS employees (
    id           INT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    department   VARCHAR(100) NOT NULL,
    hours_worked DECIMAL(6, 2) NOT NULL,
    hourly_rate  DECIMAL(8, 2) NOT NULL
);

-- Stores the computed payroll output for each run
CREATE TABLE IF NOT EXISTS payroll_results (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    employee_id   INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    department    VARCHAR(100) NOT NULL,
    gross_salary  DECIMAL(10, 2) NOT NULL,
    tax_amount    DECIMAL(10, 2) NOT NULL,
    net_salary    DECIMAL(10, 2) NOT NULL,
    processed_at  DATETIME NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Useful query: department-wise payroll summary
-- SELECT department,
--        COUNT(*) AS employees,
--        SUM(gross_salary) AS total_gross,
--        SUM(tax_amount)   AS total_tax,
--        SUM(net_salary)   AS total_net
-- FROM payroll_results
-- GROUP BY department
-- ORDER BY total_net DESC;
