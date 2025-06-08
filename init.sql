CREATE DATABASE UserProfile;
GO

USE UserProfile;
GO

-- Table Types
CREATE TABLE Types (
    Id_type INT PRIMARY KEY IDENTITY(1,1),
    Id_user INT,
    Description VARCHAR(50)
);

-- Table Preferences
CREATE TABLE Preferences (
    Id_preferences INT PRIMARY KEY IDENTITY(1,1),
    Id_user INT,
    Description VARCHAR(50)
);

-- Table Profile
CREATE TABLE Profile (
    Id_User INT PRIMARY KEY,
    User_mail NVARCHAR(100) UNIQUE,
    Name NVARCHAR(100),
    Lastname NVARCHAR(100),
    Description NVARCHAR(255),
    Id_preferences INT,
    Id_type INT,
    FOREIGN KEY (Id_preferences) REFERENCES Preferences(Id_preferences),
    FOREIGN KEY (Id_type) REFERENCES Types(Id_type)
);

-- Table Followers
CREATE TABLE Followers (
    Id_Follows INT PRIMARY KEY IDENTITY(1,1),
    Id_Follower INT,
    Id_Following INT,
    Status INT CHECK (Status IN (0, 1)), -- 0 = wait, 1 = accept
    FOREIGN KEY (Id_Follower) REFERENCES Profile(Id_User),
    FOREIGN KEY (Id_Following) REFERENCES Profile(Id_User)
);