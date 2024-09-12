use office;
create table employee(
    emp_id int primary key,
    name varchar(20),
    birthday date,
    sex varchar(1),
    super_id int,
    branch_id int
);

create table branch(
    branch_id int primary key,
    branch_name varchar(20),
    mgr_id int,
    mgr_startdate date
);

create table client(
    client_id int,
    client_name varchar(30),
    branch_id int,
    primary key(client_id)
);

create table works_with(
    emp_id int,
    client_id int,
    total_sales int,
    primary key(emp_id,client_id)
);

create table branch_supplier(
    branch_id int,
    supplier_name varchar(20),
    supply_type varchar(20),
    primary key(branch_id,supplier_name)
);

alter table works_with
add foreign key (emp_id) references employee(emp_id) on delete cascade;
alter table branch_supplier
add foreign key (branch_id) references branch(branch_id) on delete cascade;


insert into employee values (100,'David W','1967-11-17','M',null,null);
insert into employee values(101,'Jan L','1961-05-11','F',100,null);
insert into employee values (102,'Michael S','1964-03-15','M',101,null);
insert into employee values(103,'Angela M','1971-06-25','F',102,null);
insert into employee values (105,'Maz','1999-05-21','M',101,null);

insert into brnach values(1,'Corporate',100,'2006-02-09');
insert into brnach values(2,'Scranton',101,'1992-04-06');
insert into branch values(3,'Stamford',103,'1998-02-13');

update employee
set branch_id =1 where name ='David W';

update employee
set branch_id =2 where name ='Jan L';

update employee
set branch_id =2 where name ='Michael S';

update employee
set branch_id =1 where name ='Angela M';

update employee
set branch_id =3 where name ='Maz';

insert into client values(400,'Dunmore Highschool',2),(401,'Lacakawana Country',2),
(402,'FedEx',3),(403,'John Daly Law,LLC',3);

insert into works_with values(100,403,237000),(101,402,15000),(102,401,55000),(103,400,33000);

insert into branch_supplier values  (2,'Hammer Mill','Paper'),(3,'J.T.Forms & Labels','Custom Forms'),
(2,'Uni-ball','Writing Utensils'),(3,'Patriot Paper','Paper');

-- To check the data in the corresponding table
select * from employee;
select * from branch;
select * from client;
select * from works_with;
select * from branch_supplier;

-- Some of the queries

update employee
set birthday ='1971-06-26'
where name='Angela M';
-- we cant able to delete a sigle entity (cell) of a table instead use update to delete it.
update employee
set name=NULL
where emp_id=101;
-- So the instead of Angela the entity is now null, so we deleted the entity alone

delete from employee 
where name='Michael S' and emp_id=102;
-- It will delete the entire row in which the condition is met

select name,birthday from employee where sex='F' order by birthday asc limit 1;
