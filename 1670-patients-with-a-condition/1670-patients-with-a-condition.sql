# Write your MySQL query statement below
-- select patient_id  , patient_name ,conditions
-- from Patients
-- where conditions like "%DIAB1%" or conditions like "DIAB1%" or conditions like "%DIAB1"


SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions REGEXP '(^| )DIAB1[0-9]*(| )';