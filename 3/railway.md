@Nikhil Mohite

create table train(train_no bigint, train_name varchar(30), train_type varchar(15), arrival varchar(30), destination varchar(15), availability varchar(15), constraint train_no_pk primary key(train_no));
create table compartment(compartment_no varchar(15), compartment_type varchar(15), capacity integer,availability integer, train_no bigint, constraint compartment_no_train_no_pk primary key(compartment_no,train_no), constraint train_no_fk foreign key(train_no) references train(train_no));
create table route_info(from_station_no integer not null, to_station_no integer not null,from_station_name varchar(30) not null, to_station_name varchar(30) not null, distance integer not null, train_no bigint not null, constraint from_to_station_train_no_pk primary key(from_station_no, to_station_no, train_no), constraint route_train_no_fk foreign key(train_no) references train(train_no));
create table user(user_id varchar(15) not null, user_type varchar(15) not null, fname varchar(15), lname varchar(15), age integer, dob date, pincode bigint, street_no varchar(30), constraint user_id_pk primary key(user_id));
create table user_train(user_id varchar(15) not null, train_no bigint not null, datetime_stamp datetime not null, constraint user_train_id_date_pk primary key(user_id, train_no, datetime_stamp), constraint user_train_user_id_fk foreign key(user_id) references user(user_id), constraint user_train_train_no foreign key(train_no) references train(train_no));
create table user_phone(user_id varchar(15) not null, phone_no bigint not null, constraint user_phone_no_pk primary key(user_id, phone_no), constraint user_phone_user_id_fk foreign key(user_id) references user(user_id));
create table ticket(pnr varchar(15) not null, train_no bigint not null, travel_date date not null, departure varchar(30), arrival varchar(30), departure_time time not null, arrival_time time not null, user_id varchar(15) not null, train_type varchar(15) not null, compartment_type varchar(15), compartment_no varchar(15), constraint pnr_pk primary key(pnr));
create table payment_info(transaction_id bigint not null, bank varchar(15) not null, card_no bigint, price float, pnr varchar(15), constraint payment_info_pk primary key(transaction_id, pnr), constraint payment_info_pnr_pk foreign key(pnr) references ticket(pnr));
create table fare_table(train_type varchar(15) not null, compartment_type varchar(15) not null, fare_per_km float not null, constraint fare_table_pk primary key(train_type,compartment_type));

load data infile "Train.csv" into table train columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\r\n' ignore 1 lines;
load data infile "Compartment.csv" into table compartment columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;
load data infile "RouteInfo.csv" into table route_info columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;
load data infile "Train_User.csv" into table user columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\r\n' ignore 1 lines;
load data infile "User-Train.csv" into table user_train columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines; 
load data infile "User-Phone.csv" into table user_phone columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;
load data infile "Ticket.csv" into table ticket columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\r\n' ignore 1 lines;
load data infile "Payment-Info.csv" into table payment_info columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;
load data infile "FareTable.csv" into table fare_table columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;
load data infile "Ticket-Passenger.csv" into table ticket_passenger columns terminated by ',' optionally enclosed by '"' escaped by '"' lines terminated by '\n' ignore 1 lines;

select fname, dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) AS age from user;

select * from route_info where distance<=150 && distance>=70;
select * from route_info where from_station_name="Chennai" && to_station_name="Sholingur";
select * from train where train_type!="mail";
select * from train where arrival="Bengaluru" && destination="Chennai";

select * from user where dob>=('1980-01-01') && dob<=('1990-01-01');
select * from user where fname like 'S%';
select availability from compartment where compartment_type="I Class" && train_no=62621;
select transaction_id,pnr from payment_info where bank="Union Bank";