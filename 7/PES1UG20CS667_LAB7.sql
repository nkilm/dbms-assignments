-- NAME: NIKHIL RAJU MOHITE
-- SRN : PES1UG20CS667
-- Given insert command
insert into ticket(
        pnr,
        train_no,
        travel_date,
        departure,
        arrival,
        departure_time,
        arrival_time,
        user_id,
        train_type,
        compartment_type,
        compartment_no
    )
values (
        'PNR021',
        62621,
        '2021-10-22',
        'Bengaluru',
        'Chennai',
        '16:00:00',
        '20:30:00',
        'USR_008',
        'Superfast',
        'I Class',
        'F01'
    );
-- 1. 
select u.user_id,
    u.user_type,
    u.fname,
    u.lname
from user u
    join ticket t on u.user_id = t.user_id
where MONTH(t.travel_date) = 10
    and YEAR(t.travel_date) = 2021
    and departure = "Bengaluru"
    and arrival = "Chennai"
union
select u.user_id,
    u.user_type,
    u.fname,
    u.lname
from user u
    join ticket t on u.user_id = t.user_id
where MONTH(t.travel_date) = 8
    and YEAR(t.travel_date) = 2022
    and departure = "Bengaluru"
    and arrival = "Chennai";
-- 2.
select u1.user_id,
    u1.user_type,
    u1.fname,
    u1.lname
from user u1
    join ticket t on u1.user_id = t.user_id
where departure = "Bengaluru"
    and arrival = "Chennai"
    and MONTH(t.travel_date) = 10
    and YEAR(t.travel_date) = 2021
    and exists(
        select u2.user_id,
            u2.user_type,
            u2.fname,
            u2.lname
        from user u2
            join ticket t2 on u2.user_id = t2.user_id
        where departure = "Bengaluru"
            and arrival = "Chennai"
            and MONTH(t2.travel_date) = 8
            and YEAR(t2.travel_date) = 2022
            and u1.user_id = u2.user_id
    );
-- 3. 
select u1.user_id,
    u1.user_type,
    u1.fname,
    u1.lname
from user u1
    join ticket t on u1.user_id = t.user_id
where departure = "Bengaluru"
    and arrival = "Chennai"
    and MONTH(t.travel_date) = 8
    and YEAR(t.travel_date) = 2022
    and not exists(
        select u2.user_id,
            u2.user_type,
            u2.fname,
            u2.lname
        from user u2
            join ticket t2 on u2.user_id = t2.user_id
        where departure = "Bengaluru"
            and arrival = "Chennai"
            and MONTH(t2.travel_date) = 10
            and YEAR(t2.travel_date) = 2021
            and u1.user_id = u2.user_id
    );
-- 4.
select u1.user_id,
    u1.user_type,
    u1.fname,
    u1.lname
from user u1
where u1.user_id = (
        select distinct t1.user_id
        from ticket t1
        where t1.departure = "Bengaluru"
            and t1.arrival = "Chennai"
            and exists(
                select t2.user_id
                from ticket t2
                where t1.user_id = t2.user_id
                    and t2.departure = "Chennai"
                    and t2.arrival = "Bengaluru"
                    and datediff(t2.travel_date, t1.travel_date) < 8
            )
    );
-- 5.
select u.user_id,
    user_type,
    fname,
    lname
from user u
    join ticket as t on u.user_id = t.user_id
where departure = 'Bengaluru'
    and arrival = 'Chennai'
    and not exists(
        select u.user_id,
            user_type,
            fname,
            lname
        from user as u
            join ticket as t on u.user_id = t.user_id
        where departure = 'Chennai'
            and arrival = 'Bengaluru'
    );