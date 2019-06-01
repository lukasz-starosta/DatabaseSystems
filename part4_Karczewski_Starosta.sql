USE HR;

/* 1 */
--SELECT DISTINCT Man.last_name, Man.employee_id, (SELECT count(*) FROM employees Emp WHERE Man.employee_id = Emp.manager_id) as subordinates FROM employees Man, employees Emp WHERE Emp.manager_id = Man.employee_id;

/* 2 */
--SELECT DISTINCT department_name, city, last_name, job_title, salary FROM departments, locations, employees, jobs WHERE departments.location_id = locations.location_id AND employees.job_id = jobs.job_id AND city = 'Seattle';

/* 3 */
--SELECT count(*) FROM employees WHERE last_name LIKE '%' + 'n';

/* 4 */
--SELECT department_name, city, (SELECT count(*) FROM employees WHERE department_id = Dep.department_id) FROM departments Dep, locations WHERE Dep.location_id = locations.location_id;

/* 5 */
--SELECT * FROM employees WHERE day(hire_date) < 6;

/* 6 */
--SELECT department_id, min(salary) FROM employees WHERE department_id = (SELECT TOP 1 department_id FROM employees GROUP BY department_id ORDER BY avg(salary) ASC) GROUP BY department_id;

/* 7 */
--SELECT department_id, department_name, manager_id, location_id FROM departments WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees WHERE job_id = 'SA_*');

/* 8 */


/* 9 */
--SELECT month(hire_date), count(*) as people_hired FROM employees GROUP BY month(hire_date);

/* 10 */
SELECT country_name, count(*) as places FROM locations, countries WHERE locations.country_id = countries.country_id GROUP BY country_name;
