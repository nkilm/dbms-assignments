-- 1.	Find the average distance between subsequent stations for every train

select t.train_no, avg(distance) from train t join route_info r on t.train_no=r.train_no group by t.train_no;

-- 2.	Find the average distance between subsequent stations for every train and display them in descending order of distance.

select t.train_no,avg(distance) as avg_distance from train t join route_info r on t.train_no=r.train_no group by t.train_no order by avg_distance desc;

-- 3.	Display the list of train numbers and the total distance travelled by each in descending order of the distance travelled.

select t.train_no,sum(distance) as total_distance from train t join route_info r on t.train_no=r.train_no group by t.train_no;

-- 4.	List those trains that have maximum and minimum number compartments and also display number of compartments they have. (2 queries one to find max and other to find min).

(select train_no,count(*) from compartment c group by train_no order by count(*) desc limit 1) union (select train_no,count(*) from compartment c group by train_no order by count(*) limit 1);

-- 5.	Display the number of phone numbers corresponding to the user_id(s) ADM_001, USR_006, USR_10.

select user_id,count(phone_no) from user_phone where user_id="ADM_001" or user_id="USR_006" or user_id="USR_010" group by user_id;

-- 6.	Find the average fare per km for each train type specified and display the train type and corresponding average fare per km as ‘Avg_Fare’ in decreasing order of Avg_Fare.

select train_type,avg(fare_per_km) as avg_fare from fare_table group by train_type order by avg_fare desc;

-- 7.	Retrieve all details of the oldest passenger.

select * from ticket_passenger having max(age);   

-- 8.   Count the number of passengers whose name consists of ‘Ullal’. (Hint: Use the LIKE operator). 

select * from ticket_passenger where name like "%Ullal%";
