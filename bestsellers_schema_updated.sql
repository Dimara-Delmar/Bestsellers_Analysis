clean_bestsellers
-
published_date date PK
book_type varchar(100) FK >- book_type.book_type
rank int FK >- ranking.rank
title varchar(100)
author varchar(100) 
description text
price int
weeks_on_list int 

authors
-
title varchar(100) PK
author varchar(100) PK

book_type
-
book_type varchar(100) PK
title varchar(100) 

ranking
-
rank int PK
title varchar(1000) 
author varchar(100) 
weeks_on_list int