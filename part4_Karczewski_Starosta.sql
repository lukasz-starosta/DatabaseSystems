USE HR;

/* 1 */
--SELECT DISTINCT Man.last_name, Man.employee_id, (SELECT count(*) FROM employees Emp WHERE Man.employee_id = Emp.manager_id) as subordinates FROM employees Man, employees Emp WHERE Emp.manager_id = Man.employee_id;

/* 2 */
--SELECT DISTINCT department_name, city, last_name, job_title, salary FROM departments, locations, employees, jobs WHERE departments.location_id = locations.location_id AND employees.job_id = jobs.job_id AND city = 'Seattle';

/* 3 */
--SELECT count(*) FROM employees WHERE last_name LIKE '%' + 'n';

/* 4 */
SELECT department_name, city, (SELECT count(*) FROM employees WHERE department_id = Dep.department_id) FROM departments Dep, locations WHERE Dep.location_id = locations.location_id;