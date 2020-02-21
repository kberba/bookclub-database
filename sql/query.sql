/*
-- Query for add a new character functionality with colon : character being used to
-- denote the variables that will have data from the backend programming language
*/

/* SELECT queries */
SELECT * FROM book;
SELECT * FROM book INNER JOIN genre ON book.genre_id = genre.genre_id WHERE genre_name = :genre_name_INPUT;
SELECT * FROM club_group;
SELECT * FROM club_group INNER JOIN genre ON club_group.genre = genre.genre_id WHERE genre_name = :genre_name_INPUT;
SELECT * FROM genre;
SELECT * FROM club_member;


/* INSERT queries */
INSERT INTO book (title, author, genre_id, isbn) VALUES (:title_INPUT, :author_INPUT, :genre_id_INPUT, :isbn_INPUT);
INSERT INTO club_member (username, first_name, last_name, email, phone_num) VALUES (:username_INPUT, :first_name_INPUT, :last_name_INPUT, :email_INPUT, :phone_num_INPUT);
INSERT INTO genre (genre_id, genre_name) VALUES (:genre_id_INPUT, :genre_name_INPUT);
INSERT INTO club_group (group_name, book_id, genre, administrator) VALUES (:group_name_INPUT, :book_id_INPUT, :genre_INPUT, :administrator_INPUT);
INSERT INTO meeting (time_stamp, group_id) VALUES (:time_stamp_INPUT, :group_id_INPUT);


/* UPDATE queries */


/* DELETE queries *?
