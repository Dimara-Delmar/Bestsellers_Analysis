# New York Times Bestsellers Analysis

## Topic
This project aims to conduct a thorough analysis of the New York Times Best Sellers list. Using machine learning algorithms, SQL databases, Tableau visualizations and more, we hope to be able to predict the outcome of future bestselling books based on data garnered from the past. In doing so, we hope to better understand what elements make a book a successful addition to the list. 

### Reasoning
Our group wanted to identify trends over the data, discover any significant recurrences or similarities between the books, and dissect the elements of what makes a book a valuable contender for the New York Times Bestseller list. 

### Description of the Data
The data used in this analysis was sourced from [kaggle.com](https://www.kaggle.com/datasets/dhruvildave/new-york-times-best-sellers?resource=download), it is compilation of data containing all of the books that appeared on the New York Times Best Sellers list between the years 2010 to 2019. The `bestsellers.csv` file will serve as the foundation for our project analysis.

## Resources
- Data Source: `bestsellers.csv`
- Software Used: SQL, PgAdmin, Python, Jupyter Notebook, VSCode and Tableau Public

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

The dataframe created is based on the outline of this entity relationship diagram (ERD):

![bestellers_schema_updated](https://user-images.githubusercontent.com/108738297/224867125-b6cb5c99-af4b-49af-8f5a-c31eb4d35003.png)

## Machine Learning Model (First Attempt)
For this project, we have decided to create a Classification model using BalancedRandomForestClassifier to determine if we could predict a book's eligibility of being on the NYT's Best Seller list based on the type of book it is (`bestsellers_classification.ipynb`). To attempt this, we set our features to the columns: "published_date", "rank", "title", "author", "description", "price", "weeks_on_list". 

And we set our target to "book_type".

<img width="486" alt="bestsellers_split" src="https://user-images.githubusercontent.com/108738297/224436048-3ae6cf49-80a7-45fd-b9b6-b0dcabd630d5.PNG">

### Results

Resampling the data with the BalancedRandomForestClassifier, we were able to assess the current model's accuracy, precision, and recall ability, as well as produce a confusion matrix for the data.

**Confusion matrix:**

<img width="310" alt="bestsellers_matrix" src="https://user-images.githubusercontent.com/108738297/224436009-10519ba2-b1d6-43ce-b78b-0122d0fc946f.PNG">

**Balanced accuracy score: 75%**

<img width="231" alt="bestsellers_accuracy" src="https://user-images.githubusercontent.com/108738297/224435986-87694186-d295-4a75-ac88-ee0ff8a04811.PNG">

**Imbalanced classification report:**

<img width="459" alt="bestsellers_class" src="https://user-images.githubusercontent.com/108738297/224435969-60b27df7-1389-4b37-88c9-ae95fa5df07c.PNG">

**The categories with the highest precision scores:**

Games and Activities
- Precision: 100%
- Recall: 100%

Picture books
- Precision: 98%
- Recall: 55%

Series books
- Precision: 98%
- Recall: 79%

**The categories with the highest recall scores:**

Games and Activities
- Precision: 100%
- Recall: 100%

Graphic books and Manga
- Precision: 78%
- Recall: 100%

**The categories with the highest F1 balance:**

Games and Activities
- Precision: 100%
- Recall: 100%
- F1: 100%

Indigenous Americans
- Precision: 86%
- Recall: 100%
- F1: 93%

As the current model stands, its major flaw is its inability to predict the likelihood of *future* bestselling books, as it is only capable of predicting the book's category based on the data provided. The current model is only assessing data against itself since there is no new data being introduced to compare it to non-best sellers. To fix this, we might have to create a new DataFrame that compares the model’s predicted outcome to the original data or introduce new data to compare the two. Regardless, as it stands, the model can most accurately and consistently predict if a book falls under the Games and Activities category, with a 100% precision, recall and f1 balance.  

## Machine Learning Model (Second Attempt)
To address some of the problems we had with the first model, we created a second learning model that could predict a different aspect of the data. The second model (`BestSellerMachineLearning.ipynb`) will be trained to predict how long a book might last on the bestsellers list, based on how many weeks previous books were listed.

To accomplish this, we continued using the BalancedRandomForestClassifier with some differences. The “weeks_on_List” column needed to be sorted into bins based on week duration:

- 0-4 weeks
- 5-15 weeks
- 16-25 weeks
- 26-55 weeks
- 56-610 weeks 

<img width="553" alt="machine_2_bins" src="https://user-images.githubusercontent.com/108738297/224866983-83b94882-7746-4f1f-a5d3-1b8fdb0435c1.PNG">

### Results
Running the second machine learning model, we produced the following confusion matrix, accuracy score, and classification report to reflect the results of our new target.

**Confusion matrix:**

<img width="464" alt="machine_2_class" src="https://user-images.githubusercontent.com/108738297/224867229-31dd19dd-a2a2-414b-a186-e757630e9c19.PNG">

**Balanced accuracy score: 70%**

<img width="225" alt="machine_2_accuracy" src="https://user-images.githubusercontent.com/108738297/224867354-9011c2c7-f10c-4ad7-8ec8-e220894431cc.PNG">

**Imbalanced classification report:**

<img width="464" alt="machine_2_class" src="https://user-images.githubusercontent.com/108738297/224867455-acdd7274-42e5-4d06-a994-649947f9b3b9.PNG">

**The weeks with the highest precision scores:**

0-4 Weeks
- Precision: 97%
- Recall: 74%

56-610 Weeks
- Precision: 87%
- Recall: 87%

**The weeks with the highest recall scores:**

0-4 Weeks
- Precision: 97%
- Recall: 74%

56-610 Weeks
- Precision: 87%
- Recall: 87%

**The categories with the highest F1 balance:**

 0-4 Weeks
- Precision: 97%
- Recall: 74%
- F1: 84%

56-610 Weeks
- Precision: 87%
- Recall: 87%
- F1: 87%

The second model can most accurately predict whether a book has lasted only a few weeks on the bestsellers list (0-4 weeks) or has lasted an exceptionally *long* time on the list (56-610 weeks). Its precision, accuracy, and recall scores for all the weeks in between have some room for improvement. Overall, binning the weeks into digestible categories has helped organize the data into distinct timeframes, so that the learning model did not need to process every integer in the ”weeks_on_list” category independently. 

## Visualizations

### [Link to Tableau](https://public.tableau.com/app/profile/aashutosh.pyakuryal/viz/BestsellersBreakdown/BestsellersBreakdown?publish=yes)

## Presentation

### [Link to Google Slides](https://docs.google.com/presentation/d/1dyjed3YYMClTXttfVzyAxq67QYXSy0ypOncNIw6f8_k/edit?usp=sharing)
