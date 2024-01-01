USE diabetes_db;

select * from diabetes;

-- 1. Retrieve the Patient_id and ages of all patients.

select Patient_id, age
from diabetes;

-- 2. Select all female patients who are older than 40.

select * from diabetes
where gender = 'female' AND age > 40;

-- 3. Calculate the average BMI of patients.

select avg(bmi) as average_bmi
from diabetes;

-- 4. List patients in descending order of blood glucose levels.

select EmployeeName, Patient_id, age, blood_glucose_level from diabetes
order by blood_glucose_level desc;

-- 5. Find patients who have hypertension and diabetes.

select EmployeeName, gender, hypertension, diabetes from diabetes
where hypertension = 1 AND diabetes = 1;


-- 6. Determine the number of patients with heart disease.

select count(Patient_id) as heart_disease_patient from diabetes
where heart_disease=1;


-- 7. Group patients by smoking history and count how many smokers and non-smokers there are.

select Count(*) as total_count, smoking_history from diabetes
group by smoking_history;

-- 8. Retrieve the Patient_ids of patients who have a BMI greater than the average BMI.

select Patient_id, bmi from diabetes
where bmi > (select AVG(bmi) from diabetes);

-- 9. Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel.

select patient_id, MAX(HbA1c_level) as highest_level, min(HbA1c_level) as lowest_level
from diabetes;

-- 10. Calculate the age of patients in years (assuming the current date as of now).

SELECT 
    employeename,
    age, 
    CURDATE() - INTERVAL age YEAR AS approximate_date_of_birth
FROM diabetes;

-- 11. Rank patients by blood glucose level within each gender group.

select patient_id, blood_glucose_level, gender,
rank() over(partition by gender order by blood_glucose_level) as glucose_level_rank
from diabetes;

-- 12. Update the smoking history of patients who are older than 50 to "Ex-smoker."

UPDATE diabetes
SET smoking_history = 'Ex-smoker'
where age>50

select * from diabetes;

-- 13. Insert a new patient into the database with sample data.

INSERT INTO diabetes VALUES('Neymar Junior','PT100','Male',37,0,1,'current',23.46,4.2,152,0);

-- 14. Delete all patients with heart disease from the database.

DELETE FROM diabetes
where heart_disease=1;

-- 15. Find patients who have hypertension but not diabetes using the EXCEPT operator.

select * from diabetes
where hypertension=1
except
select * from diabetes
where diabetes=1; 

-- 16. Define a unique constraint on the "patient_id" column to ensure its values are unique.

ALTER TABLE diabetes
ADD UNIQUE(patient_id);

-- 17. Create a view that displays the Patient_ids, ages, and BMI of patients

CREATE VIEW Patient_info AS
select patient_id, age, bmi from diabetes;

select * from diabetes;
