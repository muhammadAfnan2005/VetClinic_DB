
--Create a database for veterenary Clinic
CREATE DATABASE VetClinicDB

USE VetClinicDB


--Table for storing Pet owner details
CREATE TABLE Owner(
ownerID VARCHAR(10) PRIMARY KEY,
ownerName VARCHAR(20) NOT NULL,
phoneNo VARCHAR(15) NOT NULL,
Email VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL);


--Table for storing Pets details
CREATE TABLE Pets(
petID INT PRIMARY KEY IDENTITY(1,1),
petName VARCHAR(20) NOT NULL,
species VARCHAR(20) NOT NULL,
breed VARCHAR(20) NOT NULL,
age int NOT NULL,
gender CHAR(1) CHECK (gender IN('M','F')) NOT NULL,
ownerID VARCHAR(10) FOREIGN KEY REFERENCES Owner(ownerID));


--Table for maintain records for all Vets working in Clinic
CREATE TABLE Vets(
vetID VARCHAR(10) Primary key,
vetName VARCHAR(20) NOT NULL,
specialization VARCHAR(20) NOT NULL,
phoneNo VARCHAR(15) UNIQUE NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
position VARCHAR(20) NOT NULL);


--Table for storing appointments
CREATE TABLE Appointment(
AppointmentID INT PRIMARY KEY IDENTITY(1,1),
petID INT FOREIGN KEY REFERENCES pets(petID),
vetID VARCHAR(10) FOREIGN KEY REFERENCES Vets(vetID),
Time DATETIME NOT NULL,
cause VARCHAR(50) NOT NULL,
UNIQUE(Time , vetID));


--Table for storing treatments
CREATE TABLE Treatments(
treatmentID INT PRIMARY KEY IDENTITY(1,1),
appoointmentID INT FOREIGN KEY REFERENCES Appointment(appointmentID),
diagnosis VARCHAR(100) NOT NULL,
medicines VARCHAR(100) NOT NULL,
dosage Varchar(150) NOT NULL,
advice TEXT );


-- Table for store all bills 
CREATE TABLE Bills(
billID INT PRIMARY KEY IDENTITY(1,1),
treatmentID INT FOREIGN KEY REFERENCES Treatments(treatmentID),
billDate DATE DEFAULT GETDATE(),
amount INT NOT NULL,
paymentstatus VARCHAR(10) CHECK (paymentstatus IN('paid','unpaid')),
paymentMethod VARCHAR(50) NOT NULL);


-- Table for maintain data for whole staff of clinic
CREATE TABLE Staff(
staffID INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(20) NOT NULL,
role VARCHAR(20) NOT NULL,
CNIC VARCHAR(15) UNIQUE NOT NULL,
phoneNo VARCHAR(15) UNIQUE NOT NULL,
address VARCHAR(100) NOT NULL,
joiningDate DATE NOT NULL );


--Table for handling vaccination details
CREATE TABLE Vaccinations(
vaccinationID int primary key identity(1,1),
petID int foreign key references Pets(petID),
VaccineName VARCHAR(50) NOT NULL,
vaccinationDate date not null,
nextDueDate date not null,
vetID varchar(10) foreign key references Vets(vetID) );


--Table for taking record for all medicines
CREATE TABLE Medicines(
medicineID int primary key identity(1,1),
medicineName varchar(20) not null,
manufacturer varchar(20) not null,
dose varchar(50) not null,
unit varchar(20) not null,
description text);

--Insertion of sample data in all tables.

INSERT INTO Owner (ownerID, ownerName, phoneNo, Email, address)
VALUES
    ('OWN001', 'Ali Khan', '+923001234567', 'ali.khan@email.com', 'House 10, Street 5, Lahore'),
    ('OWN002', 'Sara Ahmed', '+923451234567', 'sara.ahmed@email.com', 'Flat 42, Gulberg III, Lahore'),
    ('OWN003', 'Usman Malik', '+923021234567', 'usman.malik@email.com', 'House 45, Model Town, Lahore'),
    ('OWN004', 'Fatima Riaz', '+923061234567', 'fatima.riaz@email.com', 'Street 8, DHA Phase 5, Lahore'),
    ('OWN005', 'Bilal Hassan', '+923081234567', 'bilal.hassan@email.com', 'House 22, Cavalry Ground, Lahore');


INSERT INTO Pets (petName, species, breed, age, gender, ownerID)
VALUES
    ('Max', 'Dog', 'Labrador', 3, 'M', 'OWN001'),
    ('Luna', 'Cat', 'Persian', 2, 'F', 'OWN002'),
    ('Rocky', 'Dog', 'German Shepherd', 4, 'M', 'OWN003'),
    ('Milo', 'Cat', 'Siamese', 1, 'M', 'OWN004'),
    ('Bella', 'Dog', 'Golden Retriever', 5, 'F', 'OWN005');


INSERT INTO Vets (vetID, vetName, specialization, phoneNo, Email, position)
VALUES
    ('VET001', 'Dr. Asma Ali', 'Surgery', '+923111234567', 'asma.ali@vet.com', 'Senior Vet'),
    ('VET002', 'Dr. Farhan Khan', 'Dermatology', '+923121234567', 'farhan.khan@vet.com', 'Junior Vet'),
    ('VET003', 'Dr. Zainab Ahmed', 'Cardiology', '+923131234567', 'zainab.ahmed@vet.com', 'Senior Vet'),
    ('VET004', 'Dr. Omar Malik', 'Oncology', '+923141234567', 'omar.malik@vet.com', 'Head Vet'),
    ('VET005', 'Dr. Hina Riaz', 'Dentistry', '+923151234567', 'hina.riaz@vet.com', 'Junior Vet');


INSERT INTO Appointment (petID, vetID, Time, cause)
VALUES
    (1, 'VET001', '2023-10-15 10:00:00', 'Annual Checkup'),
    (2, 'VET002', '2023-10-16 11:30:00', 'Skin Allergy'),
    (3, 'VET003', '2023-10-17 09:15:00', 'Heartworm Test'),
    (4, 'VET004', '2023-10-18 14:00:00', 'Vomiting'),
    (5, 'VET005', '2023-10-19 16:45:00', 'Dental Cleaning');


INSERT INTO Treatments (appoointmentID, diagnosis, medicines, dosage, advice)
VALUES
    (1, 'Healthy', 'Multivitamin', '1 tablet daily', 'Maintain diet and exercise'),
    (2, 'Flea Allergy', 'Antihistamine', '0.5ml twice daily', 'Use flea collar'),
    (3, 'Heartworm Positive', 'Ivermectin', '0.2mg/kg weekly', 'Restrict activity'),
    (4, 'Food Poisoning', 'Antibiotic', '1 pill every 12 hours', 'Fast for 12 hours'),
    (5, 'Gingivitis', 'Dental Gel', 'Apply twice daily', 'Brush teeth weekly');


INSERT INTO Bills (treatmentID, billDate, amount, paymentstatus, paymentMethod)
VALUES
    (1, '2023-10-15', 2000, 'paid', 'Credit Card'),
    (2, '2023-10-16', 1500, 'unpaid', 'Cash'),
    (3, '2023-10-17', 3500, 'paid', 'Bank Transfer'),
    (4, '2023-10-18', 1200, 'unpaid', 'Cash'),
    (5, '2023-10-19', 1800, 'paid', 'Credit Card');


INSERT INTO Staff (name, role, CNIC, phoneNo, address, joiningDate)
VALUES
    ('Ahmed Raza', 'Receptionist', '3520212345671', '+923161234567', 'House 33, Johar Town, Lahore', '2021-01-10'),
    ('Sanaullah Khan', 'Nurse', '3520212345672', '+923171234567', 'Flat 5, Faisal Town, Lahore', '2021-03-15'),
    ('Zara Butt', 'Lab Technician', '3520212345673', '+923181234567', 'Street 9, WAPDA Town, Lahore', '2022-05-20'),
    ('Imran Shah', 'Cleaner', '3520212345674', '+923191234567', 'House 8, Sabzazar, Lahore', '2020-11-05'),
    ('Nadia Akhtar', 'Accountant', '3520212345675', '+923201234567', 'Flat 12, Garden Town, Lahore', '2022-02-28');


INSERT INTO Vaccinations (petID, VaccineName, vaccinationDate, nextDueDate, vetID)
VALUES
    (1, 'Rabies', '2023-01-10', '2024-01-10', 'VET001'),
    (2, 'FVRCP', '2023-02-15', '2024-02-15', 'VET002'),
    (3, 'Distemper', '2023-03-20', '2024-03-20', 'VET003'),
    (4, 'Leukemia', '2023-04-25', '2024-04-25', 'VET004'),
    (5, 'Bordetella', '2023-05-30', '2024-05-30', 'VET005');


INSERT INTO Medicines (medicineName, manufacturer, dose, unit, description)   
VALUES
    ('Amoxicillin', 'Pfizer', '10', 'mg', 'Antibiotic for infections'),
    ('Ivermectin', 'Merck', '0.2', 'mg', 'Heartworm treatment'),
    ('Meloxicam', 'Boehringer', '0.1', 'mg', 'Pain reliever'),
    ('Drontal', 'Bayer', '1', 'tablet/10mg', 'Deworming tablet'),
    ('Clavamox', 'Zoetis', '12.5', 'mg', 'Broad-spectrum antibiotic');

	--Creating Stored Procedures 

	--Stored procedure for insert Treatments

	CREATE PROCEDURE InsertTreatment
	@appointID int,
	@diagnosis varchar(100),
	@medicine varchar(100),
	@dose varchar(150),
	@advice text

	as
	INSERT INTO Treatments(appointmentID , diagnosis, medicines , dosage , advice)
	VALUES (@appointID , @diagnosis , @medicine , @dose, @advice);


	--Stored Procedure for Displaying all treatments

	CREATE PROCEDURE SelectTreatment
	AS
	BEGIN
	SELECT * FROM Treatments
	END;


	--Stored Procedure for delete a treatment

	CREATE PROCEDURE DeleteTreatments
	@id int
	AS
	BEGIN
	DELETE Treatments WHERE treatmentID = @id
	END


	--Stored Proceure for updating the treatment

	CREATE PROCEDURE updateTreatment
	@id int,
	@appointID int,
	@diagnosis varchar(100),
	@medicine varchar(100),
	@dose varchar(150),
	@advice text

	AS
	BEGIN
	UPDATE Treatments
	SET diagnosis = @diagnosis,
	medicines = @medicine,
	dosage = @dose,
	advice = @advice
	WHERE treatmentID = @id
	END


	--Stored Procedure for displaying all details of specific pet 

	CREATE PROCEDURE SelectPetDetails_ByID
	@petID int
	AS
	BEGIN
	SELECT p.petname,
	p.species,
	o.ownerName,
	a.Time AS [AppointmentTime],
	v.vetName,
	a.cause,
	t.diagnosis,
	t.medicines,
	t.dosage,
	t.advice
	From Pets p INNER JOIN Owner o ON o.ownerID = p.ownerID
	INNER JOIN Appointment a ON p.petID = a.petID
	INNER JOIN Vets v ON v.vetID = a.vetID
	INNER JOIN Treatments t ON t.appointmentID = a.AppointmentID

	WHERE @petID=p.petID
	END;