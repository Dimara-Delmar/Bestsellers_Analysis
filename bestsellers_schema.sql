clean_bestsellers
-
published_date date
book_type varchar(50) FK - book_type.book_type
rank int FK >- ranking.rank
title varchar(50) PK FK >- authors.title
author varchar(50) PK FK >- authors.author
description text
price int
weeks_on_list int FK >- ranking.weeks_on_list

authors
-
title varchar(50) PK
author varchar(50) PK

book_type
-
book_type varchar(50)
title varchar(50) PK FK >- clean_bestsellers.title

ranking
-
rank int
title varchar(50) PK FK >- clean_bestsellers.title
author varchar(50) PK FK >- clean_bestsellers.author
weeks_on_list int