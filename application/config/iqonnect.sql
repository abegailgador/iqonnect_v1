-- primary key only (Student, Faculty, ITAdmin, Status, UserType) 6/17
-- all goods
CREATE TABLE Student (
    student_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    email_address varchar(255) NOT NULL,
    course varchar(255) NOT NULL,
    year_level varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (student_id)
);

INSERT INTO Student (student_id, last_name, first_name, middle_name, email_address, course, year_level, password) VALUES
('201902003', 'Gador', 'Abegail', 'Morillo', 'agaddor_ccs@uspf.edu.ph', 'BSIT', '4th Year', 'BSIT123'),
('201902004', 'Dela Cruz', 'Juan', NULL ,'jcruz_ccs@uspf.edu.ph', 'BSIT', '2nd Year', 'BSIT211'),
('201902005', 'Doe', 'Jane', 'Rizal', 'jdoe_ccs@uspf.edu.ph', 'BSCS', '1st Year', 'test123');

-- all goods
CREATE TABLE Instructor (
    instructor_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    email_address varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (instructor_id)
);

INSERT INTO Instructor (instructor_id, last_name, first_name, middle_name, email_address, password) VALUES
('10001', 'Rizal', 'Jose', NULL, 'jrizal@uspf.edu.ph', 'JRizal'),
('10002', 'Riz', 'J-Eaazy', 'Pasay', 'eaazy@uspf.edu.ph', 'Eaazy1'),
('50008', 'Martin', 'Coco', 'Paday', 'cmartin@uspf.edu.ph', 'martin');

-- all goods
CREATE TABLE ITAdmin (
    admin_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    email_address varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (admin_id)
);

INSERT INTO ITAdmin (admin_id, last_name, first_name, middle_name, email_address, password) VALUES
('189001', 'Ramsay', 'Gordson', 'Chef', 'gordon_itadmin@uspf.edu.ph', 'ADMINpass123'),
('189002', 'Dalisay', 'Cardo', 'Martin', 'dalisay_itadmin@uspf.edu.ph', 'ADMINpass456');

-- all goods
CREATE TABLE Status (
    status_id int AUTO_INCREMENT,
    status varchar(255),
    PRIMARY KEY (status_id)
);

INSERT INTO Status (status) VALUES 
('Online'), 
('Offline'), 
('On Call');

CREATE TABLE CustomizeStatus (
    custom_status_id int AUTO_INCREMENT,
    status varchar(255),
    PRIMARY KEY (custom_status_id)
);

INSERT INTO CustomizeStatus (status) VALUES 
('Work until 9PM'), 
('Capstone Consultation until 11PM'), 
('Vacation Leave from 8/1/2022-8/30/2022');

-- all goods
CREATE TABLE UserType (
    user_type_id int NOT NULL AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    PRIMARY KEY (user_type_id)
);

INSERT INTO UserType (type) VALUES 
('Student'), 
('Instructor'), 
('ITAdmin');


-- all goods
CREATE TABLE Permission (
    permission_id int NOT NULL AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    PRIMARY KEY (permission_id)
);
INSERT INTO Permission (type) VALUES 
('Activated'), 
('Not yet Registered'),
('Deactivated');


-- add og school year na table tas i-add sa semester FK REFERENCES
CREATE TABLE SchoolYear (
    school_year_id int NOT NULL AUTO_INCREMENT,
    school_year varchar(255) NOT NULL,
    PRIMARY KEY (school_year_id)
);

INSERT INTO SchoolYear (school_year) VALUES 
("2018 - 2019"), 
("2020 - 2021"),
("2021 - 2022");


-- NEWLY ADDED TABLE LINKED TO SUBJECT
CREATE TABLE Section (
    section_id int NOT NULL AUTO_INCREMENT,
    class_section varchar(255) NOT NULL,
    room_location varchar(255) NOT NULL,
    class_time varchar(255) NOT NULL,
    room_day varchar(255) NOT NULL,
    PRIMARY KEY (section_id)
);

INSERT INTO Section (class_section, room_location, class_time, room_day) VALUES 
("F", "North Building Room 405", "10AM - 7:00PM", "Monday"), 
("CCS1", "North Building Room 405", "10AM - 7:00PM", "Monday");


-- linked to chat message 
CREATE TABLE ChatFile (
    file_id int NOT NULL AUTO_INCREMENT,
    file_name varchar(255) NOT NULL,
    PRIMARY KEY (file_id)
);

INSERT INTO ChatFile (file_name) VALUES 
('sample.pdf'),
('resume.pdf'),
('test.txt');

-- for ALL TYPES OF GROUP CHATS

CREATE TABLE GroupFile (
    group_file_id int NOT NULL AUTO_INCREMENT,
    file_name varchar(255) NOT NULL,
    PRIMARY KEY (group_file_id)
);

INSERT INTO GroupFile (file_name) VALUES 
('samplegroup.pdf'),
('resumegroup.pdf'),
('testgroup.txt');


-- with foreign key constraints (Subject, Semester, SubjectGroupChat, ) 12/17

-- add og school year na table tas i-add sa semester FK REFERENCES
CREATE TABLE Semester (
    semester_id int NOT NULL AUTO_INCREMENT,
    semester_type varchar(255) NOT NULL,
    school_year_id int NOT NULL,
    PRIMARY KEY (semester_id),
    FOREIGN KEY (school_year_id) REFERENCES SchoolYear (school_year_id)
);

INSERT INTO Semester (semester_type, school_year_id) VALUES 
('First', 1), 
('Second', 1),
('Summer', 1);

-- 5 fk (student_id,faculty_id,admin_id,user_type_id,status_id, permission_id) ALL GOODS --NOT NULL para di ma confuse ang DB to link sa corresponding user
CREATE TABLE Users (
    user_id int NOT NULL AUTO_INCREMENT,
    student_id int,
    instructor_id int,
    admin_id int,
    user_type_id int NOT NULL,
    status_id int,
    custom_status_id int,
    permission_id int NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
    FOREIGN KEY (admin_id) REFERENCES ITAdmin(admin_id),
    FOREIGN KEY (user_type_id) REFERENCES UserType(user_type_id),
    FOREIGN KEY (status_id) REFERENCES Status(status_id),
    FOREIGN KEY (custom_status_id) REFERENCES CustomizeStatus(custom_status_id),
    FOREIGN KEY (permission_id) REFERENCES Permission(permission_id)
);

INSERT INTO Users (student_id, instructor_id, admin_id, user_type_id, status_id, custom_status_id, permission_id) VALUES
(201902003, NULL, NULL, 1, 2, NULL, 1),
(201902004, NULL, NULL, 1, NULL, 2, 1),
(201902005, NULL, NULL, 1, 2, NULL, 1),
(NULL, 10001, NULL, 2, NULL, 3, 1);


-- 1fk only (semester_id) ALL GOODS
CREATE TABLE Subject (
    subject_id int NOT NULL AUTO_INCREMENT,
    subject_code varchar(255) NOT NULL,
    subject_description varchar(255) NOT NULL,
    semester_id int NOT NULL,
    school_year_id int NOT NULL,
    section_id int NOT NULL,
    PRIMARY KEY (subject_id),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id),
    FOREIGN KEY (school_year_id) REFERENCES SchoolYear(school_year_id),
    FOREIGN KEY (section_id) REFERENCES Section(section_id)
);

INSERT INTO Subject (subject_code, subject_description, semester_id, school_year_id, section_id) VALUES
('PE1', 'Physical Education', 1, 1, 1);

-- 2 fk only (sender_id,receiver_id,file_id) PERSONAL CHAT ALL GOODS
CREATE TABLE ChatMessage (
    message_id int NOT NULL AUTO_INCREMENT,
    sender_id int NOT NULL,
    receiver_id int NOT NULL,
    file_id int,
    time_sent datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time_read datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    message longtext,
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id),
    FOREIGN KEY (file_id) REFERENCES ChatFile(file_id)
);

INSERT INTO ChatMessage (sender_id, receiver_id, file_id, time_sent, time_read, message) VALUES 
(1, 2, NULL, '2022-08-31 00:26:10', '2022-08-31 00:28:10', 'Hello'),
(2, 1, 1, '2022-08-31 00:28:10', '2022-08-31 00:48:10', 'Hi'),
(1, 2, 2, '2022-08-31 00:50:10', '2022-08-31 01:28:10', 'How are you?'),
(2, 1, 3, '2022-08-31 02:28:10', '2022-08-31 03:48:10', 'Char hahahhahahahhahahhah english');


-- naka link siya sa group/archived/subjectgc by groupmessage id
CREATE TABLE ArchivedGroupChat (
    archived_id int NOT NULL AUTO_INCREMENT,
    subject_group_id int,
    group_id int,
    PRIMARY KEY (archived_id),
    FOREIGN KEY (subject_group_id) REFERENCES SubjectGroupChat(subject_group_id),
    FOREIGN KEY (group_id) REFERENCES GroupChat(group_id)
);

INSERT INTO ArchivedGroupChat (subject_group_id, group_id) VALUES 
(1, NULL),
(1, NULL),
(NULL, 1);


CREATE TABLE SubjectGroupChat (
    subject_group_id int NOT NULL AUTO_INCREMENT,
    subject_id int NOT NULL,
    member_id int NOT NULL,
    section_id int NOT NULL,
    group_message_id int,
    subject_image LONGBLOB,
    PRIMARY KEY (subject_group_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    FOREIGN KEY (member_id) REFERENCES Users(user_id),
    FOREIGN KEY (section_id) REFERENCES Section(section_id),
    FOREIGN KEY (group_message_id) REFERENCES GroupMessage(group_message_id)
);

INSERT INTO SubjectGroupChat (subject_id, member_id, section_id, group_message_id, subject_image) VALUES 
(1, 1, 1, 1),
(1, 2, 1, NULL),
(1, 4, 1, 2);

ALTER TABLE SubjectGroupChat AUTO_INCREMENT = 100;

CREATE TABLE GroupChat (
    group_id int NOT NULL AUTO_INCREMENT,
    group_name varchar(255) NOT NULL,
    member_id int NOT NULL,
    group_message_id int,
    group_image LONGBLOB,
    PRIMARY KEY (group_id),
    FOREIGN KEY (member_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_message_id) REFERENCES GroupMessage(group_message_id)
);

INSERT INTO GroupChat (group_name, member_id, group_message_id, group_image) VALUES 
('CCS GroupChat', 1, 1, NULL),
('CCS GroupChat', 2, NULL, NULL),
('CCS GroupChat', 1, 2, NULL);

ALTER TABLE GroupChat AUTO_INCREMENT = 200;


-- naka link siya sa group/archived/subjectgc by groupmessage id
CREATE TABLE GroupMessage (
    group_message_id int NOT NULL AUTO_INCREMENT,
    sender_id int NOT NULL,
    message longtext,
    group_file_id int,
    time_sent datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time_read datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (group_message_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_file_id) REFERENCES GroupFile(group_file_id)
);

INSERT INTO GroupMessage (sender_id, message, group_file_id, time_sent, time_read) VALUES 
(1, NULL, 1, '2022-08-31 00:26:10', '2022-08-31 00:28:10'),
(1, 'Keyboard', 2, '2022-08-31 00:28:10', '2022-08-31 00:48:10'),
(2, "What's up and down?", 3, '2022-08-31 00:50:10', '2022-08-31 01:28:10');




CREATE TABLE Report  (
    report_id int NOT NULL AUTO_INCREMENT,
    reporter_id int NOT NULL,
    reported_user int,
    reported_group int,
    reported_subject int,
    message longtext,
    time_file datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (report_id),
    FOREIGN KEY (reporter_id) REFERENCES Users(user_id),
    FOREIGN KEY (reported_user) REFERENCES Users(user_id),
    FOREIGN KEY (reported_group) REFERENCES GroupChat(group_id),
    FOREIGN KEY (reported_subject) REFERENCES SubjectGroupChat(subject_group_id)
);

INSERT INTO Report (reporter_id, reported_user, reported_group, reported_subject) VALUES
(1, NULL, 1, NULL),
(2, NULL, NULL, 1),
(1, 2, NULL, NULL);

ALTER
ALTER TABLE tbl AUTO_INCREMENT = 100;

ALTER TABLE Users
ADD image LONGBLOB;


ALTER TABLE 
ADD message_viewed int DEFAULT '0',

  `viewed` int(11) DEFAULT '0',

ALTER TABLE Customers
DROP COLUMN ContactName;



GITHUB COMMAND
git log - check latest commits
git branch - review check out branch
git add . - stage all changes 
git commit -a -m "Update message" - commit changes

AFTER CHANGES 
git add . - stage all changes 
git commit -a -m "Update message" - commit changes
git push - push changes
---- COMMIT AND PUSH THEN SYNCH 
new pull request
git fetch - sync origin to local 
check if branch has the updated commits 
create new pull request>click the corresponding branch
review the changes
click create pull request
add comment for the pull request 
merge pull request

--MERGE TO LOCAL
git fetch - sync origin to local branch
git status - for status only
git checkout main - check main branch updated changes
git pull - pull commits from main
git checkout dev/dev-hazel - to transfer back to ur branch para mag code 
git merge main - get latest commits from main branch to ur branch
git log - to verify if naa na dadto sa imong branch ang changes

