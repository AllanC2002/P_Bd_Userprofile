-- Table Types
CREATE TABLE Types (
    Id_type INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(50)
);
-- Table Preferences
CREATE TABLE Preferences (
    Id_preferences INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(50)
);
-- Table Profile
CREATE TABLE Profile (
    Id_User INT PRIMARY KEY,
    User_mail VARCHAR(100) UNIQUE,
    Name VARCHAR(100),
    Lastname VARCHAR(100),
    Description VARCHAR(255),
    Id_preferences INT,
    Id_type INT,
    Status_account INT,
    FOREIGN KEY (Id_preferences) REFERENCES Preferences(Id_preferences),
    FOREIGN KEY (Id_type) REFERENCES Types(Id_type),
    CHECK (Status_account IN (0, 1))
);

-- Table Followers
CREATE TABLE Followers (
    Id_Follows INT AUTO_INCREMENT PRIMARY KEY,
    Id_Follower INT,
    Id_Following INT,
    Status INT,
    FOREIGN KEY (Id_Follower) REFERENCES Profile(Id_User),
    FOREIGN KEY (Id_Following) REFERENCES Profile(Id_User),
    CHECK (Status IN (0, 1))
);

INSERT INTO Preferences (Description) VALUES ('Music'), ('Trips'), ('Sports'),('Cinema'),('Theater'),('Comedy');
INSERT INTO Types (Description) VALUES ('Personal'), ('Company');