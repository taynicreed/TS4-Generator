SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- -----------------------------------------------------
-- Creating Tables
-- -----------------------------------------------------
-- Drop existing tables
DROP TABLE MiscByPacks;
DROP TABLE Misc;
DROP TABLE Skills;
DROP TABLE Aspirations;
DROP TABLE Careers;
DROP TABLE Traits;
DROP TABLE Packs;

-- Create Packs table
CREATE TABLE Packs (
    packID varchar(6) NOT NULL,
    packName varchar(50) NOT NULL,
    packType varchar(50) NULL,
    PRIMARY KEY (packID)
);

-- Create Aspirations table
CREATE TABLE Aspirations (
    aspID int(11) NOT NULL AUTO_INCREMENT,
    aspName varchar(50) NOT NULL,
    aspType varchar(50) NOT NULL,
    packID varchar (6),
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (aspID)

);

-- Create Careers table
CREATE TABLE Careers (
    careerID int(11) NOT NULL AUTO_INCREMENT,
    careerName varchar(50) NOT NULL,
    careerType varchar(50) NULL,
    packID varchar(6) NOT NULL,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (careerID)
);

-- Create Traits table
CREATE TABLE Traits (
    traitID int(11) NOT NULL AUTO_INCREMENT,
    traitName varchar(50) NOT NULL,
    traitType varchar(50) NOT NULL,
    packID varchar(6) NOT NULL,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (traitID)
);

-- Create Skills table
CREATE TABLE Skills (
    skillID int(11) NOT NULL AUTO_INCREMENT,
    skillName varchar(50) NOT NULL,
    packID varchar(6) NOT NULL,
    FOREIGN KEY (packID) REFERENCES Packs(packID),
    PRIMARY KEY (skillID)
);

-- Create Misc table
CREATE TABLE Misc (
    miscID int(11) NOT NULL AUTO_INCREMENT,
    miscDescription varchar(100) NOT NULL,
    PRIMARY KEY (miscID)
);

-- Create Misc By Packs table
CREATE TABLE MiscByPacks (
  MiscByPacksID int(11) NOT NULL AUTO_INCREMENT,
  packID varchar(6) NOT NULL,
  miscID int(11),
  PRIMARY KEY (MiscByPacksID),
  FOREIGN KEY (packID) REFERENCES Packs(packID),
  FOREIGN KEY (miscID) REFERENCES Misc(miscID)
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

-- PT Jobs
--        ('Diver', 'ep7'),
--        ('Fisherman', 'ep7'),
--        ('Lifeguard', 'ep7'),



SET FOREIGN_KEY_CHECKS = 1;
COMMIT;