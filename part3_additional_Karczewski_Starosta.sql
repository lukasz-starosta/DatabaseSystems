USE HR;

/* 1A */
--SELECT manager_id, min(salary) as lowest_sal FROM employees WHERE salary > 6000 AND manager_id IS NOT NULL GROUP BY manager_id ORDER BY lowest_sal DESC;

/* 2A */
--SELECT last_name, hire_date FROM employees WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name IN ('Davies'));

/* 3A */


/* 4A */
--SELECT employee_id, last_name, salary FROM employees WHERE salary > (SELECT avg(salary) FROM employees) ORDER BY salary ASC;

/* 5A */


/* 6A */
SELECT last_name, salary FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King');

/* 7A */
