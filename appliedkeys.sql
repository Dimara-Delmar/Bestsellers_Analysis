-- Creating table for authors
CREATE TABLE authors (
     title VARCHAR(50) NOT NULL,
     author VARCHAR(50) NOT NULL,
     PRIMARY KEY (title, author)
);

-- Creating table for book type
CREATE TABLE book_type (
    book_type VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (book_type),
    FOREIGN KEY (title) REFERENCES clean_bestsellers (title)
);

--Creating table for ranking
CREATE TABLE ranking (
     title VARCHAR(50) NOT NULL,
     author VARCHAR(50) NOT NULL,
	rank INT NOT NULL,
	weeks_on_list INT NOT NULL,
     PRIMARY KEY (title, author),
	FOREIGN KEY (title) REFERENCES clean_bestsellers (title),
	FOREIGN KEY (author) REFERENCES clean_bestsellers (author)
);

-- Creating table for clean bestsellers
CREATE TABLE clean_bestsellers (
	published_date DATE NOT NULL,
	book_type VARCHAR(50) NOT NULL,
     title VARCHAR(50) NOT NULL,
     author VARCHAR(50) NOT NULL,
	rank INT NOT NULL,
	weeks_on_list INT NOT NULL,
	description TEXT NOT NULL,
	price INT NOT NULL,
     PRIMARY KEY (title, author),
	FOREIGN KEY (title) REFERENCES authors (title),
	FOREIGN KEY (author) REFERENCES authors (author),
	FOREIGN KEY (book_type) REFERENCES book_type (book_type),
	FOREIGN KEY (weeks_on_list) REFERENCES ranking (weeks_on_list)
);
	