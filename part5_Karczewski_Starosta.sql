USE test_empl;

/* 1 */
--SELECT name, salary FROM employees;

/* 2 */
--SELECT name, salary * 12 / 365 as daily_salary FROM employees;

/* 3 */
--SELECT name, salary * 12 as yearly_salary FROM employees;

/* 4 */
--SELECT min(salary) as min_salary FROM employees;

/* 5 */
--SELECT name, job, salary FROM employees WHERE salary = (SELECT min(salary) as min_salary FROM employees);

/* 6 */
--SELECT name, job, salary FROM employees WHERE salary < (SELECT avg(salary) FROM employees);

/* 7 */
--SELECT id_dep, count(*) FROM employees WHERE id_dep IS NOT NULL GROUP BY id_dep;

/* 8 */
--SELECT id_dep, job, count(*) FROM employees WHERE id_dep IS NOT NULL GROUP BY id_dep, job;

/* 9 */
--SELECT name, salary FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE id_dep = 30);

/* 10 */
--SELECT name, salary, salary - (SELECT avg(salary) FROM employees) as salary_difference  FROM employees;

/* 11 */
--SELECT departments.name, avg(salary) FROM departments, employees WHERE departments.id_dep = employees.id_dep GROUP BY departments.name;

/* 12 */
--SELECT name, id_dep, salary FROM employees E1 WHERE salary > (SELECT avg(salary) FROM employees E2 WHERE E1.id_dep = E2.id_dep);

/* 13 */
--SELECT name FROM employees WHERE num_id = ANY (SELECT boss FROM employees);

/* 14 */
SELECT departments.id_dep, departments.name FROM departments WHERE id_dep != ALL (SELECT id_dep FROM employees WHERE id_dep IS NOT NULL GROUP BY id_dep);

/* 15 */
