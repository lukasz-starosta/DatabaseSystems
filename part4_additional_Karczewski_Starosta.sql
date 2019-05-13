/* A1. */
SELECT last_name, job_id, salary FROM employees WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SA_MAN');

/* A2. */
SELECT employee_id, last_name, Emp.department_id FROM employees Emp, departments Dep, locations Loc
	WHERE Emp.department_id = Dep.department_id AND Dep.location_id = Loc.location_id AND SUBSTRING(Loc.city, 1, 1) = 'T';

/* A3. possibly add a subquery in the FROM clause */
--SELECT last_name, salary, Emp.department_id, (SELECT AVG(salary) FROM employees, departments WHERE departments.department_id = employees.department_id) as Dept_AVG
--	FROM employees Emp, departments Dep WHERE Emp.