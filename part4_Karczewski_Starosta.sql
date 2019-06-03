USE HR;

/* 1 */
SELECT DISTINCT Man.last_name, Man.employee_id, (SELECT count(*) FROM employees Emp WHERE Man.employee_id = Emp.manager_id) as subordinates FROM employees Man, employees Emp WHERE Emp.manager_id = Man.employee_id;

/* 2 */
SELECT DISTINCT department_name, city, last_name, job_title, salary FROM departments, locations, employees, jobs WHERE departments.location_id = locations.location_id AND employees.job_id = jobs.job_id AND city = 'Seattle';

/* 3 */
SELECT count(*) FROM employees WHERE last_name LIKE '%' + 'n';

/* 4 */
SELECT department_name, city, (SELECT count(*) FROM employees WHERE department_id = Dep.department_id) FROM departments Dep, locations WHERE Dep.location_id = locations.location_id;

/* 5 */
SELECT * FROM employees WHERE day(hire_date) < 6;

/* 6 */
SELECT department_id, min(salary) FROM employees WHERE department_id = (SELECT TOP 1 department_id FROM employees GROUP BY department_id ORDER BY avg(salary) ASC) GROUP BY department_id;

/* 7 */
SELECT department_id, department_name, manager_id, location_id FROM departments WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees WHERE job_id = 'SA_*');

/* 8 a. */
SELECT result.department_id, departments.department_name, MAX(num_of_employees) as max_num
	FROM (SELECT employees.department_id, COUNT(employees.department_id) as num_of_employees FROM employees GROUP BY employees.department_id) result, departments
	WHERE result.department_id = departments.department_id
	AND num_of_employees = (SELECT MAX(num) FROM (SELECT COUNT(E.department_id) as num FROM employees E GROUP BY E.department_id) res2)
	GROUP BY result.department_id, departments.department_name;

/* 8 b. */

SELECT result.department_id, departments.department_name, MIN(num_of_employees) as min_num
	FROM (SELECT employees.department_id, COUNT(employees.department_id) as num_of_employees FROM employees GROUP BY employees.department_id HAVING COUNT(employees.department_id) > 0) result, departments
	WHERE result.department_id = departments.department_id
	AND num_of_employees = (SELECT MIN(num) FROM (SELECT COUNT(E.department_id) as num FROM employees E GROUP BY E.department_id HAVING COUNT(E.department_id) > 0) res2)
	GROUP BY result.department_id, departments.department_name;

/* 8 c. */

SELECT result.department_id, departments.department_name, num_of_employees
	FROM (SELECT employees.department_id, COUNT(employees.department_id) as num_of_employees FROM employees GROUP BY employees.department_id) result, departments
	WHERE result.department_id = departments.department_id
	GROUP BY result.department_id, departments.department_name, num_of_employees
	HAVING num_of_employees < 3;

/* 9 */
SELECT month(hire_date), count(*) as people_hired FROM employees GROUP BY month(hire_date);

/* 10 */
SELECT country_name, count(*) as places FROM locations, countries WHERE locations.country_id = countries.country_id GROUP BY country_name;
