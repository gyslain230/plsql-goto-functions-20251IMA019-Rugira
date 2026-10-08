SELECT 
    emp_id, 
    first_name, 
    salary,
    fn_annual_salary(salary) AS annual_salary,
    fn_calculate_tax(salary) AS monthly_tax,
    fn_years_of_service(hire_date) AS years_worked,
    fn_dept_name(dept_id) AS department
FROM employees;