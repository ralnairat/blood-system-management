CREATE TABLE Patient
(Patient_ID         INT         NOT NULL,
Patient_Name       VARCHAR(40) NOT NULL,
Blood_Group        VARCHAR(4)  NOT NULL,
Disease            CHAR(2) CHECK (Disease IN('A','B','AB','O')),
Patient_Contact    decimal (10,0),
Patient_Address    VARCHAR(45),
CONSTRAINT Patient_PK PRIMARY KEY (Patient_ID));
I
CREATE TABLE Donor
    (Donor_ID           INT         NOT NULL,
     Donor_Name         VARCHAR(40) NOT NULL,
     Medical_Report     VARCHAR(30) NOT NULL
                CHECK (Medical_Report IN('Satisfactory','Not Satisfactory')),
     Donor_Addresss     VARCHAR(45),
     Donor_Contact      decimal(10,0),
CONSTRAINT Donor_PK PRIMARY KEY (Donor_ID));

CREATE TABLE Blood_Bank
    (Blood_Bank_ID      INT             NOT NULL,
     Blood_Bank_Name    VARCHAR(50)     NOT NULL,
     Blood_Bank_Address VARCHAR(45),
     Blood_Bank_Contact decimal(10,0),
     Donor_ID           INT,
     Patient_ID         INT,
CONSTRAINT Blood_Bank_PK PRIMARY KEY (Blood_Bank_ID),
CONSTRAINT Blood_Bank_FK1 FOREIGN KEY (Donor_ID)  REFERENCES Donor(Donor_ID),
CONSTRAINT Blood_Bank_FK2 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID));

NSERT INTO Patient VALUES (111,'hala elayyan','AB+','O',7781526484,'111 Amman') ;
INSERT INTO Patient VALUES (112,'hedaya nairat','B+','AB',2635498752,'112 Eygpt') ;
	INSERT INTO Patient VALUES (113,'solaf emad','0-','A',9874526163,'113 Qatar') ;
INSERT INTO Patient VALUES (114,'Sara ahmed','AO','B',3182496734,'114 Jordan') ;
INSERT INTO Patient VALUES (115,'Natali zaid','A+','O',3145978632,'115 dubai') ;


INSERT INTO Donor VALUES (211,'Lara rafat','Satisfactory','211 Irbd',3241568794);
INSERT INTO Donor VALUES (212,'manal mansour','Not Satisfactory','212 Aqaba',9874562134);
INSERT INTO Donor VALUES (213,'Zain firas','Satisfactory','213 Amman',9513572586);
INSERT INTO Donor VALUES (214,'amena mhammad','Not Satisfactory','214 Doha',7531592486);
INSERT INTO Donor VALUES (215,'retaj saif','Satisfactory','215 Jeddah',5821955374);


INSERT INTO Blood_Bank Values (311,'Irbd Blood Bank','311 Irbd','6667778888',211,111);
INSERT INTO Blood_Bank Values (312,' Aqaba Blood Bank','312  Aqaba','7778889999',213,112);
INSERT INTO Blood_Bank Values (313,'Amman Blood Bank','313 Amman','8889991111',215,113);
INSERT INTO Blood_Bank Values (314,'Doha Blood Bank','314 Doha','9991112222',215,114);
INSERT INTO Blood_Bank Values (315,'Jeddah Blood Bank','315 Jeddah','1112223333',213,115);


SELECT Patient_Name,Blood_Group,Disease FROM Patient WHERE Patient_ID = 115;

SELECT Donor_Name,Donor_Addresss,Donor_Contact,Medical_Report
FROM Donor WHERE Medical_Report = 'Satisfactory';

SELECT Donor_Name,Donor_Addresss,Donor_Contact,Medical_Report
FROM Donor WHERE Medical_Report = 'Not Satisfactory';

SELECT Patient_Name,Blood_Group,Blood_Bank_Name,blood_bank.patient_id,patient.patient_id
FROM Patient, Blood_Bank WHERE blood_bank.patient_id = patient.patient_id;

SELECT Donor_Name,Medical_Report,Donor_Addresss,donor.donor_id,Blood_Bank_Name
FROM Donor,Blood_Bank WHERE blood_bank.donor_id = donor.donor_id;

SELECT Blood_Bank_Name, Blood_Bank_Contact,Patient_Name,Patient.Patient_id
FROM Blood_Bank, Patient WHERE patient.patient_id = blood_bank.patient_id;

SELECT Patient_Name, Donor_Name, Blood_Bank_Name, Blood_Group, Medical_Report
FROM Blood_Bank,Patient,Donor WHERE blood_bank.patient_id = patient.patient_id AND blood_bank.donor_id = donor.donor_id;

SELECT * FROM Donor LEFT OUTER JOIN  Blood_Bank
ON Blood_Bank.Donor_ID = donor.donor_id;

select * from Blood_Bank
select * from Donor
select * from Patient
