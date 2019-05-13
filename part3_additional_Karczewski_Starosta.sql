USE HR;

/* 1A */
SELECT manager_id, min(salary) as lowest_sal FROM employees WHERE salary > 6000 AND manager_id IS NOT NULL GROUP BY manager_id ORDER BY lowest_sal DESC;

/* 2A */
SELECT last_name, hire_date FROM employees WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name IN ('Davies'));

/* 3A */
SELECT Emp.last_name as emp_last_name, Emp.hire_date as emp_hire_date, Man.last_name as man_last_name, Man.hire_date as man_hire_date FROM employees Emp, employees Man WHERE Emp.manager_id = Man.employee_id AND Emp.hire_date < Man.hire_date;

/* 4A */
SELECT employee_id, last_name, salary FROM employees WHERE salary > (SELECT avg(salary) FROM employees) ORDER BY salary ASC;

/* 5A */
SELECT DISTINCT employee_id, last_name FROM employees, departments WHERE employees.department_id IN
	(SELECT departments.department_id FROM employees E, departments WHERE SUBSTRING(E.last_name, 1, 1) = 'U' AND E.department_id = departments.department_id);

/* 6A */
SELECT last_name, salary FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King');

/* 7A */
SELECT CONCAT('The salary of ', last_name, ' after a 10% raise is ', salary *1.1) as 'New salary' FROM employees WHERE commission_pct IS NULL;