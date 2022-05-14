-- Table: public.dept_emp

-- DROP TABLE IF EXISTS public.dept_emp;

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    from_date date,
    to_date date,
    CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no),
    CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no)
);