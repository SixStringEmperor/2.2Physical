CREATE TABLE IF NOT EXISTS public.auther_books(
    auther_id  SERIAL PRIMARY KEY,
    name_auther varchar (200));
--job
CREATE TABLE IF NOT EXISTS public.publishers(
    publisher_id SERIAL PRIMARY KEY
	,title varchar (200)
	,city varchar (100)
	,index char (30)
	);
--job
CREATE TABLE IF NOT EXISTS public.readers(	
     reader_id SERIAL PRIMARY KEY
	,birthday  date
	,FIO  varchar (200)
	,address varchar (200)
	,phone_number varchar (20)
	,email  varchar (50)
	);	
--job
CREATE TABLE IF NOT EXISTS public.department(
    department_id SERIAL PRIMARY KEY
    ,name varchar (100)
    ,address varchar(100)
    );	
--job
CREATE TABLE IF NOT EXISTS public.employee(
    employee_id SERIAL PRIMARY KEY
	,FIO  varchar (200)
	,phone_number varchar (20)
	,department_id integer NOT NULL REFERENCES public.department(department_id)
	);
--job
----------------------------------------------------------------------------------------------------------------------------------------
--
CREATE TABLE IF NOT EXISTS public.books(
     books_id  SERIAL PRIMARY KEY
	,book_title varchar (200)
    ,connect_id bigint --NOT NULL references public.books_connect(connect_id)
	,year_of_publishng date
	,pages integer
	,total_of_books integer
	,price numeric (10,2)
	,publisher_id  bigint NOT NULL references public.publishers(publisher_id)
);
---
CREATE TABLE IF NOT EXISTS public.books_connect(
    connect_id SERIAL PRIMARY KEY
	, books_id bigint NOT NULL REFERENCES public.books (books_id)
	, auther_id bigint NOT NULL REFERENCES public.auther_books (auther_id)
    );
--
CREATE TABLE IF NOT EXISTS public.rent_books(	
    rent_id SERIAL PRIMARY KEY
	,reader_id bigint NOT NULL REFERENCES public.readers(reader_id)
	,books_id bigint NOT NULL REFERENCES public.books(books_id)
	,employee_id bigint NOT NULL REFERENCES public.employee(employee_id)
	,start_date date
	,end_date date
	,return_flag char(1)
	);
--

--
	--

	