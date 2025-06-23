--CREATE ALL TABLES

CREATE TABLE TrainOperators (
	OperatorID VARCHAR (100) PRIMARY KEY,
	OperatorFirstname VARCHAR (100),
	OperatorLastname VARCHAR (100),
	OperatorAge INT, 
	YearsOfExp INT,
	OperationHours INT,
	OperationPosition VARCHAR (100),
	OperatorSalary INT
);


CREATE TABLE TrainAttendant (
	AttendantID VARCHAR (100) PRIMARY KEY,
	AttendantFullname VARCHAR (100),
	AttendantPosition VARCHAR(100),
	AttendantSalary INT,
	AttendantPhoneNumber INT,
	AttendantAddress VARCHAR(100)
);


CREATE TABLE Customer(
CustomerID nvarchar(30) not null PRIMARY KEY,
CustomerFirstName nvarchar(50),
CustomerLastName nvarchar(50),
MailingAddress nvarchar(150),
Email nvarchar(50),
HousePhoneNumber int,
Street nvarchar(50),
CustomerCity nvarchar(50),
CustomerState nvarchar(30),
PostalCode int,
CustomerCountry nvarchar(30)
);


Create Table Routes(
TrackID nvarchar(10)not null Primary key,
TrackName nvarchar(20),
AttachedTrains int,
);


CREATE TABLE Reservation(
ReservationID nvarchar(30) not null PRIMARY KEY,
CustomerID nvarchar(30) not null FOREIGN KEY REFERENCES Customer(CustomerID),
ReservationState nvarchar(30),
ReservationDate date,
ReservationDepartureStation nvarchar(30),
ReservationArrivalStation nvarchar(30),
SeatsReserved int,
SeatClass nvarchar(15),
ReservationTotal decimal (10,2)
);


create table Train(
TrainID nvarchar(10) PRIMARY KEY,
TrackID nvarchar(10) FOREIGN KEY REFERENCES Routes(TrackID),
TotalSeatBusiness int,
TotalSeatEconomy int
);


create table Schedule(
JourneyID nvarchar(5) PRIMARY KEY,
TrainID nvarchar(10) FOREIGN KEY REFERENCES Train(TrainID),
JourneyDepartureStation nvarchar(50),
JourneyArrivalStation nvarchar(50),
JourneyDepartureTime time,
JourneyArrivalTime time
);



Create Table Stations(
StationID nvarchar(10) not null Primary key,
TrackID nvarchar(10)not null Foreign key references Routes(TrackID),
StationName nvarchar(20)
);


CREATE TABLE TrainAttendantDuty (
    TrainID NVARCHAR(10),
    AttendantID VARCHAR(100),
    PRIMARY KEY (TrainID, AttendantID),
    CONSTRAINT FK_Train_TrainAttendantDuty FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    CONSTRAINT FK_Attendant_TrainAttendantDuty FOREIGN KEY (AttendantID) REFERENCES TrainAttendant(AttendantID)
);


CREATE TABLE TrainOperatorDuty (
    TrainID NVARCHAR(10),
    OperatorID VARCHAR(100),
	Role NVARCHAR(15),
    PRIMARY KEY (TrainID, OperatorID),
    CONSTRAINT FK_Train_TrainOperatorDuty FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    CONSTRAINT FK_Operator_TrainOperatorDuty FOREIGN KEY (OperatorID) REFERENCES TrainOperators(OperatorID)
);


CREATE TABLE JourneyReservations (
    ReservationID NVARCHAR(30),
    JourneyID NVARCHAR(5),
    PRIMARY KEY (ReservationID, JourneyID),
    CONSTRAINT FK_Reservation_JourneyReservations FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    CONSTRAINT FK_Journey_JourneyReservations FOREIGN KEY (JourneyID) REFERENCES Schedule(JourneyID)
);


--INSERT VALUES

INSERT INTO TrainOperators (OperatorID, OperatorFirstname, OperatorLastname, OperatorAge, YearsOfExp, OperationHours, OperationPosition, OperatorSalary) 
VALUES
('Z0001', 'Celestina', 'Evert', 45, 25, 20000, 'Senior', 10000),
('Z0002', 'Jules', 'Mack', 23, 4, 5000, 'Junior', 5000),
('Z0003', 'Ammer', 'Ahmad', 33, 9, 9000, 'Junior', 8000),
('Z0004', 'Cameo', 'Olivera', 46, 5, 4000, 'Junior', 5000),
('Z0005', 'Esmeralda', 'Davidson', 67, 35, 40000, 'Senior', 15000),
('Z0006', 'Carey', 'Carling', 20, 2, 1500, 'Junior', 3000),
('Z0007', 'Danielle', 'Brown', 55, 20, 25000, 'Senior', 17000),
('Z0008', 'Cassandra', 'Shultz', 39, 9, 7000, 'Junior', 6000),
('Z0009', 'Aven', 'Maxwell', 50, 15, 30000, 'Senior', 12000),
('Z0010', 'Isadora', 'Ripley', 21, 2, 2000, 'Junior', 4000);


INSERT INTO TrainAttendant (AttendantID, AttendantFullname, AttendantPosition, AttendantSalary, AttendantPhoneNumber, AttendantAddress) 
VALUES
('S0001', 'Arthur Morgan', 'Senior', 25000, '0145558139', 'Selangor, One South'),
('S0002', 'John Marston', 'Junior', 7000, '0149858139', 'Selangor, Parkhill'),
('S0003', 'Josaw Graham', 'Senior', 30000, '0145550139', 'KL, Ibis Hotel'),
('S0004', 'Kendrick Lamar', 'Junior', 3000, '0109858139', 'Selangor, Parkhill'),
('S0005', 'Taylor Ring', 'Senior', 10000, '0145598739', 'Selangor, Fortune Park'),
('S0006', 'Morget Dwane', 'Junior', 7000, '0140960139', 'California, Grill Yard'),
('S0007', 'Kevin Hart', 'Senior', 26000, '0109297139', 'Yemen, Aden'),
('S0008', 'Jeff Bezos', 'Junior', 6000, '0140908439', 'Saudi Arabia, Swiss'),
('S0009', 'King Kong', 'Junior', 3500, '0147460139', 'Ipoh, High Round'),
('S0010', 'Bruce Wayne', 'Senior', 10000, '0140960119', 'California, Cave Rain');


INSERT INTO Customer(CustomerID, CustomerFirstName, CustomerLastName, MailingAddress, Email, HousePhoneNumber, Street, CustomerCity, CustomerState, PostalCode, CustomerCountry)
values ('A016789', 'Siti', 'Zahra', 'Seri Pacific Hotel, 1 Jalan Putra, Putra World Trade Centre, 50350 Kuala Lumpur, Wilayah Persekutuan', 'siti.zahra@example.com', '0123456789',
'Jalan Putra', 'Penang', 'Kuala Lumpur', '50350', 'Malaysia'),

('A017890', 'Ahmad', 'Farid', 'Grand BlueWave Hotel, 7 Jalan Bukit Bintang, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan', 'ahmad.farid@example.com', '0198765432',
'Jalan Bukit Bintang', 'Johor Bahru', 'Kuala Lumpur', '55100', 'Malaysia'),

('A011112', 'Peter', 'Guy', 'Hallmark View Hotel - Melaka, 9830, Jalan Bukit Baru, Bukit Baru, 75150 Malacca', 'peterthehorseishere@gmail.com', '01199998888',
'Jalan Bukit Baru', 'Bukit Baru', 'Malacca', '75150', 'Malaysia'),

('A013462', 'Glutius', 'Maximus', 'Pulai Springs Resort, Johor Bahru (Resort Hotel), Jalan Pontian Lama, Pulai, 81110 Johor Bahru, Johor', 'electricpants@hotmail.com', '01166666666',
'Jalan Pntian Lama', 'Johor Bahru', 'Johor', '81110', 'Malaysia'),


('A023372', 'Leo', 'Game Bling', 'Stadium Sultan Abdul Halim, Jalan Suka Menanti, Kampung Pumpong, 05250 Alor Setar, Kedah',
'youwontregretit@lottery.com', '01177777777', 'Jalan Suka Menanti', 'Alor Setar', 'Kedah', '05250', 'Malaysia'),

('A666666', 'Lucifer', 'Man', 
'ROHM Electronics (Malaysia) Sdn. Bhd., Lot 1320, Kawasan Perindustrian Pengkalan Chepa II, Jalan Padang Tembak, 16100 Kota Bharu, Kelantan', 
'hellman@hotmail.com', '01166666667',
'Jalan Padang Tembak', 'Kota Bharu', 'Kelantan', '16100', 'Malaysia'),

('A111111', 'Iam', 'GoodMan', 
'Nasi Dagang Atas Tol - Hiliran, Jalan Hiliran, Kampung Tok Ku, 21000 Kuala Terengganu, Terengganu', 
'goodman@hotmail.com', '01155555555',
'Jalan Hiliran', 'Kuala Terengganu', 'Terengganu', '21000', 'Malaysia'),

('A462362', 'Food', 'EatMan', 
'New Lane Street Foodstalls, Lorong Baru, 10450 George Town, Penang', 
'foodismyblood@aol.com', '01170035332',
'Lorong Baru', 'George Town', 'Penang', '10450', 'Malaysia'),

('A333222', 'Guru', 'EatMan', 
'Institut Pendidikan Guru Kampus Raja Melewar, Jalan Sikamat, Maktab Perguruan Raja Melewar, 70400 Seremban, Negeri Sembilan', 
'guruinmyveins@aol.com', '01170035333',
'Jalan Sikamat', 'Seremban', 'Negeri Sembilan', '70400', 'Malaysia'),

('A555444', 'Father', 'AllMen', 
'Petronas Twin Towers, Petronas Twin Tower, Lower Ground (Concourse) Level, Kuala Lumpur City Centre, 50088 Kuala Lumpur', 
'heedmywords@transgression.com', '01191774061',
'Kuala Lumpur City Centre', 'Kuala Lumpur', 'Kuala Lumpur', '50088', 'Malaysia');


INSERT INTO Reservation(ReservationID, CustomerID, ReservationState, ReservationDate, ReservationDepartureStation, ReservationArrivalStation, 
SeatsReserved, SeatClass, ReservationTotal)
values
('TR1-A000001', 'A666666', 'Kelantan', '2024-07-23', 'Kelantan', 'Kuala Lumpur', 1, 'Business', 9),
('TR2-A000001', 'A462362', 'Penang', '2024-07-23', 'Pualu Pinang', 'Melaka', 2, 'Business', 18),
('TR2-A003333', 'A111111', 'Terengganu', '2024-07-22', 'Terengganu', 'Johor', 4, 'Economy', 40),
('TR1-A004343', 'A016789', 'Kuala Lumpur', '2024-07-19', 'Kuala Lumpur', 'Perak', 1, 'Business', 3),
('TR2-A011112', 'A017890', 'Perak', '2024-07-31', 'Johor', 'Perlis', 2, 'Economy', 28),
('TR2-A086571', 'A011112', 'Malacca', '2024-07-27', 'Melaka', 'Perak', 2, 'Economy', 8),
('TR1-A030041', 'A013462', 'Johor', '2024-07-27', 'Melaka', 'Johor', 1, 'Economy', 4),
('TR1-A000921', 'A666666', 'Kedah', '2024-07-26', 'Pualu Pinang', 'Kedah', 5, 'Business', 15),
('TR2-A020301', 'A333222', 'Negeri Sembilan', '2024-08-01', 'Negeri Sembilan', 'Kedah', 6, 'Economy', 60),
('TR1-A000111', 'A666666', 'Kuala Lumpur', '2024-07-30', 'Kuala Lumpur', 'Pahang', 1, 'Business', 3);


Insert into Routes
(TrackID,TrackName,AttachedTrains)
values
('NA1079','Northen Track','8'),
('CA8760','East Coast Track','5'),
('SA1865','Southern Track','3');


insert into Train
(TrainID, TrackID, TotalSeatBusiness, TotalSeatEconomy)
values
('NT-01','NA1079','60','550'),
('NT-02','NA1079','40','550'),
('NT-03','NA1079','40','550'),
('NT-04','NA1079','40','550'),
('ET-01','CA8760','40','550'),
('ET-06','CA8760','40','550'),
('ET-07','CA8760','40','550'),
('ST-01','SA1865','40','550'),
('ST-09','SA1865','50','550'),
('ST-10','SA1865','40','550'),
('ST-11','SA1865','55','550'),
('ST-12','SA1865','40','550'),
('NT-13','NA1079','40','550'),
('NT-14','NA1079','50','550'),
('NT-15','NA1079','40','550'),
('NT-16','NA1079','40','550');


insert into Schedule
(JourneyID, TrainID, JourneyDepartureStation, JourneyArrivalStation, JourneyDepartureTime, JourneyArrivalTime)
values
('A3242', 'NT-01','Kuala Lumpur', 'Perak', '08:00:00', '8:45:00'),
('A3243', 'NT-01','Perak', 'Puala Pinang', '09:00:00', '09:45:00'),
('A3244', 'NT-01','Puala Pinang', 'Kedah', '10:00:00', '10:45:00'),
('A3245', 'NT-01','Kedah', 'Perlis', '11:00:00', '11:45:00'),
('A3232', 'NT-01','Perlis', 'Kedah', '12:00:00', '12:45:00'),
('A3233', 'NT-01','Kedah', 'Puala Pinang', '13:00:00', '13:45:00'),
('A3234', 'NT-01','Puala Pinang', 'Perak', '14:00:00', '14:45:00'),
('A3235', 'NT-01','Perak', 'Kuala Lumpur','15:00:00', '15:45:00'),

('A4242', 'ET-01', 'Kuala Lumpur', 'Pahang', '08:00:00', '8:45:00'),
('A4243', 'ET-01', 'Pahang', 'Terengganu','09:00:00', '9:45:00'),
('A4244', 'ET-01', 'Terengganu', 'Kelantan','10:00:00', '10:45:00'),
('A4232', 'ET-01', 'Kelantan', 'Terengganu','11:00:00', '11:45:00'),
('A4233', 'ET-01', 'Terengganu', 'Pahang', '12:00:00', '12:45:00'),
('A4234', 'ET-01', 'Pahang', 'Kuala Lumpur', '13:00:00', '13:45:00'),

('A5242', 'ST-01', 'Kuala Lumpur', 'Melaka', '08:00:00', '8:45:00'),
('A5243', 'ST-01', 'Melaka', 'Negeri Sembilan','09:00:00', '9:45:00'),
('A5244', 'ST-01', 'Negeri Sembilan', 'Johor','10:00:00', '10:45:00'),
('A5232', 'ST-01', 'Johor', 'Negeri Sembilan', '11:00:00', '11:45:00'),
('A5233', 'ST-01', 'Negeri Sembilan', 'Melaka', '12:00:00', '12:45:00'),
('A5234', 'ST-01', 'Melaka', 'Kuala Lumpur','13:00:00', '13:45:00');


insert into JourneyReservations (ReservationID, JourneyID) values
('TR1-A000001','A4232'),
('TR1-A000001','A4233'),
('TR1-A000001','A4234'),

('TR1-A000111','A4242'),

('TR1-A000921','A3244'),

('TR1-A004343','A3242'),

('TR1-A030041','A5243'),
('TR1-A030041','A5244'),

('TR2-A000001','A3234'),
('TR2-A000001','A3235'),
('TR2-A000001','A5242'),

('TR2-A003333','A4233'),
('TR2-A003333','A4234'),
('TR2-A003333','A5242'),
('TR2-A003333','A5243'),
('TR2-A003333','A5244'),

('TR2-A011112','A5232'),
('TR2-A011112','A5233'),
('TR2-A011112','A5234'),
('TR2-A011112','A3242'),
('TR2-A011112','A3243'),
('TR2-A011112','A3244'),
('TR2-A011112','A3245'),

('TR2-A020301','A5233'),
('TR2-A020301','A5234'),
('TR2-A020301','A3242'),
('TR2-A020301','A3243'),
('TR2-A020301','A3244'),

('TR2-A086571','A5234'),
('TR2-A086571','A3242');


insert into TrainOperatorDuty (TrainID, OperatorID, Role) values
('ET-01','Z0001','Captain'),
('ET-06','Z0007','Captain'),
('ET-07','Z0009','Captain'),
('NT-01','Z0002','Captain'),
('NT-02','Z0007','Captain'),
('NT-03','Z0009','Captain'),
('NT-04','Z0001','Captain'),
('NT-13','Z0003','Captain'),
('NT-14','Z0005','Captain'),
('NT-15','Z0006','Captain'),
('NT-16','Z0007','Captain'),
('ST-01','Z0003','Captain'),
('ST-09','Z0007','Captain'),
('ST-10','Z0009','Captain'),
('ST-11','Z0001','Captain'),
('ST-12','Z0003','Captain'),

('ET-01','Z0004','Co-Captain'),
('ET-06','Z0008','Co-Captain'),
('ET-07','Z0010','Co-Captain'),
('NT-01','Z0005','Co-Captain'),
('NT-02','Z0008','Co-Captain'),
('NT-03','Z0010','Co-Captain'),
('NT-04','Z0002','Co-Captain'),
('NT-13','Z0004','Co-Captain'),
('NT-14','Z0008','Co-Captain'),
('NT-15','Z0009','Co-Captain'),
('NT-16','Z0010','Co-Captain'),
('ST-01','Z0006','Co-Captain'),
('ST-09','Z0008','Co-Captain'),
('ST-10','Z0010','Co-Captain'),
('ST-11','Z0002','Co-Captain'),
('ST-12','Z0004','Co-Captain');


insert into TrainAttendantDuty (TrainID, AttendantID) values
('ET-01','S0001'),
('ET-06','S0007'),
('ET-07','S0009'),
('NT-01','S0002'),
('NT-02','S0007'),
('NT-03','S0009'),
('NT-04','S0001'),
('NT-13','S0003'),
('NT-14','S0005'),
('NT-15','S0006'),
('NT-16','S0007'),
('ST-01','S0003'),
('ST-09','S0007'),
('ST-10','S0009'),
('ST-11','S0001'),
('ST-12','S0003'),

('ET-01','S0010'),
('ET-07','S0006'),
('NT-01','S0004'),
('NT-02','S0009'),
('NT-03','S0006'),
('NT-13','S0002'),
('ST-09','S0005'),
('ST-10','S0010'),
('ST-11','S0002'),
('ST-12','S0007'),

('ET-01','S0008'),
('ET-07','S0008'),
('NT-02','S0002'),
('NT-03','S0005'),
('ST-10','S0001'),
('ST-12','S0010');


Insert into Stations
(TrackID,StationID,StationName)
values
('NA1079','N-01','Kuala Lumpur'),
('NA1079','N-02','Perak'),
('NA1079','N-03','Puala Pinang'),
('NA1079','N-04','Kedah'),
('NA1079','N-05','Perlis'),

('CA8760','EC-01','Kuala Lumpur'),
('CA8760','EC-02','Pahang'),
('CA8760','EC-03','Terengganu'),
('CA8760','EC-04','Kelantan'),

('SA1865','S-01','Kuala Lumpur'),
('SA1865','S-02','Melaka'),
('SA1865','S-03','Negeri Sembilan'),
('SA1865','S-04','Johor');



-- QUESTIONS


-- Yoosuf Shariq Shahid TP071930 
--1
SELECT AVG(OperatorSalary) AS AverageSalary
FROM TrainOperators
WHERE OperationHours >= 15000;

--2
SELECT
    OperatorFirstname,
    OperatorLastname,
    OperatorAge,
    YearsOfExp
FROM
    TrainOperators
JOIN
    TrainOperatorDuty ON TrainOperators.OperatorID = TrainOperatorDuty.OperatorID
JOIN
    Train ON TrainOperatorDuty.TrainID = Train.TrainID
WHERE
    Train.TrainID IN
	(SELECT TrainID FROM Schedule WHERE JourneyDepartureStation IN 
	(SELECT StationName FROM Stations WHERE TrackID = 'NA1079') OR JourneyArrivalStation IN 
	(SELECT StationName FROM Stations WHERE TrackID = 'NA1079'));

--3
SELECT TOP 1 * FROM Routes
ORDER BY AttachedTrains DESC;

--4
SELECT CustomerFirstName, CustomerLastName FROM Customer
JOIN Reservation ON Customer.CustomerID = Reservation.CustomerID
GROUP BY Customer.CustomerFirstName, Customer.CustomerLastName
HAVING COUNT(Reservation.ReservationID) > 2;

--5
SELECT DISTINCT AttendantFullname, AttendantPosition
FROM TrainAttendant
JOIN TrainAttendantDuty ON TrainAttendant.AttendantID = TrainAttendantDuty.AttendantID
JOIN TrainOperatorDuty ON TrainAttendantDuty.TrainID = TrainOperatorDuty.TrainID
JOIN TrainOperators TrainOperators ON TrainOperatorDuty.OperatorID = TrainOperators.OperatorID
WHERE TrainOperators.OperatorFirstname = 'Ammer';

--6
SELECT DISTINCT CustomerFirstName, CustomerLastName, CustomerState
FROM Customer
JOIN Stations ON Customer.CustomerState = Stations.StationName;

--7
SELECT TOP 1 * FROM Train
ORDER BY TotalSeatBusiness DESC;

--8
SELECT CustomerFirstName, CustomerLastName
FROM Customer
WHERE CustomerID NOT IN
    (SELECT DISTINCT CustomerID FROM Reservation);

--9
SELECT TrackID, TrackName,
(SELECT COUNT(*) FROM Train
 WHERE Train.TrackID = Routes.TrackID) AS TotalTrains
FROM Routes;


--  Ahmed Zakwaan Shareef TP078882 
--10
SELECT AttendantFullname, AttendantPosition FROM TrainAttendant
WHERE AttendantSalary NOT IN (2800, 3500);

--11
SELECT CustomerFirstName, CustomerLastName,
COUNT(Reservation.ReservationID) AS TotalReservations FROM Customer
JOIN Reservation ON Customer.CustomerID = Reservation.CustomerID
GROUP BY Customer.CustomerFirstName, Customer.CustomerLastName
HAVING 
COUNT(Reservation.ReservationID) = 
(SELECT MAX(ReservationCount) FROM 
(SELECT COUNT(ReservationID) AS ReservationCount FROM Reservation
GROUP BY CustomerID) AS ReservationCounts);

--12
SELECT * FROM
(SELECT T.TrackID, COUNT(*) AS TotalReservations
FROM Reservation R
JOIN JourneyReservations JR ON R.ReservationID = JR.ReservationID
JOIN Schedule S ON JR.JourneyID = S.JourneyID
JOIN Train T ON S.TrainID = T.TrainID
GROUP BY T.TrackID) AS TrackReservationCounts
WHERE TotalReservations =
(SELECT MAX(TotalReservations) FROM
(SELECT T.TrackID, COUNT(*) AS TotalReservations FROM Reservation R
JOIN JourneyReservations JR ON R.ReservationID = JR.ReservationID
JOIN Schedule S ON JR.JourneyID = S.JourneyID
JOIN Train T ON S.TrainID = T.TrainID
GROUP BY T.TrackID) AS ReservationCounts);
