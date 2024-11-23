-- LET'S OBSERVE DATA

SELECT * FROM Customer_call_list




-- DELETING UNNECESSARY COLUMNS

ALTER TABLE Customer_call_list
DROP COLUMN Not_Useful_Column, F9, F10




-- LASTNAME FORMAT

UPDATE Customer_call_list
SET Last_Name = REPLACE(REPLACE(REPLACE(Last_Name,' ',''),'/',''),'.','')




-- PHONENUMBER FORMAT

UPDATE Customer_call_list
SET Phone_Number = NULL WHERE Phone_Number = 'N/a'

UPDATE Customer_call_list
SET Phone_Number = REPLACE(REPLACE(REPLACE(Phone_Number,'-',''),'|',''),'/','')

UPDATE Customer_call_list
SET Phone_Number = CONCAT(
    SUBSTRING(Phone_Number, 1, 3), '-', 
    SUBSTRING(Phone_Number, 4, 3), '-', 
    SUBSTRING(Phone_Number, 7, 4)
)

UPDATE Customer_call_list
SET Phone_Number = NULL WHERE Phone_Number = '--'




-- FORMAT Yes OR No

UPDATE Customer_call_list
SET [Paying Customer] = REPLACE(REPLACE([Paying Customer],'Yes','Y'),'No','N')

UPDATE Customer_call_list
SET [Paying Customer] = NULL WHERE [Paying Customer] = 'N/a'



-- FORMAT Do_Not_Contact

UPDATE Customer_call_list
SET Do_Not_Contact = REPLACE(REPLACE(Do_Not_Contact,'Yes','Y'),'No','N')



-- ADDRESS FORMAT

UPDATE Customer_call_list
SET Address = NULL WHERE Address = 'N/a'



-- QUERY TO SHOW THE OUTPUT WE WANT

SELECT 
	DISTINCT(CustomerID) AS CustomerID, First_Name, Last_Name, Phone_Number, Address, [Paying Customer]

FROM Customer_call_list
WHERE Do_Not_Contact IS NOT NULL AND Do_Not_Contact = 'N' AND Phone_Number IS NOT NULL