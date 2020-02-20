DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
	`book_id` int UNIQUE NOT NULL AUTO_INCREMENT,
    `title` varchar(255) NOT NULL,
    `author` varchar(255) NOT NULL,
    `genre_id` varchar(255) NOT NULL,
    `isbn` int UNIQUE NOT NULL,
    PRIMARY KEY (`book_id`),
    CONSTRAINT `fk_book_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
);


DROP TABLE IF EXISTS `club_member`;

CREATE TABLE `club_member` (
	`member_id` int UNIQUE NOT NULL AUTO_INCREMENT,
    `username` varchar(255) UNIQUE NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `email` varchar(255) UNIQUE NOT NULL,
    `phone_num` varchar(255) UNIQUE NULL,
    PRIMARY KEY (`member_id`),
);


DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `genre_id` int UNIQUE NOT NULL,
  `genre_name` varchar(255) UNIQUE NOT NULL,
  PRIMARY KEY (`genre_id`),
);


DROP TABLE IF EXISTS `club_group`;

CREATE TABLE `club_group` (
  `group_id` int UNIQUE NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) UNIQUE NOT NULL,
  `book_id` int NOT NULL
  `genre` varchar(255) NOT NULL,
  `administrator` int NOT NULL,
  PRIMARY KEY (`group_id`),
  CONSTRAINT `fk_club_group_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
);


DROP TABLE IF EXISTS `group_membership`;

CREATE TABLE `group_membership` (
  `group_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`group_id`, `member_id`),
  CONSTRAINT `fk_club_grp_grp_membership` FOREIGN KEY (`group_id`) REFERENCES `club_group` (`group_id`),
  CONSTRAINT `fk_club_memb_grp_membership` FOREIGN KEY (`member_id`)
  REFERENCES `club_member` (`member_id`)
);


DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `meeting_id` int UNIQUE NOT NULL,
  `time_stamp` DATETIME NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`),
  CONSTRAINT `fk_meeting_group` FOREIGN KEY (`group_id`) REFERENCES `club_group` (`group_id`)
);


DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `meeting_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`, `member_id`),
  CONSTRAINT `fk_attendance_members` FOREIGN KEY (`member_id`) REFERENCES `club_member` (`member_id`),
  CONSTRAINT `fk_attendance_meeting` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`)
);




--INSERTIONS BEGIN HERE--

INSERT INTO genre (genre_id, genre_name)
VALUES (1, 'Fantasy');

INSERT INTO genre (genre_id, genre_name)
VALUES (2, `Science Fiction`)

INSERT INTO genre (genre_id, genre_name)
VALUES (3, 'Horror');

INSERT INTO genre (genre_id, genre_name)
VALUES (4, `Western`);

INSERT INTO genre (genre_id, genre_name)
VALUES (5, `Romance`);

INSERT INTO genre (genre_id, genre_name)
VALUES (6, `Thriller`);

INSERT INTO genre (genre_id, genre_name)
VALUES (7, `Mystery`);

INSERT INTO genre (genre_id, genre_name)
VALUES (8, `Contemporary Fiction`);

INSERT INTO genre (genre_id, genre_name)
VALUES (9, 'Poetry');

INSERT INTO genre (genre_id, genre_name)
VALUES (10, 'Self-Help');

INSERT INTO genre (genre_id, genre_name)
VALUES (11, 'Biography');

INSERT INTO genre (genre_id, genre_name)
VALUES (12, 'Fiction');

INSERT INTO genre (genre_id, genre_name)
VALUES (13, 'Educational');


--INITIAL BOOK INSERTIONS--
INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Catcher in the Rye', 'J.D. Salinger', 12, '9780316769488');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Tiny Beautiful Things: Advice on Love and Life from Dear Sugar', 'Cheryl Strayed', 10, '9780307949332');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Getting Things Done', 'David Allen', 10, '9780143126560');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('The Definining Decade: Why Your Twenties Matter--And How to Make the Most of Them Now', 'Meg Jay, PHD', 10, '9780446561754');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Relational Database Design and Implementation', 'Jan L. Harrington', 13, '9780128043998');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 1, '9781338299144');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Dune', 'Frank Herbert', 2, '9780441172719');

--INITIAL MEMBER INSERTIONS
INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('jbrews101', 'Johnni', 'Brewer', 'johnni.brewer@example.com', '(609)-242-9871');

INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('hoppin_to_the_kins', 'Wesley', 'Hopkins', 'wesley.hopkins@example.com', '(105)-837-6450');

INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('emergencyCPRice', 'Cecil', 'Price', 'cecil.price@example.com', '(229)-879-0327');

INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('bigHart', 'Celina', 'Hart', 'celina.hart@example.com', '(952)-896-6086');

INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('T-Cluvsdogs', 'Tara', 'tara.carpenter@example.com', '(391)-221-2354');

INSERT INTO club_member(username, first_name, last_name, email, phone_num)
VALUES('tamtam', 'Tammy', 'Henderson', 'tammy.henderson@example.com', '(391) 069-3011');

--INITIAL GROUPS--
INSERT INTO club_groups(group_name, book_id, genre, administrator)
VALUES ('We Like Wizards', 5, 1, 1);

INSERT INTO club_groups(group_name, book_id, genre, administrator)
VALUES ('Just Fiction', 0, 12, 1);

INSERT INTO club_groups(group_name, book_id, genre, administrator)
VALUES ('Help Me Out', 3, 10, 4);

INSERT INTO club_groups(group_name, book_id, genre, administrator)
VALUES ('Learn Some Stuff', 4, 13, 5);
