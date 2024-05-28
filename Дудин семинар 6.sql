use lesson_dud;
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION convertSec3(n INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
	DECLARE D INT DEFAULT 0;
    DECLARE H INT DEFAULT 0;
    DECLARE M INT DEFAULT 0;
    DECLARE S INT DEFAULT 0;
    DECLARE res VARCHAR(250);
    SET D=floor(n/(24*60*60));
    SET H=floor((n-D*24*60*60)/(60*60));
    SET M=floor((n-H*60*60-D*24*60*60)/60);
    SET S=floor((n-H*60*60-D*24*60*60-M*60));
    SET res=concat(D,' days ',H,' hours ',M,' minutes ',S,' seconds ');
	RETURN res;
	
END $$
DELIMITER ;
SELECT convertSec3(123456);

-- 2. Выведите только чётные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DELIMITER $$
CREATE PROCEDURE chetnumb()
BEGIN
	DECLARE n INT DEFAULT 1;
    DECLARE f1 INT DEFAULT 0;
    DECLARE s VARCHAR(789) DEFAULT '';
	WHILE n<=10 DO
		IF n%2=0 THEN
			SET f1=n;
            SET s= concat(s, ',',f1);
		END IF;
		
		SELECT s;
		SET n=n+1;
    
    
    END WHILE;
END $$
DELIMITER ;


CALL chetnumb();