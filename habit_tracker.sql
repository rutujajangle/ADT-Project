-- Habit tracker project part 2
-- Team Members: Ritika Shrivastav, Rutuja Jangle, Naveen Addanki

-- Users table was created by Ritika including all the constraints which were discussed among all members of the team
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Assuming encryption is handled outside of the database
    dob DATE NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    occupation VARCHAR(100), -- Can be NULL
    purpose ENUM('weekly progress tracking', 'productivity', 'accountability', 'habit building') NOT NULL,
    age_group ENUM('under 18', '18-25', '26-40', 'above 40') NOT NULL
);

-- Habits table was created by Naveen which included column category discussions from all members
CREATE TABLE habits (
    habit_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    email_id VARCHAR(100),
    date DATE NOT NULL,
    reading ENUM('True', 'False') DEFAULT NULL,
    walking ENUM('True', 'False') DEFAULT NULL,
    sleeping ENUM('True', 'False') DEFAULT NULL,
    gym ENUM('True', 'False') DEFAULT NULL,
    eating_healthy ENUM('True', 'False') DEFAULT NULL,
    others ENUM('True', 'False') DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (email_id) REFERENCES users(email)
);

-- Each one of us inserted 5 entries in the users table making it a total of 15 entries initially,
-- starting with Ritika for the first 5, 
-- followed by Rutuja for the next 5,
-- and Naveen inserted the last 5 entries
INSERT INTO users (firstname, lastname, email, password, dob, gender, occupation, purpose, age_group)
VALUES
    ('John', 'Doe', CONCAT('john', 'doe', '@yahoo.com'), 'password1', '1990-05-15', 'male', 'Engineer', 'weekly progress tracking', '26-40'),
    ('Jane', 'Smith', CONCAT('jane', 'smith', '@gmail.com'), 'password2', '1985-08-22', 'female', 'Teacher', 'productivity', '26-40'),
    ('Michael', 'Johnson', CONCAT('michael', 'johnson', '@outlook.com'), 'password3', '1995-02-10', 'male', 'Doctor', 'accountability', '26-40'),
    ('Emily', 'Williams', CONCAT('emily', 'williams', '@edu.com'), 'password4', '2000-11-30', 'female', 'Student', 'habit building', '18-25'),
    ('David', 'Brown', CONCAT('david', 'brown', '@hotmail.com'), 'password5', '1978-07-03', 'male', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Sarah', 'Miller', CONCAT('sarah', 'miller', '@yahoo.com'), 'password6', '1992-04-18', 'female', 'Software Developer', 'productivity', '26-40'),
    ('Ryan', 'Davis', CONCAT('ryan', 'davis', '@gmail.com'), 'password7', '1987-09-25', 'male', 'Artist', 'accountability', '26-40'),
    ('Olivia', 'Wilson', CONCAT('olivia', 'wilson', '@outlook.com'), 'password8', '1983-12-08', 'female', 'Writer', 'habit building', '26-40'),
    ('William', 'Moore', CONCAT('william', 'moore', '@edu.com'), 'password9', '2002-01-20', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Emma', 'Taylor', CONCAT('emma', 'taylor', '@hotmail.com'), 'password10', '1975-06-12', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('James', 'Anderson', CONCAT('james', 'anderson', '@yahoo.com'), 'password11', '1998-03-05', 'male', 'Consultant', 'accountability', '18-25'),
    ('Ava', 'Thomas', CONCAT('ava', 'thomas', '@gmail.com'), 'password12', '1993-10-14', 'female', 'Lawyer', 'habit building', '26-40'),
    ('Benjamin', 'Jackson', CONCAT('benjamin', 'jackson', '@outlook.com'), 'password13', '1980-09-02', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Sophia', 'Harris', CONCAT('sophia', 'harris', '@yahoo.com'), 'password14', '1989-07-29', 'female', 'Doctor', 'productivity', '26-40'),
    ('Ethan', 'White', CONCAT('ethan', 'white', '@edu.com'), 'password15', '2005-08-09', 'male', NULL, 'accountability', 'under 18');

-- Similarly for the habits table, Assuming some random habit data for each user, each one of us inserted 5 ntries in the same order as above,
-- Ritika (first 5) -> Rutuja (next 5) -> Naveen (last 5)
INSERT INTO habits (user_id, email_id, date, reading, walking, sleeping, gym, eating_healthy, others)
VALUES
    (1, 'johndoe@yahoo.com', '2024-04-07', 'True', 'True', 'True', 'False', 'True', 'False'),
    (2, 'janesmith@gmail.com', '2024-04-07', 'True', 'False', 'True', 'True', 'False', 'False'),
    (3, 'michaeljohnson@outlook.com', '2024-04-07', 'True', 'True', 'False', 'True', 'True', 'False'),
    (4, 'emilywilliams@edu.com', '2024-04-07', 'False', 'True', 'True', 'False', 'False', 'True'),
    (5, 'davidbrown@hotmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'True'),
    (6, 'sarahmiller@yahoo.com', '2024-04-07', 'False', 'True', 'True', 'False', 'True', 'True'),
    (7, 'ryandavis@gmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'False', 'False'),
    (8, 'oliviawilson@outlook.com', '2024-04-07', 'False', 'False', 'True', 'False', 'True', 'True'),
    (9, 'williammoore@edu.com', '2024-04-07', 'True', 'False', 'False', 'True', 'False', 'True'),
    (10, 'emmataylor@hotmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'False'),
    (11, 'jamesanderson@yahoo.com', '2024-04-07', 'False', 'True', 'False', 'False', 'True', 'True'),
    (12, 'avathomas@gmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'True'),
    (13, 'benjaminjackson@outlook.com', '2024-04-07', 'False', 'False', 'True', 'False', 'True', 'False'),
    (14, 'sophiaharris@yahoo.com', '2024-04-07', 'True', 'True', 'True', 'False', 'False', 'True'),
    (15, 'ethanwhite@edu.com', '2024-04-07', 'False', 'False', 'False', 'True', 'True', 'False');

-- For checking whether the entries are inserted properly we used the select statement, coded by Ritika
select * from habits;

-- Mood_diary table was created by Rutuja which included the contraints discussions from all members
CREATE TABLE mood_diary (
    user_id INT NOT NULL,
    habits_id INT NOT NULL,
    mood_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    reading_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    walking_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    sleeping_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    gym_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    eating_healthy_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    others_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    comments VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (habits_id) REFERENCES habits(habit_id)
);

-- Similarly for the mood_diary table, Assuming some random data for each user, each one of us inserted 5 ntries in the same order as the first two tables,
-- Ritika (first 5) -> Rutuja (next 5) -> Naveen (last 5)
INSERT INTO mood_diary (user_id, habits_id, date, reading_rating, walking_rating, sleeping_rating, gym_rating, eating_healthy_rating, others_rating, comments)
VALUES
    (1, 47, '2024-04-07', '5', '4', '5', '3', '5', '4', 'Feeling great today!'),
    (2, 33, '2024-04-07', '4', '5', '4', '4', '3', '5', 'Had a productive day.'),
    (3, 34, '2024-04-07', '5', '4', '3', '5', '5', '4', 'Feeling energetic.'),
    (4, 35, '2024-04-07', '3', '5', '5', '2', '4', '5', 'Could use some improvement in reading habit.'),
    (5, 36, '2024-04-07', '4', '4', '4', '4', '4', '4', 'Maintaining a good routine.'),
    (6, 37, '2024-04-07', '5', '3', '5', '3', '4', '4', 'Feeling focused.'),
    (7, 38, '2024-04-07', '4', '4', '4', '4', '3', '3', 'Average day overall.'),
    (8, 39, '2024-04-07', '3', '3', '4', '2', '4', '3', 'Could improve sleeping habits.'),
    (9, 40, '2024-04-07', '4', '2', '2', '4', '3', '4', 'Good progress in gym.'),
    (10, 41, '2024-04-07', '5', '5', '5', '5', '5', '5', 'Excellent day overall.'),
    (11, 42, '2024-04-07', '3', '4', '2', '3', '4', '3', 'Need to work on sleeping habits.'),
    (12, 43, '2024-04-07', '5', '5', '5', '5', '5', '5', 'Feeling accomplished.'),
    (13, 44, '2024-04-07', '4', '3', '4', '2', '3', '3', 'Could improve eating habits.'),
    (14, 45, '2024-04-07', '5', '4', '5', '4', '5', '4', 'Great day overall.'),
    (15, 46, '2024-04-07', '3', '2', '2', '4', '3', '3', 'Need to be more consistent.');

-- Similarly like the habits table, for checking whether the data is inserted properly or not in the mood_diary table we used the select statement, coded by Rutuja
select * from mood_diary;

INSERT INTO users (firstname, lastname, email, password, dob, gender, occupation, purpose, age_group)
VALUES
    ('Alice', 'Johnson', 'alicejohnson@example.com', 'password16', '1991-09-14', 'female', 'Engineer', 'habit building', '26-40'),
    ('Robert', 'Davis', 'robertdavis@example.com', 'password17', '1986-03-18', 'male', 'Teacher', 'productivity', '26-40'),
    ('Linda', 'Martinez', 'lindamartinez@example.com', 'password18', '1996-07-25', 'female', 'Doctor', 'accountability', '26-40'),
    ('David', 'Garcia', 'davidgarcia@example.com', 'password19', '2001-11-02', 'male', 'Student', 'habit building', '18-25'),
    ('Jennifer', 'Clark', 'jenniferclark@example.com', 'password20', '1979-05-10', 'female', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Daniel', 'Lee', 'daniellee@example.com', 'password21', '1994-08-21', 'male', 'Software Developer', 'productivity', '26-40'),
    ('Mary', 'Taylor', 'marytaylor@example.com', 'password22', '1988-12-05', 'female', 'Artist', 'accountability', '26-40'),
    ('Christopher', 'Wilson', 'christopherwilson@example.com', 'password23', '1984-01-30', 'male', 'Writer', 'habit building', '26-40'),
    ('Patricia', 'Jones', 'patriciajones@example.com', 'password24', '2003-02-18', 'female', NULL, 'weekly progress tracking', 'under 18'),
    ('Matthew', 'Martinez', 'matthewmartinez@example.com', 'password25', '1976-06-08', 'male', 'Entrepreneur', 'productivity', 'above 40'),
    ('Jessica', 'Gonzalez', 'jessicagonzalez@example.com', 'password26', '1999-04-03', 'female', 'Consultant', 'accountability', '18-25'),
    ('Richard', 'Anderson', 'richardanderson@example.com', 'password27', '1990-10-22', 'male', 'Lawyer', 'habit building', '26-40'),
    ('Sarah', 'Moore', 'sarahmoore@example.com', 'password28', '1982-11-14', 'female', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Thomas', 'Wilson', 'thomaswilson@example.com', 'password29', '1987-08-07', 'male', 'Doctor', 'productivity', '26-40'),
    ('Karen', 'Hernandez', 'karenhernandez@example.com', 'password30', '2006-03-29', 'female', NULL, 'accountability', 'under 18'),
	('Michael', 'Smith', 'michaelsmith@example.com', 'password31', '1989-09-17', 'male', 'Engineer', 'habit building', '26-40'),
    ('Jennifer', 'Brown', 'jenniferbrown@example.com', 'password32', '1983-04-22', 'female', 'Teacher', 'productivity', '26-40'),
    ('William', 'Martinez', 'williammartinez@example.com', 'password33', '1997-11-11', 'male', 'Doctor', 'accountability', '26-40'),
    ('Emma', 'Garcia', 'emmagarcia@example.com', 'password34', '2002-07-06', 'female', 'Student', 'habit building', '18-25'),
    ('Christopher', 'Davis', 'christopherdavis@example.com', 'password35', '1977-01-02', 'male', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Emily', 'Rodriguez', 'emilyrodriguez@example.com', 'password36', '1991-08-14', 'female', 'Software Developer', 'productivity', '26-40'),
    ('Daniel', 'Miller', 'danielmiller@example.com', 'password37', '1986-12-30', 'male', 'Artist', 'accountability', '26-40'),
    ('Olivia', 'Taylor', 'oliviataylor@example.com', 'password38', '1982-03-25', 'female', 'Writer', 'habit building', '26-40'),
    ('Ethan', 'Hernandez', 'ethanhernandez@example.com', 'password39', '2004-05-08', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Sophia', 'Lopez', 'sophialopez@example.com', 'password40', '1974-10-19', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('James', 'Gonzalez', 'jamesgonzalez@example.com', 'password41', '1995-03-12', 'male', 'Consultant', 'accountability', '18-25'),
    ('Ava', 'Perez', 'avaperez@example.com', 'password42', '1980-07-27', 'female', 'Lawyer', 'habit building', '26-40'),
    ('Noah', 'Jackson', 'noahjackson@example.com', 'password43', '1985-06-15', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Isabella', 'Harris', 'isabellaharris@example.com', 'password44', '1988-02-28', 'female', 'Doctor', 'productivity', '26-40'),
    ('Mason', 'Clark', 'masonclark@example.com', 'password45', '2000-09-04', 'male', NULL, 'accountability', 'under 18'),
    ('Evelyn', 'Lewis', 'evelynlewis@example.com', 'password46', '1979-11-23', 'female', 'Engineer', 'habit building', '26-40'),
    ('Alexander', 'Walker', 'alexanderwalker@example.com', 'password47', '1984-04-05', 'male', 'Teacher', 'productivity', '26-40'),
    ('Abigail', 'Hall', 'abigailhall@example.com', 'password48', '1996-12-12', 'female', 'Doctor', 'accountability', '26-40'),
    ('Charlotte', 'Young', 'charlotteyoung@example.com', 'password49', '2001-05-23', 'female', 'Student', 'habit building', '18-25'),
    ('Elijah', 'Scott', 'elijahscott@example.com', 'password50', '1973-08-18', 'male', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Elizabeth', 'King', 'elizabethking@example.com', 'password51', '1989-02-09', 'female', 'Software Developer', 'productivity', '26-40'),
    ('Daniel', 'Baker', 'danielbaker@example.com', 'password52', '1993-06-27', 'male', 'Artist', 'accountability', '26-40'),
    ('Grace', 'Adams', 'graceadams@example.com', 'password53', '1975-09-30', 'female', 'Writer', 'habit building', '26-40'),
    ('Logan', 'Nelson', 'logannelson@example.com', 'password54', '2003-11-08', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Avery', 'Carter', 'averycarter@example.com', 'password55', '1978-12-17', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('Sofia', 'Parker', 'sofiaparker@example.com', 'password56', '1997-07-06', 'female', 'Consultant', 'accountability', '18-25'),
    ('Jack', 'Evans', 'jackevans@example.com', 'password57', '1984-04-23', 'male', 'Lawyer', 'habit building', '26-40'),
    ('Liam', 'Edwards', 'liamedwards@example.com', 'password58', '1982-01-15', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Madison', 'Collins', 'madisoncollins@example.com', 'password59', '1994-03-19', 'female', 'Doctor', 'productivity', '26-40'),
    ('Benjamin', 'Stewart', 'benjaminstewart@example.com', 'password60', '2005-02-22', 'male', NULL, 'accountability', 'under 18'),
    ('Natalie', 'Morris', 'nataliemorris@example.com', 'password61', '1988-07-11', 'female', 'Engineer', 'habit building', '26-40'),
    ('Gabriel', 'Ward', 'gabrielward@example.com', 'password62', '1983-10-03', 'male', 'Teacher', 'productivity', '26-40'),
    ('Hannah', 'Rogers', 'hannahrogers@example.com', 'password63', '1997-05-17', 'female', 'Doctor', 'accountability', '26-40'),
    ('Dylan', 'Reed', 'dylanreed@example.com', 'password64', '2002-02-28', 'male', 'Student', 'habit building', '18-25'),
    ('Mia', 'Cook', 'miacook@example.com', 'password65', '1976-12-04', 'female', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Owen', 'Bell', 'owenbell@example.com', 'password66', '1990-03-22', 'male', 'Software Developer', 'productivity', '26-40'),
    ('Addison', 'Howard', 'addisonhoward@example.com', 'password67', '1985-08-07', 'female', 'Artist', 'accountability', '26-40'),
    ('Lillian', 'Ward', 'lillianward@example.com', 'password68', '1981-01-14', 'female', 'Writer', 'habit building', '26-40'),
    ('Jayden', 'Sanders', 'jaydensanders@example.com', 'password69', '2004-04-29', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Scarlett', 'Coleman', 'scarlettcoleman@example.com', 'password70', '1973-11-18', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('Luke', 'Russell', 'lukerussell@example.com', 'password71', '1996-02-12', 'male', 'Consultant', 'accountability', '18-25'),
    ('Leah', 'Butler', 'leahbutler@example.com', 'password72', '1991-07-27', 'female', 'Lawyer', 'habit building', '26-40'),
    ('Wyatt', 'Barnes', 'wyattbarnes@example.com', 'password73', '1987-05-09', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Madelyn', 'Ward', 'madelynnward@example.com', 'password74', '1989-09-26', 'female', 'Doctor', 'productivity', '26-40'),
    ('Henry', 'Griffin', 'henrygriffin@example.com', 'password75', '2001-12-05', 'male', NULL, 'accountability', 'under 18'),
    ('Amelia', 'Bryant', 'ameliabryant@example.com', 'password76', '1975-03-22', 'female', 'Engineer', 'habit building', '26-40'),
    ('Gavin', 'Fisher', 'gavinfisher@example.com', 'password77', '1982-10-08', 'male', 'Teacher', 'productivity', '26-40'),
    ('Chloe', 'Bishop', 'chloebishop@example.com', 'password78', '1998-06-19', 'female', 'Doctor', 'accountability', '26-40'),
    ('Brayden', 'Dunn', 'braydendunn@example.com', 'password79', '2003-03-31', 'male', 'Student', 'habit building', '18-25'),
    ('Lily', 'Banks', 'lilybanks@example.com', 'password80', '1974-08-15', 'female', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Zoe', 'Knight', 'zoeknight@example.com', 'password81', '1990-01-30', 'female', 'Software Developer', 'productivity', '26-40'),
    ('Xavier', 'Ward', 'xavierward@example.com', 'password82', '1985-04-22', 'male', 'Artist', 'accountability', '26-40'),
    ('Aubrey', 'Harper', 'aubreyharper@example.com', 'password83', '1980-09-08', 'female', 'Writer', 'habit building', '26-40'),
    ('Eli', 'Stevens', 'elistevens@example.com', 'password84', '2004-11-19', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Nora', 'Crawford', 'noracrawford@example.com', 'password85', '1979-02-10', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('Peyton', 'Wagner', 'peytonwagner@example.com', 'password86', '1994-12-23', 'male', 'Consultant', 'accountability', '18-25'),
    ('Hazel', 'Dixon', 'hazeldixon@example.com', 'password87', '1988-07-08', 'female', 'Lawyer', 'habit building', '26-40'),
    ('Levi', 'Cunningham', 'levicunningham@example.com', 'password88', '1982-05-02', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Anna', 'Ward', 'annaward@example.com', 'password89', '1998-10-15', 'female', 'Doctor', 'productivity', '26-40'),
    ('Austin', 'Murray', 'austinmurray@example.com', 'password90', '2002-03-18', 'male', NULL, 'accountability', 'under 18'),
    ('Ellie', 'Gardner', 'elliegardner@example.com', 'password91', '1976-06-25', 'female', 'Engineer', 'habit building', '26-40'),
    ('Colton', 'Ferguson', 'coltonferguson@example.com', 'password92', '1983-09-02', 'male', 'Teacher', 'productivity', '26-40'),
    ('Katherine', 'Hayes', 'katherinehayes@example.com', 'password93', '1997-08-11', 'female', 'Doctor', 'accountability', '26-40'),
    ('Jordan', 'Johnston', 'jordanjohnston@example.com', 'password94', '2001-04-24', 'male', 'Student', 'habit building', '18-25'),
    ('Grace', 'Lynch', 'gracelynch@example.com', 'password95', '1973-12-08', 'female', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Evan', 'Hicks', 'evanhicks@example.com', 'password96', '1989-01-31', 'male', 'Software Developer', 'productivity', '26-40'),
    ('Isaac', 'Ward', 'isaacward@example.com', 'password97', '1984-05-22', 'male', 'Artist', 'accountability', '26-40'),
    ('Audrey', 'Russell', 'audreyrussell@example.com', 'password98', '1981-10-09', 'female', 'Writer', 'habit building', '26-40'),
    ('Brooklyn', 'Hoffman', 'brooklynhoffman@example.com', 'password99', '2004-10-14', 'female', NULL, 'weekly progress tracking', 'under 18'),
    ('Tristan', 'Newton', 'tristannewton@example.com', 'password100', '1975-05-27', 'male', 'Entrepreneur', 'productivity', 'above 40'),
    ('Hailey', 'Pearson', 'haileypearson@example.com', 'password101', '1990-11-16', 'female', 'Consultant', 'accountability', '18-25'),
    ('Liam', 'Ward', 'liamward@example.com', 'password102', '1985-08-03', 'male', 'Lawyer', 'habit building', '26-40'),
    ('Julia', 'Banks', 'juliabanks@example.com', 'password103', '1983-02-25', 'female', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Violet', 'Fowler', 'violetfowler@example.com', 'password104', '1994-06-11', 'female', 'Doctor', 'productivity', '26-40'),
    ('Miles', 'Ward', 'mileward@example.com', 'password105', '1999-09-20', 'male', NULL, 'accountability', 'under 18');

Select * from users;

INSERT INTO habits (user_id, email_id, date, reading, walking, sleeping, gym, eating_healthy, others)
VALUES
(1, 'johndoe@yahoo.com', '2024-04-08', 'False', 'True', 'False', 'True', 'False', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-09', 'True', 'False', 'True', 'False', 'True', 'False'),
(1, 'johndoe@yahoo.com', '2024-04-10', 'True', 'True', 'True', 'True', 'True', 'False'),
(1, 'johndoe@yahoo.com', '2024-04-11', 'False', 'False', 'True', 'True', 'False', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-12', 'True', 'True', 'True', 'False', 'True', 'False'),
(1, 'johndoe@yahoo.com', '2024-04-13', 'True', 'False', 'True', 'True', 'True', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-14', 'False', 'True', 'False', 'False', 'False', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-15', 'True', 'True', 'True', 'True', 'False', 'False'),
(1, 'johndoe@yahoo.com', '2024-04-16', 'False', 'True', 'True', 'True', 'True', 'False'),
(1, 'johndoe@yahoo.com', '2024-04-17', 'True', 'False', 'True', 'False', 'True', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-18', 'True', 'True', 'True', 'True', 'False', 'True'),
(1, 'johndoe@yahoo.com', '2024-04-19', 'False', 'False', 'True', 'False', 'True', 'False'),
(2, 'janesmith@gmail.com', '2024-04-08', 'True', 'True', 'False', 'True', 'True', 'True'),
(2, 'janesmith@gmail.com', '2024-04-09', 'False', 'True', 'True', 'False', 'True', 'False'),
(2, 'janesmith@gmail.com', '2024-04-10', 'True', 'True', 'False', 'True', 'False', 'True'),
(2, 'janesmith@gmail.com', '2024-04-11', 'True', 'False', 'True', 'True', 'True', 'True'),
(2, 'janesmith@gmail.com', '2024-04-12', 'False', 'True', 'True', 'False', 'False', 'False'),
(2, 'janesmith@gmail.com', '2024-04-13', 'True', 'True', 'False', 'True', 'True', 'True'),
(2, 'janesmith@gmail.com', '2024-04-14', 'True', 'False', 'True', 'False', 'True', 'False'),
(2, 'janesmith@gmail.com', '2024-04-15', 'False', 'True', 'True', 'True', 'True', 'True'),
(2, 'janesmith@gmail.com', '2024-04-16', 'True', 'True', 'True', 'False', 'False', 'True'),
(2, 'janesmith@gmail.com', '2024-04-17', 'False', 'True', 'False', 'True', 'True', 'False'),
(2, 'janesmith@gmail.com', '2024-04-18', 'True', 'False', 'True', 'False', 'False', 'True'),
(2, 'janesmith@gmail.com', '2024-04-19', 'True', 'True', 'False', 'True', 'True', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-08', 'False', 'True', 'True', 'False', 'True', 'True'),
(3, 'michaeljohnson@outlook.com', '2024-04-09', 'True', 'False', 'False', 'True', 'True', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-10', 'True', 'True', 'True', 'True', 'False', 'True'),
(3, 'michaeljohnson@outlook.com', '2024-04-11', 'False', 'False', 'True', 'False', 'True', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-12', 'True', 'True', 'False', 'True', 'True', 'True'),
(3, 'michaeljohnson@outlook.com', '2024-04-13', 'False', 'True', 'True', 'False', 'False', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-14', 'True', 'False', 'False', 'True', 'True', 'True'),
(3, 'michaeljohnson@outlook.com', '2024-04-15', 'True', 'True', 'True', 'True', 'False', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-16', 'False', 'False', 'True', 'False', 'True', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-17', 'True', 'True', 'False', 'True', 'True', 'True'),
(3, 'michaeljohnson@outlook.com', '2024-04-18', 'False', 'True', 'True', 'False', 'False', 'False'),
(3, 'michaeljohnson@outlook.com', '2024-04-19', 'True', 'False', 'False', 'True', 'True', 'True'),
(4, 'emilywilliams@edu.com', '2024-04-08', 'True', 'True', 'False', 'True', 'True', 'False'),
(4, 'emilywilliams@edu.com', '2024-04-09', 'False', 'True', 'True', 'False', 'True', 'True'),
(4, 'emilywilliams@edu.com', '2024-04-10', 'True', 'True', 'True', 'True', 'False', 'False'),
(4, 'emilywilliams@edu.com', '2024-04-11', 'True', 'True', 'True', 'True', 'False', 'True'),
(4, 'emilywilliams@edu.com', '2024-04-12', 'False', 'True', 'False', 'True', 'True', 'False'),
(4, 'emilywilliams@edu.com', '2024-04-13', 'True', 'False', 'True', 'False', 'False', 'True'),
(5, 'davidbrown@hotmail.com', '2024-04-08', 'False', 'False', 'True', 'True', 'True', 'True'),
(5, 'davidbrown@hotmail.com', '2024-04-09', 'True', 'True', 'True', 'False', 'True', 'False'),
(5, 'davidbrown@hotmail.com', '2024-04-10', 'True', 'True', 'False', 'True', 'False', 'True'),
(5, 'davidbrown@hotmail.com', '2024-04-11', 'True', 'False', 'True', 'True', 'False', 'True'),
(5, 'davidbrown@hotmail.com', '2024-04-12', 'False', 'True', 'False', 'True', 'True', 'False'),
(5, 'davidbrown@hotmail.com', '2024-04-13', 'True', 'True', 'True', 'False', 'False', 'True'),
(6, 'sarahmiller@yahoo.com', '2024-04-08', 'True', 'True', 'True', 'False', 'True', 'False'),
(6, 'sarahmiller@yahoo.com', '2024-04-09', 'False', 'False', 'True', 'True', 'False', 'True'),
(6, 'sarahmiller@yahoo.com', '2024-04-10', 'True', 'True', 'False', 'True', 'True', 'True'),
(6, 'sarahmiller@yahoo.com', '2024-04-11', 'False', 'True', 'False', 'True', 'True', 'True'),
(6, 'sarahmiller@yahoo.com', '2024-04-12', 'True', 'True', 'True', 'False', 'False', 'True'),
(6, 'sarahmiller@yahoo.com', '2024-04-13', 'True', 'False', 'True', 'True', 'True', 'False'),
(7, 'ryandavis@gmail.com', '2024-04-08', 'False', 'True', 'False', 'True', 'True', 'True'),
(7, 'ryandavis@gmail.com', '2024-04-09', 'True', 'True', 'True', 'False', 'False', 'False'),
(7, 'ryandavis@gmail.com', '2024-04-10', 'True', 'False', 'True', 'True', 'True', 'True'),
(7, 'ryandavis@gmail.com', '2024-04-11', 'True', 'True', 'True', 'False', 'True', 'False'),
(7, 'ryandavis@gmail.com', '2024-04-12', 'False', 'True', 'True', 'True', 'False', 'True'),
(7, 'ryandavis@gmail.com', '2024-04-13', 'True', 'False', 'False', 'True', 'True', 'True'),
(8, 'oliviawilson@outlook.com', '2024-04-08', 'True', 'False', 'True', 'False', 'True', 'True'),
(8, 'oliviawilson@outlook.com', '2024-04-09', 'False', 'True', 'True', 'True', 'False', 'False'),
(8, 'oliviawilson@outlook.com', '2024-04-10', 'True', 'True', 'True', 'False', 'True', 'False'),
(8, 'oliviawilson@outlook.com', '2024-04-11', 'True', 'False', 'True', 'False', 'False', 'True'),
(8, 'oliviawilson@outlook.com', '2024-04-12', 'False', 'True', 'True', 'True', 'True', 'False'),
(8, 'oliviawilson@outlook.com', '2024-04-13', 'True', 'True', 'True', 'False', 'False', 'True'),
(9, 'williammoore@edu.com', '2024-04-08', 'False', 'False', 'False', 'True', 'True', 'True'),
(9, 'williammoore@edu.com', '2024-04-09', 'True', 'True', 'True', 'True', 'False', 'False'),
(9, 'williammoore@edu.com', '2024-04-10', 'False', 'True', 'False', 'True', 'True', 'True'),
(9, 'williammoore@edu.com', '2024-04-11', 'False', 'False', 'False', 'True', 'True', 'False'),
(9, 'williammoore@edu.com', '2024-04-12', 'True', 'True', 'True', 'True', 'False', 'True'),
(9, 'williammoore@edu.com', '2024-04-13', 'False', 'True', 'False', 'True', 'True', 'True'),
(10, 'emmataylor@hotmail.com', '2024-04-08', 'True', 'True', 'False', 'True', 'True', 'True'),
(10, 'emmataylor@hotmail.com', '2024-04-09', 'False', 'True', 'True', 'True', 'True', 'False'),
(10, 'emmataylor@hotmail.com', '2024-04-10', 'True', 'False', 'True', 'False', 'False', 'True'),
(10, 'emmataylor@hotmail.com', '2024-04-11', 'True', 'True', 'False', 'True', 'False', 'True'),
(10, 'emmataylor@hotmail.com', '2024-04-12', 'False', 'True', 'True', 'True', 'True', 'False'),
(10, 'emmataylor@hotmail.com', '2024-04-13', 'True', 'False', 'True', 'False', 'True', 'True'),
(11, 'jamesanderson@yahoo.com', '2024-04-08', 'True', 'True', 'False', 'False', 'False', 'True'),
(11, 'jamesanderson@yahoo.com', '2024-04-09', 'False', 'False', 'True', 'True', 'True', 'False'),
(11, 'jamesanderson@yahoo.com', '2024-04-10', 'True', 'True', 'True', 'False', 'True', 'True'),
(11, 'jamesanderson@yahoo.com', '2024-04-11', 'True', 'True', 'False', 'False', 'True', 'True'),
(11, 'jamesanderson@yahoo.com', '2024-04-12', 'False', 'False', 'True', 'True', 'True', 'False'),
(11, 'jamesanderson@yahoo.com', '2024-04-13', 'True', 'True', 'True', 'False', 'False', 'True'),
(12, 'avathomas@gmail.com', '2024-04-08', 'False', 'True', 'True', 'False', 'True', 'False'),
(12, 'avathomas@gmail.com', '2024-04-09', 'True', 'False', 'False', 'True', 'True', 'True'),
(12, 'avathomas@gmail.com', '2024-04-10', 'True', 'True', 'True', 'False', 'False', 'False'),
(12, 'avathomas@gmail.com', '2024-04-11', 'False', 'True', 'True', 'False', 'True', 'True'),
(12, 'avathomas@gmail.com', '2024-04-12', 'True', 'False', 'False', 'True', 'False', 'False'),
(12, 'avathomas@gmail.com', '2024-04-13', 'True', 'True', 'True', 'False', 'True', 'True'),
(13, 'benjaminjackson@outlook.com', '2024-04-08', 'True', 'True', 'False', 'True', 'False', 'True'),
(13, 'benjaminjackson@outlook.com', '2024-04-09', 'False', 'False', 'True', 'False', 'True', 'False'),
(13, 'benjaminjackson@outlook.com', '2024-04-10', 'True', 'True', 'False', 'True', 'True', 'True'),
(13, 'benjaminjackson@outlook.com', '2024-04-11', 'True', 'True', 'False', 'True', 'True', 'False'),
(13, 'benjaminjackson@outlook.com', '2024-04-12', 'False', 'False', 'True', 'False', 'False', 'True'),
(13, 'benjaminjackson@outlook.com', '2024-04-13', 'True', 'True', 'True', 'True', 'True', 'False'),
(14, 'sophiaharris@yahoo.com', '2024-04-08', 'False', 'True', 'True', 'True', 'False', 'True'),
(14, 'sophiaharris@yahoo.com', '2024-04-09', 'True', 'False', 'False', 'False', 'True', 'False'),
(14, 'sophiaharris@yahoo.com', '2024-04-10', 'True', 'True', 'True', 'True', 'True', 'True'),
(14, 'sophiaharris@yahoo.com', '2024-04-11', 'False', 'True', 'True', 'True', 'True', 'False'),
(14, 'sophiaharris@yahoo.com', '2024-04-12', 'True', 'True', 'True', 'False', 'False', 'True'),
(14, 'sophiaharris@yahoo.com', '2024-04-13', 'False', 'False', 'False', 'True', 'True', 'False'),
(15, 'ethanwhite@edu.com', '2024-04-08', 'True', 'True', 'True', 'True', 'True', 'False'),
(15, 'ethanwhite@edu.com', '2024-04-09', 'False', 'True', 'False', 'True', 'False', 'True'),
(15, 'ethanwhite@edu.com', '2024-04-10', 'True', 'False', 'True', 'False', 'True', 'True'),
(15, 'ethanwhite@edu.com', '2024-04-11', 'True', 'False', 'True', 'False', 'True', 'True'),
(15, 'ethanwhite@edu.com', '2024-04-12', 'True', 'True', 'False', 'True', 'False', 'True'),
(15, 'ethanwhite@edu.com', '2024-04-13', 'False', 'False', 'True', 'True', 'True', 'False');

INSERT INTO mood_diary (user_id, habits_id, date, reading_rating, walking_rating, sleeping_rating, gym_rating, eating_healthy_rating, others_rating, comments)
VALUES
(1, 48, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling good today.'),
(1, 49, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Had a productive day.'),
(1, 50, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Great workout today.'),
(1, 51, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling motivated.'),
(1, 52, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a peaceful night.'),
(1, 53, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling accomplished.'),
(1, 54, '2024-04-14', '4', '5', '3', '4', '5', '2', 'Feeling motivated.'),
(1, 55, '2024-04-15', '3', '4', '4', '3', '4', '3', 'Enjoyed a peaceful night.'),
(1, 56, '2024-04-16', '5', '5', '5', '5', '5', '4', 'Feeling accomplished.'),
(1, 57, '2024-04-17', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(1, 58, '2024-04-18', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(1, 59, '2024-04-19', '5', '5', '5', '5', '5', '4', 'Feeling energetic.'),
(2, 60, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(2, 61, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(2, 62, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling energetic.'),
(2, 63, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(2, 64, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(2, 65, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling energetic.'),
(2, 66, '2024-04-14', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(2, 67, '2024-04-15', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(2, 68, '2024-04-16', '5', '5', '5', '5', '5', '4', 'Feeling energetic.'),
(2, 69, '2024-04-17', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(2, 70, '2024-04-18', '3', '4', '4', '3', '4', '3', 'Had a productive day.'),
(2, 71, '2024-04-19', '5', '5', '5', '5', '5', '4', 'Great workout today.'),
(3, 72, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(3, 73, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Had a productive day.'),
(3, 74, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Exceeded my workout goals.'),
(3, 75, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(3, 76, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Had a productive day.'),
(3, 77, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Exceeded my workout goals.'),
(3, 78, '2024-04-14', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(3, 79, '2024-04-15', '3', '4', '4', '3', '4', '3', 'Had a productive day.'),
(3, 80, '2024-04-16', '5', '5', '5', '5', '5', '4', 'Exceeded my workout goals.'),
(3, 81, '2024-04-17', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(3, 82, '2024-04-18', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning run.'),
(3, 83, '2024-04-19', '5', '5', '5', '5', '5', '4', 'Feeling motivated.'),
(4, 84, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling accomplished.'),
(4, 85, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a healthy meal.'),
(4, 86, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Had a good sleep.'),
(4, 87, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling accomplished.'),
(4, 88, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a healthy meal.'),
(4, 89, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Had a good night\'s sleep.'),
(5, 90, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(5, 91, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(5, 92, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling motivated.'),
(5, 93, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(5, 94, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning walk.'),
(5, 95, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling motivated.'),
(6, 96, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling positive.'),
(6, 97, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a productive day.'),
(6, 98, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Relaxed after yoga session.'),
(6, 99, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling positive.'),
(6, 100, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a productive day.'),
(6, 101, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Relaxed after yoga session.'),
(7, 102, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(7, 103, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed outdoor activities.'),
(7, 104, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling accomplished.'),
(7, 105, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(7, 106, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed outdoor activities.'),
(7, 107, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling very healthy.'),
(8, 108, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling inspired.'),
(8, 109, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Had a relaxing evening.'),
(8, 110, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Enjoyed a healthy meal.'),
(8, 111, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling inspired.'),
(8, 112, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Had a relaxing evening.'),
(8, 113, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Enjoyed a healthy meal.'),
(9, 114, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling motivated.'),
(9, 115, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a deep sleep.'),
(9, 116, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling energized.'),
(9, 117, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling motivated.'),
(9, 118, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a good night\'s sleep.'),
(9, 119, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling energized.'),
(10, 120, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling accomplished.'),
(10, 121, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a productive day.'),
(10, 122, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling relaxed.'),
(10, 123, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling accomplished.'),
(10, 124, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a productive day.'),
(10, 125, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling relaxed.'),
(11, 126, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(11, 127, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning jog.'),
(11, 128, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Had a productive day at work.'),
(11, 129, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(11, 130, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning jog.'),
(11, 131, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Had a productive day at work.'),
(12, 132, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling positive.'),
(12, 133, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a relaxing evening.'),
(12, 134, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling motivated.'),
(12, 135, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling positive.'),
(12, 136, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a relaxing evening.'),
(12, 137, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling motivated.'),
(13, 138, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(13, 139, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a good workout.'),
(13, 140, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling accomplished.'),
(13, 141, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling refreshed.'),
(13, 142, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a good workout.'),
(13, 143, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling accomplished.'),
(14, 144, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling inspired.'),
(14, 145, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a quiet day.'),
(14, 146, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Feeling energized.'),
(14, 147, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling inspired.'),
(14, 148, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a quiet day.'),
(14, 149, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Feeling energized.'),
(15, 150, '2024-04-08', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(15, 151, '2024-04-09', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning run.'),
(15, 152, '2024-04-10', '5', '5', '5', '5', '5', '4', 'Had a productive study session.'),
(15, 153, '2024-04-11', '4', '5', '3', '4', '5', '2', 'Feeling focused.'),
(15, 154, '2024-04-12', '3', '4', '4', '3', '4', '3', 'Enjoyed a morning run.'),
(15, 155, '2024-04-13', '5', '5', '5', '5', '5', '4', 'Had a productive study session.');

select * from mood_diary;
