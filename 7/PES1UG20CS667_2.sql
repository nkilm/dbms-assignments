DELIMITER $$
CREATE procedure calc_age()
BEGIN
    DECLARE TodayDate DATE;
    SELECT CURRENT_DATE() INTO TodayDate;
    UPDATE train_user 
    SET age= YEAR(TodayDate) -year(dob);    
END$$
DELIMITER ;

set SQL_SAFE_UPDATES=0;
call calc_age();
select * from train_user;