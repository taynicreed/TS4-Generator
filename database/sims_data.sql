-- -----------------------------------------------------
-- Creating Tables
-- -----------------------------------------------------
-- Drop existing tables
DROP TABLE PrevRules;
DROP TABLE Rules;
DROP TABLE Misc;
DROP TABLE Family;
DROP TABLE Skills;
DROP TABLE Aspirations;
DROP TABLE Careers;
DROP TABLE Traits;
DROP TABLE Packs;
DROP TABLE Rules;
DROP TABLE PrevRules;

-- Create Packs table
CREATE TABLE Packs (
    packID varchar(6) NOT NULL,
    packName varchar(50) NOT NULL,
    packType varchar(50) NULL,
    selected TINYINT(1) DEFAULT 1,
    PRIMARY KEY (packID)
);

-- Create Aspirations table
CREATE TABLE Aspirations (
    aspID int(11) NOT NULL AUTO_INCREMENT,
    aspName varchar(50) NOT NULL,
    aspType varchar(50) NULL,
    packID varchar (6) DEFAULT 'bg',
    used TINYINT(1) DEFAULT 0, 
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (aspID)

);

-- Create Careers table
CREATE TABLE Careers (
    careerID int(11) NOT NULL AUTO_INCREMENT,
    careerName varchar(50) NOT NULL,
    careerType varchar(50) NULL,
    packID varchar(6) NOT NULL,
    used TINYINT(1) DEFAULT 0, 
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (careerID)
);

-- Create Traits table
CREATE TABLE Traits (
    traitID int(11) NOT NULL AUTO_INCREMENT,
    traitName varchar(50) NOT NULL,
    traitType varchar(50) NULL,
    packID varchar(6) NOT NULL,
    used TINYINT(1) DEFAULT 0,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (traitID)
);

-- Create Skills table
CREATE TABLE Skills (
    skillID int(11) NOT NULL AUTO_INCREMENT,
    skillName varchar(50) NOT NULL,
    packID varchar(6) NOT NULL,
    used TINYINT(1) DEFAULT 0,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (skillID)
);

-- Create Family table
CREATE TABLE Family (
    familyID int(11) NOT NULL AUTO_INCREMENT,
    familyDescription varchar(100) NOT NULL,
    packID varchar(6) DEFAULT 'bg',
    used TINYINT(1) DEFAULT 0,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (familyID)
);

-- Create Misc table
CREATE TABLE Misc (
    miscID int(11) NOT NULL AUTO_INCREMENT,
    miscDescription varchar(100) NOT NULL,
    packID varchar(6) DEFAULT 'bg',
    used TINYINT(1) DEFAULT 0,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (miscID)
);

CREATE TABLE Rules (
    genID int(2) NOT NULL,
    familyID int(11),
    aspID int(11),
    careerID int(11),
    traitID int(11),
    skillID int(11),
    miscID int(11),
    FOREIGN KEY (familyID) REFERENCES Family(familyID),
    FOREIGN KEY (aspID) REFERENCES Aspirations(aspID),
    FOREIGN KEY (careerID) REFERENCES Careers(careerID),
    FOREIGN KEY (traitID) REFERENCES Traits(traitID),
    FOREIGN KEY (skillID) REFERENCES Skills(skillID),
    FOREIGN KEY (miscID) REFERENCES Misc(miscID),
    PRIMARY KEY (genID)
);

CREATE TABLE PrevRules (
    prevID int(2) NOT NULL,
    genID int(2) NOT NULL,
    familyID int(11),
    aspID int(11),
    careerID int(11),
    traitID int(11),
    skillID int(11),
    miscID int(11),
    FOREIGN KEY (familyID) REFERENCES Family(familyID),
    FOREIGN KEY (aspID) REFERENCES Aspirations(aspID),
    FOREIGN KEY (careerID) REFERENCES Careers(careerID),
    FOREIGN KEY (traitID) REFERENCES Traits(traitID),
    FOREIGN KEY (skillID) REFERENCES Skills(skillID),
    FOREIGN KEY (miscID) REFERENCES Misc(miscID),
    FOREIGN KEY (genID) REFERENCES Rules(genID),
    PRIMARY KEY (prevID)
);

-- -----------------------------------------------------
-- Insert Data
-- -----------------------------------------------------

-- Insert Packs data
INSERT INTO Packs (packID, packName, packType)
    VALUES ('bg', 'Base Game', 'Base'),
        ('ep1', 'Get To Work', 'Expansion'),
        ('ep2', 'Get Together', 'Expansion'),
        ('ep3', 'City Living', 'Expansion'),
        ('ep4', 'Cats & Dogs', 'Expansion'),
        ('ep5', 'Seasons', 'Expansion'),
        ('ep6', 'Get Famous', 'Expansion'),
        ('ep7', 'Island Living', 'Expansion'),
        ('ep8', 'Discover University', 'Expansion'),
        ('ep9', 'Eco Lifestyle', 'Expansion'),
        ('ep10', 'Snowy Escape', 'Expansion'),
        ('ep11', 'Cottage Living', 'Expansion'),
        ('ep12', 'High School Years', 'Expansion'),
        ('ep13', 'Growing Together', 'Expansion'),
        ('gp1', 'Outdoor Retreat', 'Game'),
        ('gp2', 'Spa Day Pack', 'Game'),
        ('gp3', 'Dine Out Pack', 'Game'),
        ('gp4', 'Vampires Pack', 'Game'),
        ('gp5', 'Parenthood', 'Game'),
        ('gp6', 'Jungle Adventures', 'Game'),
        ('gp7', 'StrangerVille', 'Game'),
        ('gp8', 'Realm of Magic', 'Game'),
        ('gp9', 'Journey to Batuu', 'Game'),
        ('gp10', 'Dream Home Decorator', 'Game'),
        ('gp11', 'My Wedding Stories', 'Game'),
        ('gp12', 'Werewolves', 'Game'),
        ('sp1', 'Cool Kitchen Stuff', 'Game'),
        ('sp2', 'Spooky Stuff', 'Game'),
        ('sp3', 'Movie Hangout Stuff', 'Game'),
        ('sp4', 'Romantic Garden Stuff', 'Game'),
        ('sp5', 'Kids Room Stuff', 'Game'),
        ('sp6', 'Vintage Glamour Stuff', 'Game'),
        ('sp7', 'Bowling Night Stuff', 'Game'),
        ('sp8', 'Fitness Stuff', 'Game'),
        ('sp9', 'Toddler Stuff', 'Game'),
        ('sp10', 'Laundry Day', 'Game'),
        ('sp11', 'My First Pet Stuff', 'Game'),
        ('sp12', 'Moschino Stuff', 'Game'),
        ('sp13', 'Tiny Living Stuff', 'Game'),
        ('sp14', 'Nifty Knitting Stuff', 'Game'),
        ('sp15', 'Paranormal Stuff', 'Game'),
        ('k1', 'Bust the Dust Kit', 'Kit'),
        ('k2', 'Little Campers Kit', 'Kit');

-- Insert Aspirations
INSERT INTO Aspirations (aspName, packID)
    VALUES ('Sample Aspiration', 'bg');

-- Insert Careers 
INSERT INTO Careers (careerName, packId)
    VALUES ('Astronaut', 'bg'),
        ('Athlete', 'bg'),
        ('Business', 'bg'),
        ('Criminal', 'bg'),
        ('Culinary', 'bg'),
        ('Entertainer', 'bg'),
        ('Freelancer (Digital Artist)', 'bg'),
        ('Freelancer (Programmer)', 'bg'),
        ('Freelancer (Writer)', 'bg'),
        ('Painter', 'bg'),
        ('Secret Agent', 'bg'),
        ('Style Influencer', 'bg'),
        ('Tech Guru', 'bg'),
        ('Writer', 'bg'),
        ('Detective', 'ep1'),
        ('Doctor', 'ep1'),
        ('Scientist', 'ep1'),
        ('Retail Business Owner', 'ep1'),
        ('Critic', 'ep3'),
        ('Politician', 'ep3'),
        ('Social Media', 'ep3'),
        ('Veterinarian', 'ep4'),
        ('Gardener', 'ep5'),
        ('Actor', 'ep6'),
        ('Conservationist', 'ep7'),
        ('Education', 'ep8'),
        ('Engineer', 'ep8'),
        ('Law', 'ep8'),
        ('Freelancer (Crafter)', 'ep9'),
        ('Civil Designer', 'ep10'),
        ('Military', 'gp7');


-- Insert Traits 
INSERT INTO Traits (traitName, packID)
    VALUES ('sample trait', 'bg');

-- Insert Skills
INSERT INTO Skills (skillName, packID)
    VALUES ('sample skill', 'bg');

-- Insert Family
INSERT INTO Family (familyDescription, packID)
    VALUES ('Have just one child', 'bg'),
        ('All children must be adopted', 'bg'),
        ('Have two children with a large age gap', 'bg');

-- Insert Misc
INSERT INTO Misc (miscDescription, packID)
    VALUES ('Must always have at least one dog', 'ep4');

-- Insert Rules
INSERT INTO Rules (genID)
    Values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insert PrevRules
INSERT INTO PrevRules (prevID, genID)
    Values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), 
        (7, 7), (8, 8), (9, 9), (10, 10);