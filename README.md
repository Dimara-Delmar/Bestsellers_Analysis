# New York Times Bestsellers Analysis

## Topic
This project aims to conduct a thorough analysis of the New York Times Best Sellers list. Using machine learning algorithms, SQL databases, Tableau visualizations and more, we hope to be able to predict the outcome of future best selling books based on data garnered from the past. In doing so, we hope to better understand what elements make a book a successful addition to the list. 

### Reasoning
Our group wanted to identify trends over the data, discover any significant recurrences or similarities between the books, and dissect the elements of what makes a book a valuable contender for the New York Times Bestseller list. 

### Description of the Data
The data used in this analysis was sourced from [kaggle.com](https://www.kaggle.com/datasets/dhruvildave/new-york-times-best-sellers?resource=download), it is compilation of data containing all of the books that appeared on the New York Times Best Sellers list between the years 2010 to 2019. The `bestsellers.csv` file will serve as the foundation for our project analysis.

## Questions 
Using the data provided, we will attempt to answer the follow questions:

1) Which types of books are the most popular bestsellers?
2) Are expensive books more likely to become bestsellers compared to affordable ones?  
3) What book was the longest-lasting bestseller on the list?
4) Are there any similarities between these books we can use to predict future bestsellers?

## Communication Protocol
The team will be using Zoom calls and Slack as our primary source of communication. 

## Database
For our database, we will be performing an ETL on `bestsellers.csv`. 

- Extracting the code from the original file after the data has been organized for use (`cleaned_best_seller_code.csv`).
- Transforming the data into three `.csv` files. (`authors.csv, booktype.csv, ranking.csv`).
- Using SQL and PgAdmin to create a database to store our three tables and load the `.csv` files (`finalcode.sql`).
