# Dentist_database
## Dentist database by mysql.

Create a database for a dentist clinic which contains dentists and each of them has one or 
more nurse for helping him, dentist also deals with dental lab for testing the samples .
Dentists treats patients and patient may have to do X-ray that dentist must have written it 
for him, patient also may have one or more emergency contact.
Dentist has attributes of social security number and name and salary and appointments.
Nurse has attributes of social security number and name and salary and phone number.
Patient has attributes of social security number and name and birthdate and may be 
medical insured or only have credit card.
Dental lab defined by name and may be have several locations, and dental x-ray has a 
type and price.
Emergency contact has a name and phone and may have an address.

EER Diagram
![image](https://user-images.githubusercontent.com/73825127/182037293-769859bb-58a9-49d3-95bd-c9e1a500786f.png)

Relational Diagram
![image](https://user-images.githubusercontent.com/73825127/182037345-397440fb-6dfa-4a44-9a56-b3aa0c00eb2e.png)

Query to get Patient name and ssn treated by dr.K.Franklin:

SELECT P_NAME AS Patient_Name ,P_SSN AS Patient_SSN
FROM patient JOIN dentist ON DOC_SSN = D_SSN
WHERE D_NAME = 'K.Franklin'

SELECT P_NAME AS Patient_Name , P_SSN AS Patient_Ssn:

FROM patient
WHERE NOT EXISTS( SELECT * FROM emergency_contact
WHERE P_SSN=PAT_SSN);

Query get all doctors name and ssn who deals with dental lab with id ‘1’:
 
SELECT D_NAME AS Doctor_Name,D_SSN AS Doctor_Ssn
from dentist,deal
WHERE D_SSN = DOC_SSN AND D_ID = '1'

Query that get the number of nurses for each doctor:
 
SELECT D_NAME AS Doctor_Name,COUNT(*) AS Number_of_Nurses
FROM dentist,nurse
WHERE D_SSN = DOC_SSN

Query get the name and salary of doctors which their salary is above the average salary:

SELECT D_NAME AS Doctor_Name , SALARY
FROM dentist 
WHERE (SELECT AVG(SALARY) FROM dentist)<SALARY;
