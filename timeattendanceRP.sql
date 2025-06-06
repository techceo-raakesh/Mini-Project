
-- Task 3: SQL Queries
-- Calculate monthly salaries based on hourly rates and attendance. The query should compute the total salary for the month, including any bonuses and deductions, for each employee.
-- List employees with more than 5 absences in a given month, showing employee_id, first_name, last_name, and absences_count.
-- Create a trigger that automatically updates the payroll table whenever the attendance data is modified. For example, if an employee's hours worked change, the trigger should recalculate their salary and update the payroll details accordingly.

-- Task 4: Partitioning the Payroll Table
-- Implement table partitioning for the Payroll table based on the salary_month. Partition the data so that payroll records for each month are stored in separate partitions. 
-- Use range partitioning for the salary_month field (e.g., partition by year and month).

-- Task 5: Data Retrieval with Partitioned Data
-- Retrieve payroll details for a specific month (e.g., for January 2024). The query should only scan the relevant partition for that month, ensuring faster retrieval.
-- List the top 5 employees with the highest salaries in a given quarter (e.g., Q1 2024), based on data stored in the partitioned payroll table.

-- Task 1: Create the tables for the employee attendance and payroll system:
-- employees, attendance records, and payroll.

-- Task 2: Define Relationships (Using Primary and Foreign Keys)
-- Establish primary keys for each table.
-- Implement foreign key relationships:
-- Employees ↔ Attendance (One-to-many)
-- Employees ↔ Payroll (One-to-many)

create table employees(
emp_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique not null,
phone_number varchar(15),
salary decimal(10,2) not null
);

insert into employees(first_name,last_name,email,phone_number,salary)
values
('Raj', 'Kumar', 'raj.k@example.com', '9876543210', 55000.00),
('Priya', 'Sharma', 'priya.s@example.com', '9876123456', 60000.00),
('Amit', 'Verma', 'amit.v@example.com', '9876987654', 75000.00),
('Neha', 'Patel', 'neha.p@example.com', '9876098765', 48000.00),
('Ravi', 'Singh', 'ravi.s@example.com', '9876456789', 52000.00);


create table attendance(
attendance_id int primary key auto_increment,
emp_id int,
date date not null,
status enum('present','absent') default 'present',
check_in time,
check_out time,
foreign key(emp_id) references employees(emp_id) on delete cascade
);

-- January 2025 Attendance Records
INSERT INTO attendance (emp_id, date, status, check_in, check_out) VALUES
(1, '2025-01-01', 'present', '09:00:00', '17:00:00'),
(1, '2025-01-02', 'absent', NULL, NULL),
(1, '2025-01-03', 'absent', NULL, NULL),
(1, '2025-01-04', 'absent', NULL, NULL),
(1, '2025-01-05', 'absent', NULL, NULL),
(1, '2025-01-06', 'absent', NULL, NULL),
(1, '2025-01-07', 'present', '09:00:00', '17:00:00'),
(1, '2025-01-08', 'absent', NULL, NULL),
(2, '2025-01-01', 'present', '09:00:00', '17:00:00'),
(2, '2025-01-02', 'present', '09:00:00', '17:00:00'),
(2, '2025-01-03', 'absent', NULL, NULL),
(2, '2025-01-04', 'present', '09:00:00', '17:00:00'),
(2, '2025-01-05', 'present', '09:00:00', '17:00:00'),
(3, '2025-01-01', 'present', '09:00:00', '17:00:00'),
(3, '2025-01-02', 'present', '09:00:00', '17:00:00'),
(3, '2025-01-03', 'present', '09:00:00', '17:00:00'),
(3, '2025-01-04', 'absent', NULL, NULL),
(3, '2025-01-05', 'present', '09:00:00', '17:00:00'),
(4, '2025-01-01', 'present', '09:00:00', '17:00:00'),
(4, '2025-01-02', 'present', '09:00:00', '17:00:00'),
(4, '2025-01-03', 'present', '09:00:00', '17:00:00'),
(4, '2025-01-04', 'present', '09:00:00', '17:00:00'),
(4, '2025-01-05', 'present', '09:00:00', '17:00:00'),
(5, '2025-01-01', 'present', '09:00:00', '17:00:00'),
(5, '2025-01-02', 'absent', NULL, NULL),
(5, '2025-01-03', 'absent', NULL, NULL),
(5, '2025-01-04', 'absent', NULL, NULL),
(5, '2025-01-05', 'absent', NULL, NULL),
(5, '2025-01-06', 'absent', NULL, NULL),
(5, '2025-01-07', 'present', '09:00:00', '17:00:00');

-- February 2025 Attendance Records
INSERT INTO attendance (emp_id, date, status, check_in, check_out) VALUES
(1, '2025-02-01', 'present', '09:00:00', '17:00:00'),
(1, '2025-02-02', 'absent', NULL, NULL),
(1, '2025-02-03', 'present', '09:00:00', '17:00:00'),
(1, '2025-02-04', 'absent', NULL, NULL),
(1, '2025-02-05', 'absent', NULL, NULL),
(1, '2025-02-06', 'absent', NULL, NULL),
(1, '2025-02-07', 'present', '09:00:00', '17:00:00'),
(2, '2025-02-01', 'absent', NULL, NULL),
(2, '2025-02-02', 'present', '09:00:00', '17:00:00'),
(2, '2025-02-03', 'present', '09:00:00', '17:00:00'),
(2, '2025-02-04', 'present', '09:00:00', '17:00:00'),
(2, '2025-02-05', 'absent', NULL, NULL),
(3, '2025-02-01', 'present', '09:00:00', '17:00:00'),
(3, '2025-02-02', 'present', '09:00:00', '17:00:00'),
(3, '2025-02-03', 'absent', NULL, NULL),
(3, '2025-02-04', 'present', '09:00:00', '17:00:00'),
(3, '2025-02-05', 'absent', NULL, NULL),
(4, '2025-02-01', 'present', '09:00:00', '17:00:00'),
(4, '2025-02-02', 'absent', NULL, NULL),
(4, '2025-02-03', 'present', '09:00:00', '17:00:00'),
(4, '2025-02-04', 'present', '09:00:00', '17:00:00'),
(4, '2025-02-05', 'present', '09:00:00', '17:00:00'),
(5, '2025-02-01', 'present', '09:00:00', '17:00:00'),
(5, '2025-02-02', 'absent', NULL, NULL),
(5, '2025-02-03', 'absent', NULL, NULL),
(5, '2025-02-04', 'absent', NULL, NULL),
(5, '2025-02-05', 'present', '09:00:00', '17:00:00');

-- March 2025 Attendance Records
INSERT INTO attendance (emp_id, date, status, check_in, check_out) VALUES
(1, '2025-03-01', 'present', '09:00:00', '17:00:00'),
(1, '2025-03-02', 'absent', NULL, NULL),
(1, '2025-03-03', 'absent', NULL, NULL),
(1, '2025-03-04', 'absent', NULL, NULL),
(1, '2025-03-05', 'absent', NULL, NULL),
(1, '2025-03-06', 'absent', NULL, NULL),
(1, '2025-03-07', 'present', '09:00:00', '17:00:00'),
(1, '2025-03-08', 'absent', NULL, NULL),
(1, '2025-03-09', 'absent', NULL, NULL),
(1, '2025-03-10', 'present', '09:00:00', '17:00:00'),
(1, '2025-03-11', 'absent', NULL, NULL),
(2, '2025-03-01', 'present', '09:00:00', '17:00:00'),
(2, '2025-03-02', 'present', '09:00:00', '17:00:00'),
(2, '2025-03-03', 'present', '09:00:00', '17:00:00'),
(2, '2025-03-04', 'present', '09:00:00', '17:00:00'),
(2, '2025-03-05', 'absent', NULL, NULL),
(3, '2025-03-01', 'present', '09:00:00', '17:00:00'),
(3, '2025-03-02', 'present', '09:00:00', '17:00:00'),
(3, '2025-03-03', 'present', '09:00:00', '17:00:00'),
(3, '2025-03-04', 'absent', NULL, NULL),
(3, '2025-03-05', 'present', '09:00:00', '17:00:00'),
(4, '2025-03-01', 'present', '09:00:00', '17:00:00'),
(4, '2025-03-02', 'present', '09:00:00', '17:00:00'),
(4, '2025-03-03', 'present', '09:00:00', '17:00:00'),
(4, '2025-03-04', 'absent', NULL, NULL),
(4, '2025-03-05', 'present', '09:00:00', '17:00:00'),
(5, '2025-03-01', 'present', '09:00:00', '17:00:00'),
(5, '2025-03-02', 'absent', NULL, NULL),
(5, '2025-03-03', 'absent', NULL, NULL),
(5, '2025-03-04', 'absent', NULL, NULL),
(5, '2025-03-05', 'absent', NULL, NULL),
(5, '2025-03-06', 'absent', NULL, NULL),
(5, '2025-03-07', 'present', '09:00:00', '17:00:00'),
(5, '2025-03-08', 'absent', NULL, NULL),
(5, '2025-03-09', 'absent', NULL, NULL),
(5, '2025-03-10', 'present', '09:00:00', '17:00:00');





create table payroll(
payroll_id int primary key auto_increment,
emp_id int,
pay_date date not null,
basic_salary decimal(10,2) not null,
bonus decimal(10,2) default 0.00,
deductions decimal(10,2) default 0.00,
net_salary decimal(10,2) not null,
foreign key(emp_id) references employees(emp_id) on delete cascade
);

insert into payroll (emp_id, pay_date, basic_salary, bonus, deductions, net_salary)
values
(1, '2025-03-01', 55000.00, 5000.00, 2000.00, 58000.00),  
(2, '2025-03-01', 60000.00, 3000.00, 1000.00, 62000.00),  
(3, '2025-03-01', 75000.00, 10000.00, 5000.00, 80000.00), 
(4, '2025-03-01', 48000.00, 1500.00, 1000.00, 48500.00),  
(5, '2025-03-01', 52000.00, 2500.00, 1500.00, 53000.00); 

SELECT 
    e.emp_id, 
    e.first_name, 
    e.last_name, 
    COUNT(a.attendance_id) AS absences_count
FROM 
    employees e
JOIN 
    attendance a ON e.emp_id = a.emp_id
WHERE 
    a.status = 'absent' AND
    a.date BETWEEN '2025-03-01' AND '2025-03-31'
GROUP BY 
    e.emp_id, e.first_name, e.last_name
HAVING 
    COUNT(a.attendance_id) > 2;



