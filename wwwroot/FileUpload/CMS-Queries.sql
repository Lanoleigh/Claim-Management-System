CREATE TABLE Lecturer(
	Lecturer_ID varchar(5) Primary key,
	lecturer_name varchar(15),
	lecturer_surname varchar(20),
	emailAddress varchar(25),
	phone_number varchar(10),
	password varchar(15)
);

ALTER TABLE Lecturer
ADD Hourly_Rate Decimal;

CREATE TABLE Staff(
	Staff_ID varchar(5) primary key,
	Name varchar(15),
	Surname varchar(20),
	phone_number varchar(10),
	title varchar(25),
	password varchar(15)
);


CREATE TABLE Claim(
    claim_ID varchar(8) PRIMARY KEY,                   -- Primary key for Claim
    lecturerId nvarchar(900),                          -- Foreign key for Lecturer
    staffId nvarchar(900),                             -- Foreign key for Staff
    claim_amount decimal,                                -- Claim amount
    hours_Worked decimal,                                -- Hours worked
    dateOfClaim Date,                                    -- Date of claim
    description varchar(50),                             -- Description
    supporting_doc BIT,                                  -- Supporting document flag
    status varchar(10),                                  -- Status of the claim

    -- Foreign key relationships
    FOREIGN KEY (lecturerId) REFERENCES Lecturers(Id),
    FOREIGN KEY (staffId) REFERENCES Staff(Id)
);
SELECT * FROM Claims;
CREATE TABLE Claims (
    claim_ID varchar(8) PRIMARY KEY,                   -- Primary key for Claim
    fk_lecturer_id nvarchar(450) NOT NULL,                          -- Foreign key for Lecturer
    fk_staff_id nvarchar(450) NOT NULL,                             -- Foreign key for Staff
    claim_amount decimal,                                -- Claim amount
    hours_Worked decimal,                                -- Hours worked
    dateOfClaim Date,                                    -- Date of claim
    description varchar(50),                             -- Description                              -- Supporting document flag
    status varchar(10),                                  -- Status of the claim

    -- Foreign key relationships
    FOREIGN KEY (fk_lecturer_id) REFERENCES Lecturers(Id),
    FOREIGN KEY (fk_staff_id) REFERENCES Staff(Id)
);





EXEC sp_help 'Lecturers';
EXEC sp_help 'Staff';


SELECT * FROM Claim;

SELECT * FROM Staff;

ALTER TABLE Staff
ADD  EmailAddress varchar(20);

INSERT INTO Lecturer (Lecturer_ID, lecturer_name, lecturer_surname, emailAddress, phone_number, password)
VALUES 
('L001', 'John', 'Doe', 'john.doe@example.com', '1234567890', 'P@ssw0rd1'),
('L002', 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'Secur3Pwd2'),
('L003', 'Emily', 'Johnson', 'emily.johnson@example.com', '1122334455', 'Pass1234!'),
('L004', 'Michael', 'Brown', 'michael.brown@example.com', '6677889900', 'Qwerty123'),
('L005', 'Sarah', 'Davis', 'sarah.davis@example.com', '4433221100', 'LetMeIn56'),
('L006', 'David', 'Miller', 'david.miller@example.com', '2233445566', 'Passw0rd!'),
('L007', 'Laura', 'Wilson', 'laura.wilson@example.com', '3344556677', 'Welc0me98'),
('L008', 'James', 'Taylor', 'james.taylor@example.com', '7788990011', 'Str0ngPass');

UPDATE Lecturer
SET Hourly_Rate = CASE Lecturer_ID
    WHEN 'L001' THEN 1350.50
    WHEN 'L002' THEN 1450.75
    WHEN 'L003' THEN 1200.00
    WHEN 'L004' THEN 900.25
    WHEN 'L005' THEN 1500.00
    WHEN 'L006' THEN 1300.50
    WHEN 'L007' THEN 1100.75
    WHEN 'L008' THEN 1425.00
END;



INSERT INTO Staff (Staff_ID, Name, Surname, phone_number, title, password)
VALUES 
('PC123', 'Alice', 'Johnson', '1234567890', 'Programme Coordinator', 'P@ssw0rd1'),
('PC456', 'Bob', 'Smith', '0987654321', 'Programme Coordinator', 'Secur3Pwd2'),
('AM789', 'Carol', 'Taylor', '1122334455', 'Academic Manager', 'Pass1234!'),
('AM012', 'David', 'Brown', '6677889900', 'Academic Manager', 'Qwerty123');


UPDATE Staff
SET EmailAddress = CASE Staff_ID
    WHEN 'PC123' THEN 'alice.j@univ.edu'
    WHEN 'PC456' THEN 'bob.smith@uni.edu'
    WHEN 'AM789' THEN 'carol.t@univ.edu'
    WHEN 'AM012' THEN 'david.b@univ.edu'
END;

SELECT * FROM Staff;

INSERT INTO Claim (claim_ID, lecturer_id, staff_id, claim_amount, hours_Worked, dateOfClaim, description, supporting_doc, status)
VALUES
-- Records for Lecturer L001
('C000001', 'L001', 'PC123', 1500.00, 120, '2024-02-15', 'Good working environment.', 1, 'Approved'),
('C000002', 'L001', 'PC456', 1300.00, 100, '2024-01-20', 'Indifferent experience overall.', 0, 'Rejected'),
('C000003', 'L001', 'AM789', 1600.00, 140, '2024-03-10', 'Productive and collaborative.', 1, 'Pending'),
-- Records for Lecturer L002
('C000004', 'L002', 'AM012', 1450.00, 110, '2024-04-25', 'Challenging but rewarding.', 0, 'Processing'),
('C000005', 'L002', 'PC123', 1200.00, 90, '2024-06-05', 'Supportive team but some challenges.', 1, 'Approved'),
('C000006', 'L002', 'AM789', 1350.00, 105, '2024-02-28', 'Indifferent experience overall.', 0, 'Rejected'),
('C000007', 'L002', 'PC456', 1400.00, 130, '2024-07-15', 'Collaborative environment.', 1, 'Pending'),
-- Records for Lecturer L003
('C000008', 'L003', 'AM012', 1550.00, 160, '2024-03-22', 'Good working environment.', 0, 'Approved'),
('C000009', 'L003', 'PC123', 1250.00, 100, '2024-05-12', 'Challenging but rewarding.', 1, 'Rejected'),
('C000010', 'L003', 'AM789', 1100.00, 80, '2024-01-10', 'Supportive team.', 0, 'Processing'),
-- Records for Lecturer L004
('C000011', 'L004', 'AM012', 1300.00, 90, '2024-06-20', 'Good working environment.', 1, 'Pending'),
('C000012', 'L004', 'PC456', 1400.00, 150, '2024-04-05', 'Productive and collaborative.', 0, 'Processing'),
('C000013', 'L004', 'AM789', 1600.00, 140, '2024-03-18', 'Indifferent experience overall.', 0, 'Rejected'),
-- Records for Lecturer L005
('C000014', 'L005', 'PC123', 1500.00, 120, '2024-07-01', 'Collaborative environment.', 1, 'Approved'),
('C000015', 'L005', 'PC456', 1100.00, 100, '2024-02-07', 'Challenging but rewarding.', 0, 'Rejected');

UPDATE Claim
SET claim_amount = C.hours_Worked * L.Hourly_rate
FROM Claim C
JOIN Lecturer L ON C.lecturer_id = L.Lecturer_ID;

SELECT * FROM Claims;
SELECT * FROM Lecturers;
SELECT * FROM staff;


SELECT C.Claim_ID ,L.lecturer_id, S.staff_id , C.claim_amount,L.Hourly_Rate ,C.hours_Worked , S.Name
FROM Claim C 
JOIN Lecturer L ON C.lecturer_id = L.Lecturer_ID 
JOIN Staff S ON C.staff_id = S.Staff_ID;






-- Insert values into the Lecturer table
INSERT INTO Lecturers (Id, Lecturer_ID, lecturer_name, lecturer_surname, phone_number, Hourly_Rate, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
VALUES 
(1, 'L001', 'John', 'Doe', '1234567890', 1350.50, 'john.doe', 'JOHN.DOE', 'john.doe@example.com', 'JOHN.DOE@EXAMPLE.COM', 1, 'PasswordHash1', 'SecurityStamp1', 'ConcurrencyStamp1', 1, 0, NULL, 1, 0),
(2, 'L002', 'Jane', 'Smith', '0987654321', 1450.75, 'jane.smith', 'JANE.SMITH', 'jane.smith@example.com', 'JANE.SMITH@EXAMPLE.COM', 1, 'PasswordHash2', 'SecurityStamp2', 'ConcurrencyStamp2', 1, 0, NULL, 1, 0),
(3, 'L003', 'Emily', 'Johnson', '1122334455', 1200.00, 'emily.johnson', 'EMILY.JOHNSON', 'emily.johnson@example.com', 'EMILY.JOHNSON@EXAMPLE.COM', 1, 'PasswordHash3', 'SecurityStamp3', 'ConcurrencyStamp3', 1, 0, NULL, 1, 0),
(4, 'L004', 'Michael', 'Brown', '6677889900', 900.25, 'michael.brown', 'MICHAEL.BROWN', 'michael.brown@example.com', 'MICHAEL.BROWN@EXAMPLE.COM', 1, 'PasswordHash4', 'SecurityStamp4', 'ConcurrencyStamp4', 1, 0, NULL, 1, 0),
(5, 'L005', 'Sarah', 'Davis', '4433221100', 1500.00, 'sarah.davis', 'SARAH.DAVIS', 'sarah.davis@example.com', 'SARAH.DAVIS@EXAMPLE.COM', 1, 'PasswordHash5', 'SecurityStamp5', 'ConcurrencyStamp5', 1, 0, NULL, 1, 0),
(6, 'L006', 'David', 'Miller', '2233445566', 1300.50, 'david.miller', 'DAVID.MILLER', 'david.miller@example.com', 'DAVID.MILLER@EXAMPLE.COM', 1, 'PasswordHash6', 'SecurityStamp6', 'ConcurrencyStamp6', 1, 0, NULL, 1, 0),
(7, 'L007', 'Laura', 'Wilson', '3344556677', 1100.75, 'laura.wilson', 'LAURA.WILSON', 'laura.wilson@example.com', 'LAURA.WILSON@EXAMPLE.COM', 1, 'PasswordHash7', 'SecurityStamp7', 'ConcurrencyStamp7', 1, 0, NULL, 1, 0),
(8, 'L008', 'James', 'Taylor', '7788990011', 1425.00, 'james.taylor', 'JAMES.TAYLOR', 'james.taylor@example.com', 'JAMES.TAYLOR@EXAMPLE.COM', 1, 'PasswordHash8', 'SecurityStamp8', 'ConcurrencyStamp8', 1, 0, NULL, 1, 0);


INSERT INTO Staff (Id, Staff_ID, Name, Surname, title, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, phone_number, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
VALUES 
(1, 'PC123', 'Alice', 'Johnson', 'Programme Coordinator', 'alice.j', 'ALICE.J', 'alice.j@univ.edu', 'ALICE.J@UNIV.EDU', 1, 'PasswordHash9', 'SecurityStamp9', 'ConcurrencyStamp9', '1234567890', 1, 0, NULL, 1, 0),
(2, 'PC456', 'Bob', 'Smith', 'Programme Coordinator', 'bob.smith', 'BOB.SMITH', 'bob.smith@uni.edu', 'BOB.SMITH@UNI.EDU', 1, 'PasswordHash10', 'SecurityStamp10', 'ConcurrencyStamp10', '0987654321', 1, 0, NULL, 1, 0),
(3, 'AM789', 'Carol', 'Taylor', 'Academic Manager', 'carol.t', 'CAROL.T', 'carol.t@univ.edu', 'CAROL.T@UNIV.EDU', 1, 'PasswordHash11', 'SecurityStamp11', 'ConcurrencyStamp11', '1122334455', 1, 0, NULL, 1, 0),
(4, 'AM012', 'David', 'Brown', 'Academic Manager', 'david.brown', 'DAVID.BROWN', 'david.b@univ.edu', 'DAVID.B@UNIV.EDU', 1, 'PasswordHash12', 'SecurityStamp12', 'ConcurrencyStamp12', '6677889900', 1, 0, NULL, 1, 0);



INSERT INTO Claims(claim_ID, fk_lecturer_id, fk_staff_id, claim_amount, hours_Worked, dateOfClaim, description, status)
VALUES
-- Records for Lecturer L001
('C000001', 1, 1, 1500.00, 120, '2024-02-15', 'Good working environment.',  'Approved'),
('C000002', 1, 2, 1300.00, 100, '2024-01-20', 'Indifferent experience overall.', 'Rejected'),
('C000003', 1, 3, 1600.00, 140, '2024-03-10', 'Productive and collaborative.', 'Pending'),
-- Records for Lecturer L002
('C000004', 2, 3, 1450.00, 110, '2024-04-25', 'Challenging but rewarding.',  'Processing'),
('C000005', 2, 1, 1200.00, 90, '2024-06-05', 'Supportive team but some challenges.',  'Approved'),
('C000006', 2, 3, 1350.00, 105, '2024-02-28', 'Indifferent experience overall.',  'Rejected'),
('C000007', 2, 2, 1400.00, 130, '2024-07-15', 'Collaborative environment.',  'Pending'),
-- Records for Lecturer L003
('C000008', 3, 4, 1550.00, 160, '2024-03-22', 'Good working environment.',  'Approved'),
('C000009', 3, 1, 1250.00, 100, '2024-05-12', 'Challenging but rewarding.',  'Rejected'),
('C000010', 3, 3, 1100.00, 80, '2024-01-10', 'Supportive team.',  'Processing'),
-- Records for Lecturer L004
('C000011', 4, 2, 1300.00, 90, '2024-06-20', 'Good working environment.',  'Pending'),
('C000012', 4, 1, 1400.00, 150, '2024-04-05', 'Productive and collaborative.',  'Processing'),
('C000013', 4, 3, 1600.00, 140, '2024-03-18', 'Indifferent experience overall.', 'Rejected'),
-- Records for Lecturer L005
('C000014', 5, 1, 1500.00, 120, '2024-07-01', 'Collaborative environment.',  'Approved'),
('C000015', 5, 2, 1100.00, 100, '2024-02-07', 'Challenging but rewarding.', 'Rejected');

INSERT INTO AspNetUsers (Id, UserName, NormalizedUserName, EmailAddress, NormalizedEmail, Password, PhoneNumber, EmailConfirmed, AccessFailedCount, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, SecurityStamp, ConcurrencyStamp)
VALUES 
-- Staff Users
(NEWID(), 'Alice', 'ALICE', 'alice.johnson@example.com', 'ALICE.JOHNSON@EXAMPLE.COM', 'P@ssw0rd1', '1234567890', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Bob', 'BOB', 'bob.smith@example.com', 'BOB.SMITH@EXAMPLE.COM', 'Secur3Pwd2', '0987654321', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Carol', 'CAROL', 'carol.taylor@example.com', 'CAROL.TAYLOR@EXAMPLE.COM', 'Pass1234!', '1122334455', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'David', 'DAVID', 'david.brown@example.com', 'DAVID.BROWN@EXAMPLE.COM', 'Qwerty123', '6677889900', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),

-- Lecturer Users
(NEWID(), 'John Doe', 'JOHN DOE', 'john.doe@example.com', 'JOHN.DOE@EXAMPLE.COM', 'P@ssw0rd1', '1234567890', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Jane Smith', 'JANE SMITH', 'jane.smith@example.com', 'JANE.SMITH@EXAMPLE.COM', 'Secur3Pwd2', '0987654321', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Emily Johnson', 'EMILY JOHNSON', 'emily.johnson@example.com', 'EMILY.JOHNSON@EXAMPLE.COM', 'Pass1234!', '1122334455', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Michael Brown', 'MICHAEL BROWN', 'michael.brown@example.com', 'MICHAEL.BROWN@EXAMPLE.COM', 'Qwerty123', '6677889900', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Sarah Davis', 'SARAH DAVIS', 'sarah.davis@example.com', 'SARAH.DAVIS@EXAMPLE.COM', 'LetMeIn56', '4433221100', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'David Miller', 'DAVID MILLER', 'david.miller@example.com', 'DAVID.MILLER@EXAMPLE.COM', 'Passw0rd!', '2233445566', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'Laura Wilson', 'LAURA WILSON', 'laura.wilson@example.com', 'LAURA.WILSON@EXAMPLE.COM', 'Welc0me98', '3344556677', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID()),
(NEWID(), 'James Taylor', 'JAMES TAYLOR', 'james.taylor@example.com', 'JAMES.TAYLOR@EXAMPLE.COM', 'Str0ngPass', '7788990011', 1, 0, 0, 0, NULL, 0, NEWID(), NEWID());
