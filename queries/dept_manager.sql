-- Table: public.dept_manager

-- DROP TABLE IF EXISTS public.dept_manager;

CREATE TABLE IF NOT EXISTS public.dept_manager
(
    dept_no varchar(4) NOT NULL,
    emp_no integer NULL,
    from_date date NULL,
    to_date date NULL,
	primary key (emp_no)
);

alter table public.dept_manager add primary key (emp_no);
alter table public.dept_manager add constraint fk_employees foreign key (emp_no) references employees (emp_no);
