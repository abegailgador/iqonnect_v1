-- primary key only (Student, Faculty, ITAdmin, Status, UserType) 6/17
-- all goods
CREATE TABLE Student (
    student_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    email_address varchar(255) NOT NULL,
    course varchar(255) NOT NULL,
    year_level varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (student_id)
);

INSERT INTO Student (student_id, last_name, first_name, email_address, course, year_level, password) VALUES
('201902003', 'Gador', 'Abegail', 'agaddor_ccs@uspf.edu.ph', 'BSIT', '4th Year', 'BSIT123'),
('201902004', 'Dela Cruz', 'Juan', 'jcruz_ccs@uspf.edu.ph', 'BSIT', '2nd Year', 'BSIT211'),
('201902005', 'Doe', 'Jane', 'jdoe_ccs@uspf.edu.ph', 'BSCS', '1st Year', 'test123');

-- all goods
CREATE TABLE Faculty (
    faculty_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    email_address varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (faculty_id)
);

INSERT INTO Faculty (faculty_id, last_name, first_name, email_address, password) VALUES
('10001', 'Rizal', 'Jose', 'jrizal@uspf.edu.ph', 'JRizal'),
('10002', 'Riz', 'J-Eaazy', 'eaazy@uspf.edu.ph', 'Eaazy1'),
('50008', 'Martin', 'Coco', 'cmartin@uspf.edu.ph', 'martin');

-- all goods
CREATE TABLE ITAdmin (
    admin_id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    email_address varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (admin_id)
);

INSERT INTO ITAdmin (admin_id, last_name, first_name, email_address, password) VALUES
('189001', 'Ramsay', 'Gordson', 'gordon_itadmin@uspf.edu.ph', 'ADMINpass123'),
('189002', 'Dalisay', 'Cardo', 'dalisay_itadmin@uspf.edu.ph', 'ADMINpass456');

-- all goods
CREATE TABLE Status (
    status_id int NOT NULL AUTO_INCREMENT,
    status varchar(255) NOT NULL,
    PRIMARY KEY (status_id)
);

INSERT INTO Status (status) VALUES 
('Online'), 
('Offline'), 
('Away'), 
('Do not Disturb'), 
('Vacation');


-- all goods
CREATE TABLE UserType (
    user_type_id int NOT NULL AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    PRIMARY KEY (user_type_id)
);

INSERT INTO UserType (type) VALUES 
('Student'), 
('Faculty'), 
('Admin');


-- all goods
CREATE TABLE Permission (
    permission_id int NOT NULL AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    PRIMARY KEY (permission_id)
);
INSERT INTO Permission (type) VALUES 
('Activated'), 
('Deactivated');


--  only (subject_code) ALL GOODS
CREATE TABLE Semester (
    semester_id int NOT NULL AUTO_INCREMENT,
    semester_type varchar(255) NOT NULL,
    PRIMARY KEY (semester_id)
);

INSERT INTO Semester (semester_type) VALUES 
('First'), 
('Second'),
('Summer');


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


-- with foreign key constraints (Subject, Semester, SubjectGroupChat, ) 11/16

-- 5 fk (student_id,faculty_id,admin_id,user_type_id,status_id, permission_id) ALL GOODS --NOT NULL para di ma confuse ang DB to link sa corresponding user
CREATE TABLE Users (
    user_id int NOT NULL AUTO_INCREMENT,
    student_id int,
    faculty_id int,
    admin_id int,
    user_type_id int NOT NULL,
    status_id int NOT NULL,
    permission_id int NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (admin_id) REFERENCES ITAdmin(admin_id),
    FOREIGN KEY (user_type_id) REFERENCES UserType(user_type_id),
    FOREIGN KEY (status_id) REFERENCES Status(status_id),
    FOREIGN KEY (permission_id) REFERENCES Permission(permission_id)
);

INSERT INTO Users (student_id, faculty_id, admin_id, user_type_id, status_id, permission_id) VALUES
(201902003, NULL, NULL, 1, 2, 1),
(201902004, NULL, NULL, 1, 2, 1),
(201902005, NULL, NULL, 1, 2, 1),
(NULL, 10001, NULL, 2, 2, 1);


-- 1fk only (semester_id) ALL GOODS
CREATE TABLE Subject (
    subject_code varchar(255) NOT NULL,
    subject_description varchar(255) NOT NULL,
    semester_id int NOT NULL,
    school_year varchar(255) NOT NULL,
    PRIMARY KEY (subject_code),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);

INSERT INTO Subject (subject_code, subject_description, semester_id, school_year) VALUES
('PE1', 'Physical Education', 1, '2021-2022');

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
    member_id int NOT NULL,
    group_message_id int,
    PRIMARY KEY (archived_id),
    FOREIGN KEY (subject_group_id) REFERENCES SubjectGroupChat(subject_group_id),
    FOREIGN KEY (group_id) REFERENCES GroupChat(group_id),
    FOREIGN KEY (member_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_message_id) REFERENCES GroupMessage(group_message_id)
);

INSERT INTO ArchivedGroupChat (subject_group_id, group_id, member_id, group_message_id) VALUES 
(1, NULL, 1, NULL),
(1, NULL, 2, NULL),
(NULL, 1, 1, NULL);


CREATE TABLE SubjectGroupChat (
    subject_group_id int NOT NULL AUTO_INCREMENT,
    subject_code varchar(255) NOT NULL,
    member_id int NOT NULL,
    group_message_id int,
    PRIMARY KEY (subject_group_id),
    FOREIGN KEY (subject_code) REFERENCES Subject(subject_code),
    FOREIGN KEY (member_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_message_id) REFERENCES GroupMessage(group_message_id)
);

INSERT INTO SubjectGroupChat (subject_code, member_id, group_message_id) VALUES 
('PE1', 1, 1),
('PE1', 2, NULL),
('PE1', 1, 2);

CREATE TABLE GroupChat (
    group_id int NOT NULL AUTO_INCREMENT,
    group_name varchar(255) NOT NULL,
    member_id int NOT NULL,
    group_message_id int,
    PRIMARY KEY (group_id),
    FOREIGN KEY (member_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_message_id) REFERENCES GroupMessage(group_message_id)
);

INSERT INTO GroupChat (group_name, member_id, group_message_id) VALUES 
('CCS GroupChat', 1, 1),
('CCS GroupChat', 2, NULL),
('CCS GroupChat', 1, 2);

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