### テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               | 
| last_name_kana     | string  | null: false               |  
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many: portfolios
- has_many: messages



## companiesテーブル

| Column             | Type    | Options                   |
|------------------- | ------- |-------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | integer | null: false               |
| company_name       | string  | null: false               |
| company_phone      | integer | null: false               |
| postal_code        | string  | null: false               |
| prefecture_id      | integer | null: false               | 
| municipalities     | string  | null: false               |
| house_number       | string  | null: false               |
| building           | string  |                           |

- has_many: messages



## portfoliosテーブル

| Column         | Type       | Options           |
| -------------- | ------     | ----------------- |
| portfolio_name | string     | null: false       |
| detail         | text       | null: false       |
| type           | string     | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to :user



## messagesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| room           | references | foreign_key: true |
| content        | text       | null: false       |

- belongs_to :user
- belongs_to :room



## company_messagesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| company        | references | foreign_key: true |
| room           | references | foreign_key: true |
| content        | text       | null: false       |

- belongs_to :company
- belongs_to :room
