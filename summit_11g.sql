conn / as sysdba;
--alter user system identified by sys;
--conn system/sys;

--alter session set container=pdborcl;
alter user hr account unlock;
alter user hr identified by hr;
alter user oe account unlock;
alter user oe identified by oe;
alter user pm account unlock;
alter user pm identified by pm;
drop user summit cascade;
create user summit identified by SUMMIT;
grant connect,resource to summit;
alter user summit default tablespace users;
alter user summit temporary tablespace temp;
grant unlimited tablespace to summit;

create table summit.employees as select * from hr.employees;
create table summit.departments as select * from hr.departments;
create table summit.locations as select * from hr.locations;
create table summit.regions as select * from hr.regions;
create table summit.jobs as select * from hr.jobs;
create table summit.job_history as select * from hr.job_history;
create table summit.countries as select * from hr.countries;
CREATE UNIQUE INDEX summit.ind_dept_id_pk 
ON summit.departments (department_id) ;
CREATE UNIQUE INDEX summit.ind_emp_emp_id_pk 
ON summit.employees (employee_id) ;
alter table summit.employees 
add  primary key(employee_id);
alter table summit.departments 
add  primary key(department_id);
alter table summit.locations
add  primary key(location_id);
alter table summit.countries
add  primary key(country_id);
alter table summit.regions
add  primary key(region_id);
alter table summit.jobs 
add  primary key(job_id);
alter table summit.job_history
add primary key(employee_id,start_date);
alter table summit.employees 
add  foreign key(department_id)
references summit.departments(department_id);
alter table summit.employees 
add  foreign key(job_id)
references summit.jobs(job_id);
alter table summit.employees 
add  foreign key(manager_id)
references summit.employees(employee_id);
alter table summit.departments
add  foreign key(location_id)
references summit.locations(location_id);
alter table summit.departments 
add  foreign key(manager_id)
references summit.employees(employee_id);
alter table summit.locations
add  foreign key(country_id)
references summit.countries(country_id);
alter table summit.countries
add  foreign key(region_id)
references summit.regions(region_id);
alter table summit.job_history
add  foreign key(employee_id)
references summit.employees(employee_id);
alter table summit.job_history
add  foreign key(department_id)
references summit.departments(department_id);
alter table summit.job_history
add  foreign key(job_id)
references summit.jobs(job_id);
create table summit.job_grades(grade_level varchar2(3),
                        lowest_sal  number(6),
                        highest_sal number(6));
insert into summit.job_grades values ('A',1000,2999);
insert into summit.job_grades values ('B',3000,5999);
insert into summit.job_grades values ('C',6000,9999);
insert into summit.job_grades values ('D',10000,14999);
insert into summit.job_grades values ('E',15000,24999);
insert into summit.job_grades values ('F',25000,40000);
commit;

create sequence summit.departments_seq 
 start with 280
 increment by 10
 maxvalue 9990
 nocache
 nocycle;

create sequence summit.employees_seq 
 start with 207
 increment by 1
 nocache
 nocycle;

ALTER TABLE summit.employees
add constraint emp_salary_min check(salary>0);

ALTER TABLE summit.employees
add constraint emp_email_uk unique(email);


CREATE TABLE summit.customers 
  as select  CUSTOMER_ID, CUST_FIRST_NAME,CUST_LAST_NAME , NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL, ACCOUNT_MGR_ID from oe.CUSTOMERS;

alter table summit.customers
add PHONE_NUMBERS varchar2(25);

update summit.customers set PHONE_NUMBERS =  '+1 317 123 4104'  where customer_id =                                               
        101;                                                                     
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 317 123 4111'  where customer_id =                                               
        102 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4115'  where customer_id =                                               
        103  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 317 123 4126'  where customer_id =                                               
        104 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4129'  where customer_id =                                               
        105 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 219 123 4136'  where customer_id =                                               
        106 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 219 123 4138'  where customer_id =                                               
        107 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 317 123 4141'  where customer_id =                                               
        108  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 219 123 4142'  where customer_id =                                               
        109 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 317 123 4146'  where customer_id =                                               
        110  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4150'  where customer_id =                                               
        111  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4151'  where customer_id =                                               
        112 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4153'  where customer_id =                                               
        113 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 812 123 4157'  where customer_id =                                               
        114 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4159'  where customer_id =                                               
        115 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4160'  where customer_id =                                               
        116 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4162'  where customer_id =                                               
        117 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4181'  where customer_id =                                               
        118 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4191'  where customer_id =                                               
        119 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4199'  where customer_id =                                               
        120 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4201'  where customer_id =                                               
        121 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4206'  where customer_id =                                               
        122 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4219'  where customer_id =                                               
        123 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4222'  where customer_id =                                               
        124 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4225'  where customer_id =                                               
        125 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4226'  where customer_id =                                               
        126 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4228'  where customer_id =                                               
        127 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4230'  where customer_id =                                               
        128  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4234'  where customer_id =                                               
        129  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4242'  where customer_id =                                               
        130  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4245'  where customer_id =                                               
        131  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4248'  where customer_id =                                               
        132  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4253'  where customer_id =                                               
        133  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4255'  where customer_id =                                               
        134  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4263'  where customer_id =                                               
        135  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 517 123 4265'  where customer_id =                                               
        136  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4271'  where customer_id =                                               
        137  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 515 123 4273'  where customer_id =                                               
        138  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4278'  where customer_id =                                               
        139  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 712 123 4280'  where customer_id =                                               
        140  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4282'  where customer_id =                                               
        141  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4288'  where customer_id =                                               
        142  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 515 123 4290'  where customer_id =                                               
        143  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4301'  where customer_id =                                               
        144  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 745 123 4306'  where customer_id =                                               
        145  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4307'  where customer_id =                                               
        146 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4308'  where customer_id =                                               
        147 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4309'  where customer_id =                                               
        148  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4318'  where customer_id =                                               
        149  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4323'  where customer_id =                                               
        150  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4324'  where customer_id =                                               
        151  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4328'  where customer_id =                                               
        152  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4332'  where customer_id =                                               
        153  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4344'  where customer_id =                                               
        154  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4347'  where customer_id =                                               
        155  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4348'  where customer_id =                                               
        156  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4350'  where customer_id =                                               
        157  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 745 123 4367'  where customer_id =                                               
        158  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4369'  where customer_id =                                               
        159  ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 715 123 4372'  where customer_id =                                               
        160   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4373'  where customer_id =                                               
        161   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4374'  where customer_id =                                               
        162   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4376'  where customer_id =                                               
        163  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 608 123 4378'  where customer_id =                                               
        164  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4381'  where customer_id =                                               
        165  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4397'  where customer_id =                                               
        166   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4399'  where customer_id =                                               
        167   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4408'  where customer_id =                                               
        168   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4417'  where customer_id =                                               
        169   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4419'  where customer_id =                                               
        170   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 507 123 4421'  where customer_id =                                               
        171   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 218 123 4429'  where customer_id =                                               
        172   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4434'  where customer_id =                                               
        173   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 315 123 4442'  where customer_id =                                               
        174   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 315 123 4447'  where customer_id =                                               
        175   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4457'  where customer_id =                                               
        176   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4459'  where customer_id =                                               
        177   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4464'  where customer_id =                                               
        178   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4474'  where customer_id =                                               
        179   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 914 123 4494'  where customer_id =                                               
        180   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4496'  where customer_id =                                               
        181   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4575'  where customer_id =                                               
        182   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 914 123 4578'  where customer_id =                                               
        183   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 315 123 4597'  where customer_id =                                               
        184   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4599'  where customer_id =                                               
        185   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4605'  where customer_id =                                               
        186   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4617'  where customer_id =                                               
        187   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4618'  where customer_id =                                               
        188   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 914 123 4619'  where customer_id =                                               
        189   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4624'  where customer_id =                                               
        190   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4644'  where customer_id =                                               
        191   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4657'  where customer_id =                                               
        192   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4662'  where customer_id =                                               
        193   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4663'  where customer_id =                                               
        194   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4664'  where customer_id =                                               
        195   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4667'  where customer_id =                                               
        196   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4669'  where customer_id =                                               
        197   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4674'  where customer_id =                                               
        198   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4676'  where customer_id =                                               
        199   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4681'  where customer_id =                                               
        200   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4684'  where customer_id =                                               
        201    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4688'  where customer_id =                                               
        202   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4691'  where customer_id =                                               
        203    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4692'  where customer_id =                                               
        204   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4696'  where customer_id =                                               
        205    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4697'  where customer_id =                                               
        206   ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4700'  where customer_id =                                               
        207   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4706'  where customer_id =                                               
        208   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4708'  where customer_id =                                               
        209  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4714'  where customer_id =                                               
        210  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4718'  where customer_id =                                               
        211  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4721'  where customer_id =                                               
        212  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4722'  where customer_id =                                               
        213  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4724'  where customer_id =                                               
        214  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4730'  where customer_id =                                               
        215  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4738'  where customer_id =                                               
        216  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4739'  where customer_id =                                               
        217   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4740'  where customer_id =                                               
        218   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4741'  where customer_id =                                               
        219   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4743'  where customer_id =                                               
        220   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 610 123 4744'  where customer_id =                                               
        221  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4745'  where customer_id =                                               
        222  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4746'  where customer_id =                                               
        223   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4748'  where customer_id =                                               
        224   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4752'  where customer_id =                                               
        225   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4763'  where customer_id =                                               
        226   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4766'  where customer_id =                                               
        227   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4767'  where customer_id =                                               
        228   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4768'  where customer_id =                                               
        229   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4771'  where customer_id =                                               
        230   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4794'  where customer_id =                                               
        231   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4795'  where customer_id =                                               
        232    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4800'  where customer_id =                                               
        233    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4805'  where customer_id =                                               
        234    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 012 4715'  where customer_id =                            
        235   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4809'  where customer_id =                                               
        236   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4812'  where customer_id =                                               
        237    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4813'  where customer_id =                                               
        238    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4814'  where customer_id =                                               
        239    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4816'  where customer_id =                                               
        240    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4817'  where customer_id =                                               
        241    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4818'  where customer_id =                                               
        242    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4819'  where customer_id =                                               
        243    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4822'  where customer_id =                                               
        244    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4840'  where customer_id =                                               
        245    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4363'  where customer_id =                                               
        246    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 507 123 4387'  where customer_id =                                               
        247     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4436'  where customer_id =                                               
        248     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 219 123 4145'  where customer_id =                                               
        249    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4190'  where customer_id =                                               
        250    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4241'  where customer_id =                                               
        251   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4259'  where customer_id =                                               
        252    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 319 123 4269'  where customer_id =                                               
        253    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 712 123 4284'  where customer_id =                                               
        254    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 712 123 4289'  where customer_id =                                               
        255    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4312'  where customer_id =                                               
        256    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4364'  where customer_id =                                               
        257    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 320 123 4385'  where customer_id =                                               
        258    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 612 123 4407'  where customer_id =                                               
        259    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4456'  where customer_id =                                               
        260    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4582'  where customer_id =                                               
        261    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4627'  where customer_id =                                               
        262     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4677'  where customer_id =                                               
        263     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4702'  where customer_id =                                               
        264     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4749'  where customer_id =                                               
        265     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 814 123 4755'  where customer_id =                                               
        266     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 301 123 4831'  where customer_id =                                               
        267     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4167'  where customer_id =                                               
        268     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 219 123 4116'  where customer_id =                                               
        269    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 616 123 4166'  where customer_id =                                               
        270     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 810 123 4212'  where customer_id =                                               
        271     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 313 123 4240'  where customer_id =                                               
        272     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 414 123 4340'  where customer_id =                                               
        273     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 716 123 4485'  where customer_id =                                               
        274     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4532'  where customer_id =                                               
        275      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 518 123 4562'  where customer_id =                                               
        276     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 315 123 4585'  where customer_id =                                               
        277     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 412 123 4659'  where customer_id =                                               
        278     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 717 123 4679'  where customer_id =                                               
        279     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4709'  where customer_id =                                               
        280     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 215 123 4751'  where customer_id =                                               
        281     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4807'  where customer_id =                                               
        282     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 410 123 4829'  where customer_id =                                               
        283      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+86 811 012 4093'  where customer_id =                                              
        308     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+86 123 012 4095'  where customer_id =                                              
        309     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4123'  where customer_id =                            
        323     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+49 89 012 4129'  where customer_id =                            
        326     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+49 90 012 4131'  where customer_id =                            
        327     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+49 91 012 4133'  where customer_id =                            
        328      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4543'  where customer_id =                                                
        333      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+1 416 012 4147'  where customer_id =                                               
        334      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4547'  where customer_id =                                               
        335      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4551'  where customer_id =                                               
        337      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4555'  where customer_id =                                               
        339       ;                                                              
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4365'  where customer_id =                                               
        341     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4565'  where customer_id =                                               
        342     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4367'  where customer_id =                                               
        343     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+81 565 012 4567'  where customer_id =                                              
        344     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4369'  where customer_id =                                               
        345      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4569'  where customer_id =                                               
        346      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4371'  where customer_id =                            
        347     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4373'  where customer_id =                            
        348      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4375'  where customer_id =                            
        349      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4377'  where customer_id =                            
        350      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4379'  where customer_id =                            
        351      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4381'  where customer_id =                            
        352      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+86 10 012 4165'  where customer_id =                                               
        360      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 55 012 4559'  where customer_id =                                               
        361      ;                                                               
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4363'  where customer_id =                                               
        363     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+66 76 012 4633'  where customer_id =                            
        378     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4637'  where customer_id =                            
        380     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 2 012 4771'  where customer_id =                                                
        447    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 2 012 4773'  where customer_id =                                                
        448     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 2 012 4775'  where customer_id =                                                
        449     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4777'  where customer_id =                                               
        450     ;                                                                
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4779'  where customer_id =                                               
        451    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4781'  where customer_id =                                               
        452    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4783'  where customer_id =                                               
        453    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4785'  where customer_id =                            
        454   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4793'  where customer_id =                                               
        458    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4803'  where customer_id =                                               
        463   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4809'  where customer_id =                            
        466    ;                                                                 
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4811'  where customer_id =                            
        467   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4813'  where customer_id =                            
        468   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4817'  where customer_id =                            
        470   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4823'  where customer_id =                            
        473   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 33 012 4825'  where customer_id =                            
        474  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 33 012 4827'  where customer_id =                            
        475  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4829'  where customer_id =                                               
        476  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 22 012 4831'  where customer_id =                                               
        477 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4833'  where customer_id =                                               
        478  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4835'  where customer_id =                            
        479   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 172 012 4837'  where customer_id =                                              
        480  ;                                                                   

                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 22 012 4839'   where customer_id =                            
        481  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4841'  where customer_id =                            
        482  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4843'  where customer_id =                            
        483  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4851'  where customer_id =                            
        487  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 11 012 4853'  where customer_id =                            
        488  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 172 012 4861'  where customer_id =                                              
        492  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4869'  where customer_id =                                               
        496  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4887'  where customer_id =                                               
        605  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4889'  where customer_id =                                               
        606  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4891'  where customer_id =                                               
        607  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 141 012 4895'  where customer_id =                          
        609  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4907'  where customer_id =                                               
        615  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4919'  where customer_id =                                               
        621  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 4931'  where customer_id =                                               
        627  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4501'   where customer_id =                              
        712  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4503'  where customer_id =                              
        713 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4507'  where customer_id =                              
        715 ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4511'  where customer_id =                                                
        717  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4515'  where customer_id =                                                
        719  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4519'  where customer_id =                                                
        721 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4531'  where customer_id =                                                
        727  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4535'  where customer_id =                              
        729   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4539'   where customer_id =                              
        731   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4385'  where customer_id =                                               
        754  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4387'  where customer_id =                                               
        755  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4389'  where customer_id =                                                
        756  ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 6 012 4391'  where customer_id =                                                
        757  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4409'  where customer_id =                                               
        766  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4411'  where customer_id =                                               
        767  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4413'  where customer_id =                                               
        768  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4415'  where customer_id =                                               
        769   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4417'  where customer_id =                                               
        770   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 49 012 4419'  where customer_id =                                               
        771   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+39 10 012 4421'  where customer_id =                                               
        772  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+66 76 012 4441'  where customer_id =                                               
        782  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 56 012 3527'  where customer_id =                                               
        825  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 57 012 3529'  where customer_id =                                               
        826  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 58 012 3531'  where customer_id =                                               
        827 ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 59 012 3533'  where customer_id =                            
        828  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 60 012 3535'  where customer_id =                            
        829  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 61 012 3537'  where customer_id =                            
        830  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 62 012 3539'  where customer_id =                            
        831  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 63 012 3541'  where customer_id =                            
        832  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 64 012 3543'  where customer_id =                            
        833 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 65 012 3545'  where customer_id =                            
        834  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 66 012 3547'  where customer_id =                                               
        835  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 67 012 3549'  where customer_id =                                               
        836  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 2 012 3551'  where customer_id =                              
        837  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 3 012 3553'  where customer_id =                              
        838   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 81 012 3555'  where customer_id =                                               
        839   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 81 012 3557'  where customer_id =                                               
        840   ;                                                                  
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 71 012 3559'  where customer_id =                                               
        841  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 71 012 3561'  where customer_id =                                               
        842  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 4 012 3563'  where customer_id =                                                
        843  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 6 012 3565'  where customer_id =                                                
        844  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 7 012 3567'  where customer_id =                              
        845  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 31 012 3569'  where customer_id =                            
        846  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 68 012 3571'  where customer_id =                            
        847  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 5 012 3573'  where customer_id =                              
        848  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 8 012 3575'  where customer_id =                              
        849 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 1 012 3577'  where customer_id =                              
        850  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 9 012 3579'  where customer_id =                              
        851 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 69 012 3581'  where customer_id =                            
        852 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+41 70 012 3583'  where customer_id =                                               
        853  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3687'  where customer_id =                                               
        905  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3689'  where customer_id =                                               
        906 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3695'  where customer_id =                                               
        909 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3699'  where customer_id =                            
        911 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3701'  where customer_id =                            
        912 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3703'  where customer_id =                            
        913 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3709'  where customer_id =                                               
        916 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3711'  where customer_id =                                               
        917  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3715'  where customer_id =                                               
        919  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3717'  where customer_id =                                               
        920 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3719'  where customer_id =                            
        921 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3723'  where customer_id =                            
        923  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3725'  where customer_id =                            
        924  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3731'  where customer_id =                            
        927  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3733'  where customer_id =                            
        928  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3735'  where customer_id =                            
        929  ;                                                                   
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3737'  where customer_id =                                               
        930 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3739'  where customer_id =                                               
        931 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3741'  where customer_id =                                               
        932 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3745'  where customer_id =                                               
        934 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+91 80 012 3837'  where customer_id =                                               
        980 ;                                                                    
                                                                                
update summit.customers set PHONE_NUMBERS =  '+86 10 012 3839'  where customer_id =                                               
        981 ;                                                                    
                                                                                
Alter TABLE summit.customers
 add CONSTRAINT  customer_credit_limit_max CHECK (credit_limit <= 5000);

Alter TABLE summit.customers
 add CONSTRAINT  customer_id_min CHECK (customer_id > 0);


create table summit.WAREHOUSES as select * from oe.WAREHOUSES;

create table summit.ORDER_ITEMS as select * from oe.ORDER_ITEMS;

create table summit.ORDERS  as select * from oe.ORDERS;

alter table summit.ORDERS modify ORDER_DATE date;

create table summit.INVENTORIES as select * from oe.INVENTORIES;

create table summit.PRODUCT_INFORMATION  as select * from oe.PRODUCT_INFORMATION;

alter table summit.PRODUCT_INFORMATION drop ( WARRANTY_PERIOD);

alter table summit.PRODUCT_INFORMATION add WARRANTY_PERIOD number(5);

create table summit.PRODUCT_DESCRIPTIONS  as select * from oe.PRODUCT_DESCRIPTIONS;


CREATE UNIQUE INDEX summit.ind_customers_pk
   ON summit.customers (customer_id) ;

CREATE UNIQUE INDEX summit.ind_prd_desc_pk
ON summit.product_descriptions(product_id,language_id) ;

CREATE UNIQUE INDEX summit.ind_order_items_pk
ON summit.order_items (order_id, line_item_id) ;

CREATE UNIQUE INDEX summit.ind_order_items_uk
ON summit.order_items (order_id, product_id) ;

CREATE UNIQUE INDEX summit.ind_order_pk 
ON summit.orders (order_id) ;


ALTER TABLE summit.WAREHOUSES
ADD ( CONSTRAINT WAREHOUSES_pk
      PRIMARY KEY (warehouse_id)
    ) ;

ALTER TABLE summit.customers 
ADD ( CONSTRAINT customers_pk
      PRIMARY KEY (customer_id)
    ) ;

ALTER TABLE  summit.inventories
add CONSTRAINT inventory_pk PRIMARY KEY (product_id, warehouse_id);

ALTER TABLE summit.product_information 
ADD ( CONSTRAINT product_information_pk PRIMARY KEY (product_id)
    );

ALTER TABLE summit.product_descriptions
ADD ( CONSTRAINT product_descriptions_pk 
	PRIMARY KEY (product_id, language_id));

ALTER TABLE summit.order_items
ADD ( CONSTRAINT order_items_pk PRIMARY KEY (order_id, line_item_id)
    );

ALTER TABLE summit.orders
ADD ( CONSTRAINT order_pk 
      PRIMARY KEY (order_id)
    );

ALTER TABLE summit.customers
ADD ( CONSTRAINT customers_account_manager_fk
      FOREIGN KEY (account_mgr_id)
      REFERENCES summit.employees(employee_id)
      ON DELETE SET NULL
    ) ;


ALTER TABLE  summit.inventories
add (CONSTRAINT inventories_warehouses_fk
     FOREIGN KEY (warehouse_id)
     REFERENCES summit.warehouses (warehouse_id)
     ENABLE NOVALIDATE
    );

ALTER TABLE summit.inventories 
ADD ( CONSTRAINT inventories_product_id_fk 
      FOREIGN KEY (product_id)
      REFERENCES summit.product_information (product_id)
    ) ;


ALTER TABLE summit.PRODUCT_INFORMATION 
ADD CONSTRAINT  product_status_lov
                          CHECK (product_status in ('orderable'
                                                  ,'planned'
                                                  ,'under development'
                                                  ,'obsolete')
                               );


ALTER TABLE summit.order_items
ADD ( CONSTRAINT order_items_order_id_fk 
      FOREIGN KEY (order_id)
      REFERENCES summit.orders(order_id)
enable novalidate
    ) ;

ALTER TABLE summit.order_items
ADD ( CONSTRAINT order_items_product_id_fk 
      FOREIGN KEY (product_id)
      REFERENCES summit.product_information(product_id)
    ) ;


ALTER TABLE summit.orders
add CONSTRAINT  order_mode_lov
                         CHECK (order_mode in ('direct','online'));


ALTER TABLE summit.orders
add CONSTRAINT order_total_min
                         check (order_total >= 0);


ALTER TABLE summit.orders 
ADD ( CONSTRAINT orders_sales_rep_fk 
      FOREIGN KEY (sales_rep_id) 
      REFERENCES summit.employees(employee_id)
      ON DELETE SET NULL
    ) ;

ALTER TABLE summit.orders 
ADD ( CONSTRAINT orders_customer_id_fk 
      FOREIGN KEY (customer_id) 
      REFERENCES summit.customers(customer_id) 
      ON DELETE SET NULL 
    ) ;

create sequence summit.customers_seq 
 start with 982
 increment by 1
 nocache
 nocycle;


CREATE SEQUENCE summit.orders_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

create or replace trigger summit.insert_ord_line
     before insert on summit.order_items
     for each row
     declare
       new_line number;
   begin
       select (nvl(max(line_item_id),0)+1) into new_line
       from summit.order_items
       where order_id = :new.order_id;
     :new.line_item_id := new_line;
   end;
/

create table summit.online_media
as select * from pm.online_media;


CREATE OR REPLACE VIEW summit.products
AS
SELECT i.product_id
,      d.language_id
,      CASE WHEN d.language_id IS NOT NULL
            THEN d.translated_name
            ELSE TRANSLATE(i.product_name USING NCHAR_CS)
       END    AS product_name
,      i.category_id
,      CASE WHEN d.language_id IS NOT NULL
            THEN d.translated_description
            ELSE TRANSLATE(i.product_description USING NCHAR_CS)
       END    AS product_description
,      i.weight_class
,      i.warranty_period
,      i.supplier_id
,      i.product_status
,      i.list_price
,      i.min_price
,      i.catalog_url
FROM   summit.product_information  i
,      summit.product_descriptions d
WHERE  d.product_id  (+) = i.product_id
AND    d.language_id (+) = sys_context('USERENV','LANG');

--conn summit/SUMMIT@pdborcl;
conn summit/SUMMIT@orcl;

CREATE TYPE summit.cust_address_typ
   AS OBJECT
    ( street_address     VARCHAR2(40)
    , postal_code        VARCHAR2(10)
    , city               VARCHAR2(30)
    , state_province     VARCHAR2(10)
    , country_id         CHAR(2)
    );
/                                                            
                                                                                

commit;

--Exit;