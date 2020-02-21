DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
  genre_id int UNIQUE NOT NULL,
  genre_name varchar(255) UNIQUE NOT NULL,
  PRIMARY KEY (genre_id)
);

DROP TABLE IF EXISTS book;

CREATE TABLE book (
	book_id int UNIQUE NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    author varchar(255) NOT NULL,
    genre_id int NOT NULL,
    isbn varchar(255) UNIQUE NOT NULL,
    PRIMARY KEY (book_id),
	FOREIGN KEY book(genre_id) REFERENCES genre(genre_id)
	ON DELETE CASCADE
);


DROP TABLE IF EXISTS club_member;

CREATE TABLE club_member (
	member_id int UNIQUE NOT NULL AUTO_INCREMENT,
    username varchar(255) UNIQUE NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    phone_num varchar(255) UNIQUE NULL,
    PRIMARY KEY (member_id)
);


DROP TABLE IF EXISTS club_group;

CREATE TABLE club_group (
  group_id int UNIQUE NOT NULL AUTO_INCREMENT,
  group_name varchar(255) UNIQUE NOT NULL,
  book_id int NOT NULL,
  genre varchar(255) NOT NULL,
  administrator int NOT NULL,
  PRIMARY KEY (group_id),
  CONSTRAINT fk_club_group_book FOREIGN KEY (book_id) REFERENCES book (book_id)
  ON DELETE CASCADE
);


DROP TABLE IF EXISTS group_membership;

CREATE TABLE group_membership (
  group_id int NOT NULL,
  member_id int NOT NULL,
  PRIMARY KEY (group_id, member_id),
  CONSTRAINT fk_club_grp_grp_membership FOREIGN KEY (group_id)
  REFERENCES club_group (group_id)
  ON DELETE CASCADE,
  CONSTRAINT fk_club_memb_grp_membership FOREIGN KEY (member_id)
  REFERENCES club_member (member_id)
  ON DELETE CASCADE
);


DROP TABLE IF EXISTS meeting;

CREATE TABLE meeting (
  meeting_id int UNIQUE NOT NULL AUTO_INCREMENT,
  time_stamp DATETIME NOT NULL,
  group_id int NOT NULL,
  PRIMARY KEY (meeting_id),
  CONSTRAINT fk_meeting_group FOREIGN KEY (group_id)
  REFERENCES club_group (group_id)
  ON DELETE CASCADE
);


DROP TABLE IF EXISTS attendance;

CREATE TABLE attendance (
  meeting_id int NOT NULL,
  member_id int NOT NULL,
  PRIMARY KEY (meeting_id, member_id),
  CONSTRAINT fk_attendance_members FOREIGN KEY (member_id)
  REFERENCES club_member (member_id)
  ON DELETE CASCADE,
  CONSTRAINT fk_attendance_meeting FOREIGN KEY (meeting_id)
  REFERENCES meeting (meeting_id)
  ON DELETE CASCADE
);


INSERT INTO genre (genre_id, genre_name)
VALUES (1, 'Fantasy');

INSERT INTO genre (genre_id, genre_name)
VALUES (2, 'Science Fiction');

INSERT INTO genre (genre_id, genre_name)
VALUES (3, 'Horror');

INSERT INTO genre (genre_id, genre_name)
VALUES (4, 'Western');

INSERT INTO genre (genre_id, genre_name)
VALUES (5, 'Romance');

INSERT INTO genre (genre_id, genre_name)
VALUES (6, 'Thriller');

INSERT INTO genre (genre_id, genre_name)
VALUES (7, 'Mystery');

INSERT INTO genre (genre_id, genre_name)
VALUES (8, 'Contemporary Fiction');

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

/*INITIAL BOOK INSERTIONS*/
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
VALUES ("Harry Potter and the Sorcerer's Stone", 'J.K. Rowling', 1, '9781338299144');

INSERT INTO book (title, author, genre_id, isbn)
VALUES ('Dune', 'Frank Herbert', 2, '9780441172719');

/*INITIAL MEMBER INSERTIONS*/
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('jbrews101', 'Johnni', 'Brewer', 'johnni.brewer@example.com', '(609)-242-9871');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('hoppin_to_the_kins', 'Wesley', 'Hopkins', 'wesley.hopkins@example.com', '(105)-837-6450');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('emergencyCPRice', 'Cecil', 'Price', 'cecil.price@example.com', '(229)-879-0327');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('bigHart', 'Celina', 'Hart', 'celina.hart@example.com', '(952)-896-6086');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('T-Cluvsdogs', 'Tara', 'Carpenter', 'tara.carpenter@example.com', '(391)-221-2354');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('tamtam', 'Tammy', 'Henderson', 'tammy.henderson@example.com', '(391) 069-3011');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('siacovuzzi0', 'Silva', 'Iacovuzzi', 'siacovuzzi0@deliciousdays.com', '(690) 2394714');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('bmcmahon1', 'Binny', 'McMahon', 'bmcmahon1@blogs.com', '(183) 1207494');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('amacfadden2', 'Auroora', 'MacFadden', 'amacfadden2@slate.com', '(488) 7370256');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('kcaudrelier3', 'Kristoffer', 'Caudrelier', 'kcaudrelier3@nbcnews.com', '(677) 6497650');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('gcostelow4', 'Glyn', 'Costelow', 'gcostelow4@tamu.edu', '(558) 8803093');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('hfahrenbach5', 'Hugues', 'Fahrenbach', 'hfahrenbach5@seattletimes.com', '(120) 2645791');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('mangrick6', 'Mirilla', 'Angrick', 'mangrick6@simplemachines.org', '(124) 6390344');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('adundendale7', 'Andria', 'Dundendale', 'adundendale7@cocolog-nifty.com', '(995) 4171151');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('bather8', 'Blithe', 'Ather', 'bather8@ucoz.com', '(862) 5318199');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('mpendre9', 'Maxie', 'Pendre', 'mpendre9@sciencedaily.com', '(406) 8818255');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('bcuppitta', 'Beverlie', 'Cuppitt', 'bcuppitta@tuttocitta.it', '(530) 9900847');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('aeasomb', 'Andras', 'Easom', 'aeasomb@hc360.com', '(147) 5457128');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('tcrocroftc', 'Tonie', 'Crocroft', 'tcrocroftc@hp.com', '(666) 2013903');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('corrd', 'Cash', 'Orr', 'corrd@about.me', '(206) 9822463');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('dtousye', 'Dalis', 'Tousy', 'dtousye@fastcompany.com', '(802) 9193863');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('fsherwillf', 'Floyd', 'Sherwill', 'fsherwillf@rakuten.co.jp', '(157) 4287591');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('lbramhillg', 'Lauryn', 'Bramhill', 'lbramhillg@symantec.com', '(222) 1129772');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('clestorh', 'Cecil', 'Lestor', 'clestorh@cbc.ca', '(700) 8579339');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('aizachiki', 'Anestassia', 'Izachik', 'aizachiki@google.ca', '(492) 9867084');
INSERT INTO club_member(username, first_name, last_name, email, phone_num) VALUES ('cgrassettj', 'Cross', 'Grassett', 'cgrassettj@state.tx.us', '(535) 9780830');

/*INITIAL GROUPS*/
INSERT INTO club_group(group_name, book_id, genre, administrator)
VALUES ('We Like Wizards', 6, 1, 1);

INSERT INTO club_group(group_name, book_id, genre, administrator)
VALUES ('Just Fiction', 1, 12, 2);

INSERT INTO club_group(group_name, book_id, genre, administrator)
VALUES ('Help Me Out', 4, 10, 4);

INSERT INTO club_group(group_name, book_id, genre, administrator)
VALUES ('Learn Some Stuff', 5, 13, 5);

/*INITIAL GROUP MEMBERSHIPS*/
INSERT INTO group_membership (group_id, member_id) VALUES (1, 1);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 5);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 25);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 13);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 19);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 24);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 2);
INSERT INTO group_membership (group_id, member_id) VALUES (1, 12);
INSERT INTO group_membership (group_id, member_id) VALUES (2, 2);
INSERT INTO group_membership (group_id, member_id) VALUES (2, 13);
INSERT INTO group_membership (group_id, member_id) VALUES (2, 8);
INSERT INTO group_membership (group_id, member_id) VALUES (2, 10);
INSERT INTO group_membership (group_id, member_id) VALUES (2, 14);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 4);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 1);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 5);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 19);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 20);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 7);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 11);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 2);
INSERT INTO group_membership (group_id, member_id) VALUES (3, 22);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 5);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 19);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 4);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 15);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 10);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 17);
INSERT INTO group_membership (group_id, member_id) VALUES (4, 26);

/*Initial Meetings Held*/
INSERT INTO meeting (group_id, time_stamp) VALUES (1, '2020-02-21 13:24:00');
INSERT INTO meeting (group_id, time_stamp) VALUES (3, '2020-02-19 18:23:00');
INSERT INTO meeting (group_id, time_stamp) VALUES (4, '2020-02-19 20:30:00');

/*Initial Member Attendance for Each Meeting*/
INSERT INTO attendance (meeting_id, member_id) VALUES (1, 1);
INSERT INTO attendance (meeting_id, member_id) VALUES (1, 5);
INSERT INTO attendance (meeting_id, member_id) VALUES (1, 12);
INSERT INTO attendance (meeting_id, member_id) VALUES (1, 24);
INSERT INTO attendance (meeting_id, member_id) VALUES (2, 2);
INSERT INTO attendance (meeting_id, member_id) VALUES (2, 10);
INSERT INTO attendance (meeting_id, member_id) VALUES (2, 13);
INSERT INTO attendance (meeting_id, member_id) VALUES (2, 14);
INSERT INTO attendance (meeting_id, member_id) VALUES (3, 4);
INSERT INTO attendance (meeting_id, member_id) VALUES (3, 5);
INSERT INTO attendance (meeting_id, member_id) VALUES (3, 11);
INSERT INTO attendance (meeting_id, member_id) VALUES (3, 19);
