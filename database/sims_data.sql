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
    VALUES 
        ('bg', 'Base Game', 'Base'),
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
    VALUES
        -- basegame 
        ('Bodybuilder', 'bg'),
        ('Painter Extraordinaire', 'bg'),
        ('Musical Genius', 'bg'),
        ('Bestselling Author', 'bg'),
        ('Public Enemy', 'bg'),
        ('Chief of Mischief', 'bg'),
        ('Villainous Valentine', 'bg'),
        ('Successful Lineage', 'bg'),
        ('Big Happy Family', 'bg'),
        ('Master Chef', 'bg'),
        ('Master Mixologist', 'bg'),
        ('Fabulously Wealthy', 'bg'),
        ('Mansion Baron', 'bg'),
        ('Renaissance Sim', 'bg'),
        ('Nerd Brain', 'bg'),
        ('Computer Whiz', 'bg'),
        ('Serial Romantic', 'bg'),
        ('Soulmate', 'bg'),
        ('Freelance Botanist', 'bg'),
        ('The Curator', 'bg'),
        ('Angling Ace', 'bg'),
        ('Joke Star', 'bg'),
        ('Party Animal', 'bg'),
        ('Friend of the World', 'bg'),
        ('Neighborhood Confidante', 'bg'),
        -- expansion packs
        ('Leader of the Pack', 'ep2'),
        ('City Native', 'ep3'),
        ('Friend of the Animals', 'ep4'),
        ('Master Maker', 'ep9'),
        ('Master Actor/Actress', 'ep6'),
        ('World-Famous Celebrity', 'ep6'),
        ('Beach Life', 'ep7'),
        ('Academic', 'ep8'),
        ('Eco Innovator', 'ep9'),
        ('Extreme Sports Enthusiast', 'ep10'),
        ('Mt. Komorebi Sightseer', 'ep10'),
        ('Country Caretaker', 'ep11'),
        -- game packs
        ('Outdoor Enthusiast', 'gp1'),
        ('Vampire Family', 'gp4'),
        ('Master Vampire', 'gp4'),
        ('Good Vampire', 'gp4'),
        ('Super Parent', 'gp5'),
        ('Archaeology Scholar', 'gp6'),
        ('Jungle Explorer', 'gp6'),
        ('StrangerVille Mystery', 'gp7'),
        ('Spellcraft & Sorcery', 'gp8'),
        ('Purveyor of Potions', 'gp8'),
        ('Hope VS Order', 'gp9'),
        ('Paragon of Hope', 'gp9'),
        ('Enforcer of Order', 'gp10'),
        ('Galactic Privateer', 'gp10'),
        -- stuff packs
        ('Lord/Lady of the Knits', 'sp14'),
        -- kits
        ('Perfectly Pristine', 'k1'),
        ('Fabulously FIlthy', 'k1');

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
        ('Self-Employed Artist', 'bg'),
        ('Secret Agent', 'bg'),
        ('Style Influencer', 'bg'),
        ('Tech Guru', 'bg'),
        ('Writer', 'bg'),
        ('Self-Employed Author', 'bg'),
        ('Self-Employed Frog Breeder', 'bg'),
        ('Self-Employed Fisherman', 'bg'),
        ('Self-Employed Gardener', 'bg'),
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
        ('Lifeguard (part-time)', 'ep7'),
        ('Diver (part-time)', 'ep7'),
        ('Fisherman (part-time)', 'ep7'),
        ('Self-Employed Odd-Job Worker', 'ep7'),
        ('Self-Employed Sulani Seashell & Treasure Hunter', 'ep7'),
        ('Education', 'ep8'),
        ('Engineer', 'ep8'),
        ('Law', 'ep8'),
        ('Freelancer (Crafter)', 'ep9'),
        ('Civil Designer', 'ep9'),
        ('Self-Employed Dumpster Treasure Reseller', 'ep9'),
        ('Salaryperson', 'ep10'),
        -- game packs
        ('Self-Employed Selvadorada Artifact Seller', 'gp6'),
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
        ('Divorce two different sims', 'bg'),
        ('Never have a romantic relationship', 'bg'),
        ('Have a science baby with a platonic friend', 'bg'),
        ('Marry the first person you date', 'bg'),
        ('Marry someone in a different life stage than you', 'bg'),
        ('Marry someone that shares a trait with you', 'bg'),
        ('Marry someone that you meet through work or school', 'bg'),
        ('Have just one child', 'bg'),
        ('Have a child with every sim you date', 'bg'),
        ('All children must be science babies', 'bg'),
        ('All children must be adopted', 'bg'),
        ('Have two children with a large age gap', 'bg'),
        ('Have an affair at some point', 'bg'),
        -- expansion packs
        ('Have a relationship with an alien sim', 'ep1'),
        ('Marry someone you meet through a club', 'ep2'),
        ('Have your wedding at the Von Haunt Estate', 'ep2'),
        ('Marry someone you meet at a festival', 'ep3'),
        ('Marry someone you meet at a karaoke bar', 'ep3'),
        ('Get married at the Romance Festival', 'ep3'),
        ('Have a relationship with a celebrity', 'ep6'), 
        ('Have a relationship with a mermaid', 'ep7'),
        ('Have your wedding in Sulani', 'ep7'),
        ('Marry someone you meet at university', 'ep8');



-- Insert Misc  
INSERT INTO Misc (miscDescription, packID)
    VALUES 
        -- basegame
        ('"Retire" to a different world as an elder', 'bg'),
        ('Throw a birthday party every time you age up', 'bg'),
        ('Complete at least one collection of your choice', 'bg'),
        ('Collect postcards and keep them displayed in your home', 'bg'),
        ('Live in Willow Creek', 'bg'),
        ('Live in Oasis Springs', 'bg'),
        ('Live in Newcrest', 'bg'),
        -- expansion packs
        ('Visit Sixam', 'ep1'),
        ('Whenever possible, purchase items from a retail store instead of through the buy catalog', 'ep1'),
        ('Join an existing club and attend gatherings whenever you are invited', 'ep2'),
        ('Live in Windenburg', 'ep2'),
        ('Live in San Myshuno', 'ep3'),
        ('Attend each city festival at least once', 'ep3'),
        ('Move into an apartment as a young adult', 'ep3'),
        ('Live on a lot with the "Grody" trait', 'ep3'),
        ('Collect City Posters', 'ep3'),
        ('Collect Snow Globes', 'ep3'),
        ('Learn all of the City Food Stall recipes in San Myshuno (within your dietary restrictions)', 'ep3'),
        ('Must have at least one dog during your lifetime', 'ep4'),
        ('Must have at least one cat during your lifetime', 'ep4'),
        ('Must always have at least one pet in your household', 'ep4'),
        ('Live in Brindleton Bay', 'ep4'),
        ('Create a custom holiday for your family to celebrate every year', 'ep5'),
        ('Decorate for all major holidays', 'ep5'),
        ('Live in Del Sol Valley', 'ep6'),
        ('Become famous', 'ep6'),
        ('Try to get an autograph from every celebrity you see', 'ep6'),
        ('Live in Sulani', 'ep7'),
        ('Earn gold for a Kava Party', 'ep7'),
        ('Attend university for at least one term, but drop out before completing a degree', 'ep8'),

        ('Live in Britechester', 'ep8'),
        ('Live in Evergreen Harbor', 'ep9'),
        ('Live in Mt. Komorebi', 'ep10'),
        ('Live in Henford-on-Bagley', 'ep11'),
        ('Live in Copperdale', 'ep12'),
        ('Live in San Sequoia', 'ep13'),
        
        -- game packs
        ('Live in Strangerville', 'gp7'),
        ('Live in Glimmerbrook', 'gp8'),
        ('Visit Batuu', 'gp9'),
        ('Live in Mt. Komorebi', 'gp10'),
        ('Live in Henford-on-Bagley', 'gp11'),
        ('Live in Forgotten Hollow', 'gp12'),
        -- stuff packs
        ('Throw a spooky party every fall', 'sp2'),
        -- kits
        ('Keep and befriend every dust bunny that appears in your home', 'k1');

-- Insert Rules
INSERT INTO Rules (genID, familyID, aspID, careerID, traitID, skillID, miscID)
    VALUES
        (1, 2, 3, 4, 5, 6, 7), 
        (2, 3, 4, 5, 6, 7, 8), 
        (3, 4, 5, 6, 7, 8, 9), 
        (4, 5, 6, 7, 8, 9, 10), 
        (5, 6, 7, 8, 9, 10, 11), 
        (6, 7, 8, 9, 10, 11, 12), 
        (7, 8, 9, 10, 11, 12, 13), 
        (8, 9, 10, 11, 12, 13, 14), 
        (9, 10, 11, 12, 13, 14, 15), 
        (10, 11, 12, 13, 14, 15, 16);

-- Insert PrevRules
INSERT INTO PrevRules (prevID, genID, familyID, aspID, careerID, traitID, skillID, miscID)
    VALUES 
        (1, 1, 12, 13, 14, 15, 16, 17),
        (2, 2, 13, 14, 15, 16, 17, 18),
        (3, 3, 14, 15, 16, 17, 18, 19),
        (4, 4, 15, 16, 17, 18, 19, 20),
        (5, 5, 16, 17, 18, 19, 20, 21),
        (6, 6, 17, 18, 19, 20, 21, 22),
        (7, 7, 18, 19, 20, 21, 22, 23),
        (8, 8, 19, 20, 21, 22, 23, 25),
        (9, 9, 20, 21, 22, 23, 25, 26),
        (10, 10, 21, 22, 23, 25, 26, 27);

-- Update used items in Rules
UPDATE Family SET used = 1 WHERE familyID in (
    SELECT familyID FROM Rules);
UPDATE Aspirations SET used = 1 WHERE aspID in (
    SELECT aspID FROM Rules);
UPDATE Careers SET used = 1 WHERE careerID in (
    SELECT careerID FROM Rules);
UPDATE Traits SET used = 1 WHERE traitID in (
    SELECT traitID FROM Rules);
UPDATE Skills SET used = 1 WHERE skillID in (
    SELECT skillID FROM Rules);
UPDATE Misc SET used = 1 WHERE miscID in (
    SELECT miscID FROM Rules);

-- Update used items in PrevRules - can be used 
UPDATE Family SET used = 1 WHERE familyID in (
    SELECT familyID FROM PrevRules);
UPDATE Aspirations SET used = 1 WHERE aspID in (
    SELECT aspID FROM PrevRules);
UPDATE Careers SET used = 1 WHERE careerID in (
    SELECT careerID FROM PrevRules);
UPDATE Traits SET used = 1 WHERE traitID in (
    SELECT traitID FROM PrevRules);
UPDATE Skills SET used = 1 WHERE skillID in (
    SELECT skillID FROM PrevRules);
UPDATE Misc SET used = 1 WHERE miscID in (
    SELECT miscID FROM PrevRules);




