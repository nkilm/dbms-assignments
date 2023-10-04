
-- PES1UG20CS667 NIKHIL RAJU MOHITE

/*1.Update price of the ticket.*/
create view get1 as (select PNR, Distance, Fare_Per_KM, t.Train_No from fare_table f,ticket t, route_info r where f.Train_type = t.Train_Type and f.Compartment_Type = t.Compartment_Type and r.From_Station_Name = t.Departure and r.To_Station_Name = t.Arrival);
create view get2 as (select PNR,count(*) passenger_no from ticket_passenger group by PNR);
update payment_info inner join get1 on (payment_info.PNR = get1.PNR) inner join get2 on (get1.PNR = get2.PNR) set payment_info.Price = get1.Distance * get1.Fare_Per_KM * get2.passenger_no;

/*2. Retrieve the all stations along route of the Trains along with the distance between subsequent stations*/

select t.Train_no, Train_name, From_Station_Name, To_Station_Name, Distance, Arrival, Destination from train t, route_info r where t.Train_no = r.Train_no;

/*3.Retrieve the Train no of train which is leaving Bengaluru and arriving at Chennai with compartments availability greater than 10*/

select distinct t.Train_no,Arrival,Destination from train t, compartment c where Arrival = "Bengaluru" and Destination = "Chennai" and Availability > 10;

/*4.Retrieve first and last name of users who have booked a ticket with price greater than 500*/

select Fname, Lname from user u, ticket t, payment_info p where u.User_Id = t.User_Id and p.PNR = t.PNR and p.Price > 500;

/*5. Retrieve the first name, last name, DOB and ticket PNR if they’ve bought it for all users.*/

select distinct Fname,Lname,DOB,PNR from ticket t left outer join user u ON u.User_ID = t.User_ID;

/*6. Retrieve the first name, last name,of the Users who have not bought a ticket.*/

select Fname, Lname from user u left outer join ticket t on u.User_ID= t.User_ID where PNR is null;

/*7. Retrieve the ticket PNR, Train number, travel date and along with all users first name and last name.*/

select PNR, Train_No, Travel_Date, FName, LName from ticket t right outer join user u on t.User_ID = u.User_ID;

/*8. Retrieve the user id if they’ve traveled in a train along with train id and name of all trains.*/

select User_ID , train.Train_no, Train_name from ticket right outer join train on ticket.Train_no = train.Train_No;

/*9. Retrieve the train no and name of trains whose destination is not Mangaluru and distance is not less than 100km and departure time is not 8:30:00 PM. */

select Train_no , Train_name from train where Train_no IN ( select Train_Number from ticket where Arrival != "Mangaluru" and Departure_Time != '20:30:00' and Train_Number in (select Train_no from route_info where Distance > 100));

/*10. Retrieve the User ID who has spent more ticket price than the average ticket price.*/







