## Table: game_data

Games available on Steam Store

| Column Name     | Data Type      | Description                                  |
|-----------------|----------------|----------------------------------------------|
| app_id          | integer        | game id                                      |
| title           | varchar(255)   |                                              |
| date_release    | date           |                                              |
| win             | bool           | window support                               |
| mac             | bool           | mac support                                  |
| linux           | bool           | linux support                                |
| rating          | varchar(50)    | rating system; Very positive, positive, ...  |
| positive_ratio  | double prec    | Explanation of what this column represents   |
| user_reviews    | integer        | number of user reviews                       |
| price_final     | numeric(10,2)  | price after discount                         |
| price_original  | numeric(10,2)  |                                              |
| discount        | numeric(10,2)  | in percentage                                |
| steam_deck      | varchar(50)    | steam_deck support                           |


## Table: users_data

| Column Name | Data Type | Description                           |
|-------------|-----------|---------------------------------------|
| user_id     | integer   | user id                               |
| products    | integer   | number of products purchased by user  |
| reviews     | integer   | number of reviews published           |


## Table: reviews

| Column Name     | Data Type      | Description                             |
|-----------------|----------------|-----------------------------------------|
| app_id          | integer        | game id                                 |
| helpful         | integer        | how many users found review helpful     |
| funny           | integer        | how many users found review funny       |
| date            | date           | date review submitted                   |
| is_recommended  | bool           | does user recommend                     |
| hours           | numeric(10,2)  | how many hours users played             |
| user_id         | integer        | user id                                 |
| review_id       | integer        | review id, auto generated, index        |