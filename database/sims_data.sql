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

-- Create Rules table
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

-- Create PrevRules table
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
        ('sp1', 'Cool Kitchen Stuff', 'Stuff'),
        ('sp2', 'Spooky Stuff', 'Stuff'),
        ('sp3', 'Movie Hangout Stuff', 'Stuff'),
        ('sp4', 'Romantic Garden Stuff', 'Stuff'),
        ('sp5', 'Kids Room Stuff', 'Stuff'),
        ('sp6', 'Vintage Glamour Stuff', 'Stuff'),
        ('sp7', 'Bowling Night Stuff', 'Stuff'),
        ('sp8', 'Fitness Stuff', 'Stuff'),
        ('sp9', 'Toddler Stuff', 'Stuff'),
        ('sp10', 'Laundry Day', 'Stuff'),
        ('sp11', 'My First Pet Stuff', 'Stuff'),
        ('sp12', 'Moschino Stuff', 'Stuff'),
        ('sp13', 'Tiny Living Stuff', 'Stuff'),
        ('sp14', 'Nifty Knitting Stuff', 'Stuff'),
        ('sp15', 'Paranormal Stuff', 'Stuff'),
        ('k1', 'Bust the Dust Kit', 'Kit'),
        ('k2', 'Little Campers Kit', 'Kit');

-- Insert Aspirations
INSERT INTO Aspirations (aspName, packID)
    VALUES ('Sample Aspiration', 'bg');

-- Insert Careers 
INSERT INTO Careers (careerName, packId)
    VALUES 
        -- basegame
        ('Astronaut', 'bg'),
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
        -- Expansion Packs
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
        ('Civil Designer', 'ep9'),
        ('Salaryperson', 'ep10'),
        -- game packs
        ('Military', 'gp7'),
        ('Interior Decorator', 'gp10'),
        -- stuff packs
        ('Freelancer (Fashion Photographer)', 'gp12'),
        ('Freelancer (Paranormal Investigator)', 'sp15');

-- Insert Traits 
INSERT INTO Traits (traitName, packID)
    VALUES
    -- basegame traits
    ('Active', 'bg'),
    ('Cheerful', 'bg'),
    ('Creative', 'bg'),
    ('Genius', 'bg'),
    ('Gloomy', 'bg'),
    ('Goofball', 'bg'),
    ('Hot-Headed', 'bg'),
    ('Romantic', 'bg'),
    ('Self-Assured', 'bg'),
    ('Art Lover', 'bg'),
    ('Bookworm', 'bg'),
    ('Foodie', 'bg'),
    ('Geek', 'bg'),
    ('Music Lover', 'bg'),
    ('Perfectionist', 'bg'),
    ('Ambitious', 'bg'),
    ('Childish', 'bg'),
    ('Clumsy', 'bg'),
    ('Erratic', 'bg'),
    ('Glutton', 'bg'),
    ('Kleptomaniac', 'bg'),
    ('Lazy', 'bg'),
    ('Loves Outdoors', 'bg'),
    ('Materialistic', 'bg'),
    ('Neat', 'bg'),
    ('Slob', 'bg'),
    ('Snob', 'bg'),
    ('Vegetarian', 'bg'),
    ('Bro', 'bg'),
    ('Evil', 'bg'),
    ('Family-Oriented', 'bg'),
    ('Good', 'bg'),
    ('Hates Children', 'bg'),
    ('Jealous', 'bg'),
    ('Loner', 'bg'),
    ('Loyal', 'bg'),
    ('Mean', 'bg'),
    ('Noncommittal', 'bg'),
    ('Outgoing', 'bg'),
    -- expansion pack traits
    ('Dance Machine', 'ep2'),
    ('Insider', 'ep2'),
    ('Cat Lover', 'ep4'),
    ('Dog Lover', 'ep4'),
    ('Self-Absorbed', 'ep6'),
    ('Child of the Islands', 'ep7'),
    ('Child of the Ocean', 'ep7'),
    ('Maker', 'ep9'),
    ('Freegan', 'ep9'),
    ('Green Fiend', 'ep9'),
    ('Recycle Disciple', 'ep9'),
    ('Adventurous', 'ep10'),
    ('Proper', 'ep10'),
    ('Animal Enthusiast', 'ep11'),
    ('Lactose Intolerant', 'ep11'),
    ('Overachiever', 'ep12'),
    ('Party Animal', 'ep12'),
    ('Socially Awkward', 'ep12'),
    -- game pack traits
    ('Squeamish', 'gp1'),
    ('High Maintenance', 'gp2'),
    ('Paranoid', 'gp7');

-- Insert Skills
INSERT INTO Skills (skillName, packID)
    VALUES 
    -- basegame
    ('Charisma', 'bg'),
    ('Comedy', 'bg'),
    ('Cooking', 'bg'),
    ('Fishing', 'bg'),
    ('Fitness', 'bg'),
    ('Gardening', 'bg'),
    ('Gourmet Cooking', 'bg'),
    ('Guitar', 'bg'),
    ('Handiness', 'bg'),
    ('Logic', 'bg'),
    ('Mischief', 'bg'),
    ('Mixology', 'bg'),
    ('Painting', 'bg'),
    ('Photography', 'bg'),
    ('Piano', 'bg'),
    ('Programming', 'bg'),
    ('Rocket Science', 'bg'),
    ('Video Gaming', 'bg'),
    ('Violin', 'bg'),
    ('Writing', 'bg'),
    -- expansion packs
    ('Baking', 'ep1'),
    ('Dancing', 'ep2'),
    ('DJ Mixing', 'ep2'),
    ('Singing', 'ep3'),
    ('Pet Training', 'ep4'),
    ('Veterinarian', 'ep4'),
    ('Flower Arranging', 'ep5'),
    ('Acting', 'ep6'),
    ('Media Production', 'ep6'),
    ('Research & Debate', 'ep8'),
    ('Robotics', 'ep8'),
    ('Juice Fizzing', 'ep9'),
    ('Fabrication', 'ep9'),
    ('Rock Climbing', 'ep10'),
    ('Skiing', 'ep10'),
    ('Snowboarding', 'ep10'),
    ('Cross-Stitch', 'ep11'),
    ('Entrepreneur', 'ep12'),
    -- game packs
    ('Herbalism', 'gp1'),
    ('Wellness', 'gp2'),
    ('Pipe Organ', 'gp4'),
    ('Vampire Lore', 'gp4'),
    ('Parenting', 'gp5'),
    ('Archaeology', 'gp6'),
    ('Selvadoradian Culture', 'gp6'),
    -- stuff packs
    ('Bowling', 'sp7'),
    ('Knitting', 'sp14'),
    ('Medium', 'sp15');
    

-- Insert Family
INSERT INTO Family (familyDescription, packID)
    VALUES 
        -- basegame
        ('Have just one child', 'bg'),
        ('All children must be adopted', 'bg'),
        ('Have two children with a large age gap', 'bg');
        -- expansion packs

-- Insert Misc
INSERT INTO Misc (miscDescription, packID)
    VALUES 
    -- basegame
    -- expansion packs
    ('Have a relationship with an alien sim', 'ep1'),
    ('Visit Sixam', 'ep1'),
    ('All children must be born in the hospital', 'ep1'),
    ('Must have a dog', 'ep4'),
    ('Must always have at least one pet', 'ep4');


-- Insert Rules
INSERT INTO Rules (genID)
    Values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insert PrevRules
INSERT INTO PrevRules (prevID, genID)
    Values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), 
        (7, 7), (8, 8), (9, 9), (10, 10);