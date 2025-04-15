CREATE DATABASE PetPals1;
USE PetPals1;

CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(200)
);

CREATE TABLE Pets (
    PetID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Breed VARCHAR(100),
    Type VARCHAR(50),
    AvailableForAdoption BIT,
    ShelterID INT,
    OwnerID INT,
    FOREIGN KEY (ShelterID) REFERENCES Shelters(ShelterID)
);



CREATE TABLE Donations (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    DonorName VARCHAR(100),
    DonationType VARCHAR(50),
    DonationAmount DECIMAL(10,2),
    DonationItem VARCHAR(100),
    DonationDate DATETIME,
    ShelterID INT,
    FOREIGN KEY (ShelterID) REFERENCES Shelters(ShelterID)
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATETIME,
    Location VARCHAR(200)
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY AUTO_INCREMENT,
    ParticipantName VARCHAR(100),
    ParticipantType VARCHAR(50),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);

INSERT INTO Shelters (Name, Location) VALUES
('Happy Tails Shelter', 'Mumbai'),
('Paw Haven', 'Delhi'),
('FurEver Homes', 'Chennai');

INSERT INTO Pets (Name, Age, Breed, Type, AvailableForAdoption, ShelterID, OwnerID) VALUES
('Max', 2, 'Labrador', 'Dog', 1, 1, NULL),
('Bella', 5, 'Pomeranian', 'Dog', 0, 1, 1),
('Milo', 3, 'Persian', 'Cat', 1, 2, NULL),
('Coco', 1, 'Siamese', 'Cat', 1, 2, NULL),
('Charlie', 6, 'Beagle', 'Dog', 0, 3, 2),
('Luna', 4, 'Golden Retriever', 'Dog', 1, 3, NULL),
('Simba', 7, 'Labrador', 'Dog', 0, 1, 3);


INSERT INTO Donations (DonorName, DonationType, DonationAmount, DonationItem, DonationDate, ShelterID) VALUES
('Amit Kumar', 'Money', 5000.00, NULL, '2024-02-15 10:30:00', 1),
('Ritika Shah', 'Item', 0.00, 'Dog Food', '2024-03-10 09:15:00', 2),
('John Doe', 'Money', 3000.00, NULL, '2024-03-20 14:00:00', 2),
('Priya Sen', 'Money', 10000.00, NULL, '2024-04-05 11:00:00', 3),
('Rahul Verma', 'Item', 0.00, 'Cat Litter', '2024-04-08 15:30:00', 3);

INSERT INTO AdoptionEvents (EventName, EventDate, Location) VALUES
('Adoptathon Spring', '2024-04-15 10:00:00', 'Mumbai'),
('Pet Connect Delhi', '2024-04-20 11:00:00', 'Delhi'),
('Chennai FurFest', '2024-04-25 09:30:00', 'Chennai');

INSERT INTO Participants (ParticipantName, ParticipantType, EventID) VALUES
('Happy Tails Shelter', 'Shelter', 1),
('Paw Haven', 'Shelter', 2),
('FurEver Homes', 'Shelter', 3),
('Max', 'Pet', 1),
('Bella', 'Pet', 1),
('Milo', 'Pet', 2),
('Luna', 'Pet', 3),
('Priya Sen', 'Volunteer', 3);


-- 5
SELECT Name, Age, Breed, Type
FROM Pets
WHERE AvailableForAdoption = 1;

-- 6 
SELECT ParticipantName, ParticipantType
FROM Participants
WHERE EventID = 2;

-- 7

-- 8 
SELECT s.Name , SUM(d.DonationAmount)
FROM Shelters s
LEFT JOIN Donations d ON s.ShelterID = d.ShelterID
GROUP BY s.ShelterID;

-- 9 
SELECT Name, Age, Breed, Type
FROM Pets
WHERE OwnerID IS NULL;

-- 10
SELECT DATE_FORMAT(DonationDate, '%M %Y'), SUM(DonationAmount) 
FROM Donations
GROUP BY YEAR(DonationDate), MONTH(DonationDate);

-- 11
SELECT DISTINCT Breed
FROM Pets
WHERE (Age BETWEEN 1 AND 3) OR Age > 5;

-- 12 
SELECT p.Name , s.Name
FROM Pets p
JOIN Shelters s ON p.ShelterID = s.ShelterID
WHERE p.AvailableForAdoption = 1;

-- 13
SELECT COUNT(*) 
FROM Participants p
JOIN Shelters s ON p.ParticipantName = s.Name
WHERE s.Location = 'Chennai';


-- 14 
SELECT DISTINCT Breed
FROM Pets
WHERE Age BETWEEN 1 AND 5;

-- 15
 Select name
 from pets 
 where availableforadoption =0 ;

-- 16
SELECT p.Name AS Pet, p1.ParticipantName AS Adopter
FROM Pets p
JOIN Participants p1 ON p.OwnerID = p1.ParticipantID
WHERE p.AvailableForAdoption = 0;

-- 17 
SELECT s.Name , COUNT(p.PetID) 
FROM Shelters s
LEFT JOIN Pets p ON s.ShelterID = p.ShelterID AND p.AvailableForAdoption = 1
GROUP BY s.ShelterID;

-- 18 
SELECT p1.Name AS Pet1, p2.Name AS Pet2,p1.Breed,s.Name AS ShelterName
FROM Pets p1
JOIN Pets p2 ON p1.Breed = p2.Breed AND p1.ShelterID = p2.ShelterID AND p1.PetID < p2.PetID
JOIN Shelters s ON p1.ShelterID = s.ShelterID;

-- 19
SELECT s.Name , e.EventName
FROM Shelters s
CROSS JOIN AdoptionEvents e;

-- 20
SELECT s.Name AS ShelterName, COUNT(p.PetID) AS AdoptedPetsCount
FROM Shelters s
JOIN Pets p ON s.ShelterID = p.ShelterID
WHERE p.AvailableForAdoption = 0
GROUP BY s.ShelterID
ORDER BY AdoptedPetsCount DESC
LIMIT 1;
