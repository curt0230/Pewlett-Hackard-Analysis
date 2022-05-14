-- Table: public.titles

-- DROP TABLE IF EXISTS public.titles;

CREATE TABLE IF NOT EXISTS public.titles
(
    emp_no integer NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no)
);