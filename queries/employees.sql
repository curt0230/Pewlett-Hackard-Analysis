-- Table: public.employees

-- DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    gender character varying COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;