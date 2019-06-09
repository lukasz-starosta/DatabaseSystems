/* A1. */
--SELECT last_name, job_id, salary FROM employees WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SA_MAN');

/* A2. */
--SELECT employee_id, last_name, Emp.department_id FROM employees Emp, departments Dep, locations Loc
--	WHERE Emp.department_id = Dep.department_id AND Dep.location_id = Loc.location_id AND SUBSTRING(Loc.city, 1, 1) = 'T';

/* A3. */
--SELECT E1.last_name, E1.salary, E1.department_id, (SELECT avg(E2.salary) FROM employees E2 WHERE E1.department_id = E2.department_id) AS dept_avg
--	FROM employees E1
--	WHERE E1.salary > (SELECT avg(E2.salary) FROM employees E2 WHERE E1.department_id = E2.department_id)
--	ORDER BY dept_avg, last_name ASC;

/* A4. NOT EXISTS */
--SELECT E1.last_name FROM employees E1 
--	WHERE NOT EXISTS (SELECT * FROM employees E2 WHERE E1.employee_id = E2.manager_id);

/* A4. NOT IN does not work */
--SELECT E1.last_name FROM employees E1
--	WHERE E1.employee_id NOT IN (SELECT E2.manager_id FROM employees E2);

/* A5. */
--SELECT E1.last_name
--	FROM employees E1
--	WHERE E1.salary < (SELECT avg(E2.salary) FROM employees E2 WHERE E1.department_id = E2.department_id);

/* A6. */
--SELECT DISTINCT E1.last_name, E1.employee_id
--	FROM employees E1, employees E2
--	WHERE E1.department_id = E2.department_id AND E1.salary < E2.salary AND  E1.hire_date < E2.hire_date
--	ORDER BY E1.employee_id ASC;

/* A7.  add the 1/8 thing */

WITH SUMMARY (total_salary, department_id) AS
	(SELECT SUM(salary), department_id FROM employees GROUP BY department_id)
	SELECT department_name, total_salary FROM departments D, SUMMARY WHERE D.department_id = SUMMARY.department_id ;