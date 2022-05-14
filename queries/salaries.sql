-- Table: public.salaries

-- DROP TABLE IF EXISTS public.salaries;

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
);