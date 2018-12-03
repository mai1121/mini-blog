## postsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs-to :users

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

### Association

- has_many :posts


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|
|text|string|null: false|


### Association

- belongs-to :users
- belongs-to :posts
