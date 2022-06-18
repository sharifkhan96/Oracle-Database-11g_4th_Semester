create table tbl_customer
(cust_id number(11) constraint custIDpk primary key, custfName varchar2(255),
custlName varchar2(255), reservation varchar2(255), address varchar2(255),
status varchar2(255), contact_address number(11));

create table tbl_room
(room_id number(11) constraint rmIDpk primary key, room_sample varchar2(30),
description varchar2(120));

create table tbl_reservation
(reservation_id number(11) constraint rsvnIDpk primary key, customer_id number(11),
room_id number(11), reservation_date date, date_in date, date_out date,
days_range number(11),
constraint rcusIDfk foreign key (customer_id) references tbl_customer(cust_id),
constraint rrmIDfk foreign key (room_id) references tbl_room(room_id));

create table tbl_RoomClass
(class_id number(11) constraint cIDpk primary key, name varchar2(30),
price number(11));

create table tbl_Payment
(payment_ID number(11) constraint pIDpk primary key,
customer_id number(11), type varchar(30), payment_date date,
constraint pcustIDfk foreign key  (customer_id) references tbl_customer(cust_id));

create table tbl_employee
(employee_id number(11) constraint eIDpk primary key, fname varchar2(30),
lname varchar2(30), job_department varchar2(30), address varchar2(30),
contact_address number(30), eusername varchar2(30), epassword varchar2(30));

create table tbl_transactions
(transaction_id number(11) constraint tIDpk primary key, transaction_name varchar2(30),
customer_id number(11), employee_id number(11), reservation_id number(11), 
transaction_date date,
constraint tCustIDfk foreign key (customer_id) references tbl_customer(cust_id),
constraint tEmpIDfk foreign key (employee_id) references tbl_employee(employee_id),
constraint tResIDfk foreign key (reservation_id) references tbl_reservation(reservation_id));

create table tbl_reports
(report_id number(11) constraint rIDpk primary key, transaction_id number(11),
name varchar2(30), type varchar2(30), 
constraint rIDfk foreign key (transaction_id) references tbl_transactions(transaction_id));
