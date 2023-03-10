-- Creating table for authors
CREATE TABLE authors (
     title VARCHAR(100) NOT NULL,
     author VARCHAR(100) NOT NULL
); 
SELECT * FROM authors; 

-- Creating table for book type
CREATE TABLE book_type (
    book_type VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
);
SELECT * FROM book_type;

--Creating table for ranking
CREATE TABLE ranking (
	rank INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
	weeks_on_list INT NOT NULL
);
SELECT * FROM ranking;

-- Creating table for clean bestsellers
CREATE TABLE clean_bestsellers (
	published_date DATE NOT NULL,
	book_type VARCHAR(100) NOT NULL,
	rank INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	weeks_on_list INT NOT NULL
);
SELECT * FROM clean_bestsellers;