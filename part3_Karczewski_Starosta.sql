USE HR;

/* 1. */
/* Display all table names */
--SELECT Distinct TABLE_NAME FROM information_schema.TABLES;
/* Display all columns */
--SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

/* 2. */
--SELECT first_name, last_name, salary FROM employees;

/* 3. */
--SELECT last_name, salary FROM employees WHERE salary > 12000;

/* 4. */
--SELECT last_name, department_id FROM employees WHERE employee_id = 176;

/* 5. */
--SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;

/* 6. */
--SELECT last_name, job_id, hire_date FROM employees WHERE last_name IN ('Matos', 'Taylor') ORDER BY hire_date ASC;

/* 7. */
--SELECT last_name, department_id FROM employees WHERE department_id IN (20, 50) ORDER BY last_name ASC;

/* 8. */
--SELECT last_name, job_title FROM employees, jobs WHERE employees.job_id = jobs.job_id AND employees.manager_id IS NULL;

/* 9. */
--SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC, commission_pct DESC;

/* 10. */
--SELECT max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average FROM employees;

/* 11. */
--SELECT job_id, max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average FROM employees GROUP BY job_id;

/* 12. */
--SELECT job_id, count(job_id) FROM employees GROUP BY job_id;

/* 13. */
--SELECT COUNT(DISTINCT manager_id) as 'Number of managers' FROM employees;

/* 14. */
--SELECT (max(salary) - min(salary)) AS DIFFERENCE FROM employees;

/* 15 */
--SELECT location_id, street_address, city, state_province, country_name FROM locations, countries WHERE locations.country_id = countries.country_id;

/* 16 */
--SELECT last_name, department_name FROM employees, departments WHERE employees.department_id = departments.department_id;

/* 17 */
--SELECT last_name, job_id, employees.department_id, department_name FROM employees, departments, locations WHERE employees.department_id = departments.department_id AND departments.location_id = locations.location_id AND locations.city = 'Toronto';
