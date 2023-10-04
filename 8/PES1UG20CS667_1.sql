delimiter $$
Create function check_ticket_limit(u_id varchar(255))
returns varchar(255) 
deterministic
begin
   declare tkt_count int;
   declare ret_msg varchar(255);

select count(user_id) into tkt_count
from ticket
where   user_id = u_id and 
		month(travel_date)=month(sysdate()) and 
		year(travel_date)=year(sysdate());

if tkt_count > 3 then
      set ret_msg := ("you can not buy any more tickets - Current Limit Reached");
else
      set ret_msg := Concat("Remaining buying limit is ", 3 - tkt_count," tickets"); 
end if;
   return ret_msg;
end;
$$
delimiter ;

-- call the function
select distinct user_id, check_ticket_limit(user_id) from ticket;