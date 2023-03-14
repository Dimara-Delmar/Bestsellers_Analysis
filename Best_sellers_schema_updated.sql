-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sH3dM3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "clean_bestsellers" (
    "published_date" date   NOT NULL,
    "book_type" varchar(100)   NOT NULL,
    "rank" int   NOT NULL,
    "title" varchar(100)   NOT NULL,
    "author" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "price" int   NOT NULL,
    "weeks_on_list" int   NOT NULL,
    CONSTRAINT "pk_clean_bestsellers" PRIMARY KEY (
        "published_date"
     )
);

CREATE TABLE "authors" (
    "title" varchar(100)   NOT NULL,
    "author" varchar(100)   NOT NULL,
    CONSTRAINT "pk_authors" PRIMARY KEY (
        "title","author"
     )
);

CREATE TABLE "book_type" (
    "book_type" varchar(100)   NOT NULL,
    "title" varchar(100)   NOT NULL,
    CONSTRAINT "pk_book_type" PRIMARY KEY (
        "book_type"
     )
);

CREATE TABLE "ranking" (
    "rank" int   NOT NULL,
    "title" varchar(1000)   NOT NULL,
    "author" varchar(100)   NOT NULL,
    "weeks_on_list" int   NOT NULL,
    CONSTRAINT "pk_ranking" PRIMARY KEY (
        "rank"
     )
);

ALTER TABLE "clean_bestsellers" ADD CONSTRAINT "fk_clean_bestsellers_book_type" FOREIGN KEY("book_type")
REFERENCES "book_type" ("book_type");

ALTER TABLE "clean_bestsellers" ADD CONSTRAINT "fk_clean_bestsellers_rank" FOREIGN KEY("rank")
REFERENCES "ranking" ("rank");

