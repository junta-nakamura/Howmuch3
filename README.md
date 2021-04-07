### アプリ名
How much

### 概要
ITエンジニアと企業を結びつけるマッチングサービスです。
既存サービスのような「企業側が掲示した案件にITエンジニアが応募」というフローとは逆で、
ITエンジニアが開発したアプリケーションに対し企業側から権利の購入や共同開発の提案をしたり、直接スカウトができる新しい形のプラットフォームです。

<!-- よって、ユーザーはエンジニア側と企業側の2つに分かれています。
エンジニアは自身のキャリアとともにアプリケーションを登録し、あとは企業からの連絡を待つのみです。
他のエンジニアの投稿を見ることはできず、機能は限りなくシンプルにしてあります。

一方企業側は、エンジニアやアプリケーションの検索が可能となり、気になったエンジニアに対しDMを送ることが可能です。 -->

### 制作背景
ITエンジニアは、アイデアとPC1台で世の中を変えることができる可能性を持っています。
しかし、どのようにして世間に発信したら良いのか分からなかったり、自身でサービスを運営していくことを考えると、一歩踏み出すまでのハードルが高いように思います。
アイデアを自由に発信できる場があれば、もっと革新的なサービスが生まれると考え、このアプリケーションを制作するに至りました。


### DEMO
# トップページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 04 32" src="https://user-images.githubusercontent.com/79129848/113792331-a1bc1c80-9780-11eb-910b-b2564d332b8b.png">

# 投稿一覧ページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 34 05" src="https://user-images.githubusercontent.com/79129848/113794322-3d4f8c00-9785-11eb-9a84-09c72c576d82.png">

# 投稿検索機能
<img width="1680" alt="スクリーンショット 2021-04-07 9 34 59" src="https://user-images.githubusercontent.com/79129848/113794337-450f3080-9785-11eb-875f-4a15548916b3.png">

# 投稿詳細ページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 33 06" src="https://user-images.githubusercontent.com/79129848/113794294-2d37ac80-9785-11eb-8d40-ed3b02fcc3a9.png">

# ユーザー詳細ページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 38 51" src="https://user-images.githubusercontent.com/79129848/113794362-548e7980-9785-11eb-9948-85e789cf9f72.png">

# チャットルーム
<img width="1676" alt="スクリーンショット 2021-04-07 9 36 02" src="https://user-images.githubusercontent.com/79129848/113794351-4cced500-9785-11eb-993b-87596200a55a.png">


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
| introduction       | text    | null: false               |

### Association

- has_many :portfolios
- has_many :rooms
- has_many :messages



## companiesテーブル

| Column             | Type    | Options                   |
|------------------- | ------- |-------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | integer | null: false               |
| company_name       | string  | null: false               |
| company_phone      | string  | null: false               |
| postal_code        | string  | null: false               |
| prefecture_id      | integer | null: false               | 
| municipalities     | string  | null: false               |
| house_number       | string  | null: false               |
| building           | string  |                           |

- has_many :rooms



## portfoliosテーブル

| Column                  | Type       | Options           |
| ----------------------- | ------     | ----------------- |
| portfolio_name          | string     | null: false       |
| detail                  | text       | null: false       |
| development_language_id | integer    | null: false       |
| business_type_id        | integer    | null: false       |
| sale_type_id            | integer    | null: false       |
| price                   | integer    |                   |
| user                    | references | foreign_key: true |

### Association

- belongs_to :user



## roomsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| company        | references | foreign_key: true |

- belongs_to :user
- belongs_to :company
- has_many :messages


## messagesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| company        | references | foreign_key: true |
| room           | references | foreign_key: true |
| content        | text       | null: false       |

- belongs_to :user
- belongs_to :company
- belongs_to :room




