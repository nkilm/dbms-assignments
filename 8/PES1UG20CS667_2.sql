DELIMITER $$
CREATE procedure calculate_age()
BEGIN
    DECLARE TodayDate DATE;
    SELECT CURRENT_DATE() INTO TodayDate;
    UPDATE user 
    SET age= YEAR(TodayDate) -year(dob);    
END$$
DELIMITER ;
