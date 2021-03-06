CREATE TABLE Users (
    UID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(20) NOT NULL,
    PictureURL VARCHAR(30) DEFAULT '../assets/images/emptypic.png',
    ProfileBio TEXT,
    managerID INT,
    PRIMARY KEY (UID)
);

CREATE TABLE CPs (
    CPID INT NOT NULL AUTO_INCREMENT,
    UID INT,
    CodingLang VARCHAR(20) NOT NULL,
    PRIMARY KEY (CPID),
    FOREIGN KEY (UID) REFERENCES Users (UID) ON DELETE CASCADE
);

CREATE TABLE ProjectTeams (
    UID INT,
    PID INT,
    PRIMARY KEY (UID, PID),
    FOREIGN KEY (UID) REFERENCES Users (UID) ON DELETE CASCADE,
    FOREIGN KEY (PID) REFERENCES Projects (PID) ON DELETE CASCADE
);

CREATE TABLE Projects (
    PID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Description TEXT NOT NULL,
    PRIMARY KEY (PID)
);

CREATE TABLE Tasks (
    TID INT NOT NULL AUTO_INCREMENT,
    UID INT,
    PID INT,
    TDescription TEXT NOT NULL,
    Deadline DATE NOT NULL,
    PRIMARY KEY (TID),
    FOREIGN KEY (UID) REFERENCES Users (UID) ON DELETE SET NULL,
    FOREIGN KEY (PID) REFERENCES Projects (PID) ON DELETE CASCADE
);