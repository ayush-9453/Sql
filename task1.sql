create database petpal;
use petpal;

CREATE TABLE PETS(
	petid INT PRIMARY KEY,
    name VARCHAR(10),
	age INT,
    breed VARCHAR(30),
    Type VARCHAR(20),
    AvailableForAdoption BIT
    );

CREATE TABLE Shelters (
    shelterid INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(200)
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(100),
    DonationType VARCHAR(50),
    DonationAmount DECIMAL(10, 2), 
    DonationItem VARCHAR(100),     
    DonationDate DATETIME
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATETIME,
    Location VARCHAR(200)
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(100),
    ParticipantType VARCHAR(50),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);

-- insert data
INSERT INTO Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) VALUES
(1, 'Buddy', 3, 'Golden Retriever', 'Dog', 1),
(2, 'Whiskers', 2, 'Persian', 'Cat', 1),
(3, 'Max', 5, 'Beagle', 'Dog', 0),
(4, 'Luna', 1, 'Siamese', 'Cat', 1);

INSERT INTO Shelters (ShelterID, Name, Location) VALUES
(1, 'Happy Tails Shelter', '123 Pet Lane, New York'),
(2, 'Paw Haven', '456 Furry St, Los Angeles');

INSERT INTO Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate) VALUES
(1, 'Alice Johnson', 'Cash', 100.00, NULL, '2025-04-01 10:00:00'),
(2, 'Bob Smith', 'Item', NULL, 'Dog Food', '2025-04-02 14:30:00'),
(3, 'Carol White', 'Cash', 250.50, NULL, '2025-04-10 09:15:00');

insert INTO AdoptionEvents (EventID, EventName, EventDate, Location) VALUES
(1, 'Spring Adoption Fair', '2025-04-20 11:00:00', 'Central Park, NY'),
(2, 'Paws and Play Day', '2025-05-05 10:00:00', 'LA Pet Center');

INSERT INTO Participants (ParticipantID, ParticipantName, ParticipantType, EventID) VALUES
(1, 'Happy Tails Shelter', 'Shelter', 1),
(2, 'Paw Haven', 'Shelter', 2),
(3, 'John Doe', 'Adopter', 1),
(4, 'Emily Rose', 'Adopter', 2);

-- 5
SElect *
from pets
where availableforadoption = 1;

-- 6 
SELECT ParticipantName,ParticipantType
FROM Participants
WHERE EventID = 2;

-- 7 


-- 8 


-- 9
SELECT Name,Age,Breed,Type
FROM Pets
WHERE availableforadoption = 1;

-- 10 


-- 11
SELECT DISTINCT(Breed)
FROM Pets
WHERE (Age BETWEEN 1 AND 3) OR (Age > 5);

-- 12

-- 13

-- 14 
SELECT DISTINCT Breed
FROM Pets
WHERE Age BETWEEN 1 AND 5;

-- 15
SELECT 

