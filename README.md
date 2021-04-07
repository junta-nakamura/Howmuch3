# アプリ名
## How much

# 概要
ITエンジニアと企業を結びつけるマッチングサービスです。<br>
既存サービスのような「企業側が掲示した案件にITエンジニアが応募」というフローとは逆で、
ITエンジニアが開発したアプリケーションに対し企業側から権利の購入や共同開発の提案をしたり、直接スカウトができる新しい形のプラットフォームです。

# 制作背景
ITエンジニアは、アイデアとPC1台で世の中を変えることができる可能性を持っています。<br>
しかし、どのようにして世間に発信したら良いのか分からなかったり、自身でサービスを運営していくことを考えると、一歩踏み出すまでのハードルが高いように思います。<br>
アイデアを自由に発信できる場があれば、もっと革新的なサービスが生まれると考え、このアプリケーションを制作するに至りました。

# DEMO
### トップページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 04 32" src="https://user-images.githubusercontent.com/79129848/113792331-a1bc1c80-9780-11eb-910b-b2564d332b8b.png">
deviseを用いてユーザーをエンジニアと企業の2つに分けています。<br>
新規登録後、もしくはログイン後に遷移するページを指定するため、deviseのルーティングやコントローラーもアレンジしています。
<br>
<br>
<br>

### 投稿一覧ページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 34 05" src="https://user-images.githubusercontent.com/79129848/113794322-3d4f8c00-9785-11eb-9a84-09c72c576d82.png">
アプリケーションのDEMO画像、販売を目的としているかどうか、販売を目的としている場合はその価格、ユーザー名、タイトル、概要の一部を表示しています。
<br>
<br>
<br>

### 投稿検索機能
<img width="1680" alt="スクリーンショット 2021-04-07 9 34 59" src="https://user-images.githubusercontent.com/79129848/113794337-450f3080-9785-11eb-875f-4a15548916b3.png">
検索対象をユーザーとポートフォリオで分け、検索対象によって検索項目が変動するようにしています。<br>
デフォルトでは検索フォームは表示せず、ボタンを押下することでjQueryが発火し、上から検索フォームが降りてくるようにしています。<br>
また、ラジオボックスの選択内容によって入力項目を制御しています。
<br>
<br>
<br>

### 投稿詳細ページ
<img width="1677" alt="スクリーンショット 2021-04-07 10 22 50" src="https://user-images.githubusercontent.com/79129848/113797454-43953680-978c-11eb-8aea-72ce3caa0b89.png">
<br>
<br>
<br>

### ユーザー詳細ページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 38 51" src="https://user-images.githubusercontent.com/79129848/113794362-548e7980-9785-11eb-9948-85e789cf9f72.png">
「DMを送る」ボタンを押下した際、同一の組み合わせのチャットルームがないか確認し、なければ新規でチャットルームを作成します。
<br>
<br>
<br>

### チャットルーム
<img width="1674" alt="スクリーンショット 2021-04-07 11 58 25" src="https://user-images.githubusercontent.com/79129848/113804047-b3112300-9798-11eb-97ef-e7da225894a2.png">
画面左のチャットルーム一覧には、各チャットルームごとに最新のメッセージや日時が表示されます。

# 工夫した点
ユーザーをエンジニア側と企業側で分け、機能を完全に切り分けたことです。<br>
特にエンジニアの機能を絞ることで、本アプリケーションの運用にかかる労務コストを最小限に留めることができると考えました。<br>
他のユーザーとの接点がなく、他者からの評価を気にしない自由な発信の場としています。<br>
また、ユーザー同士のトラブルが発生することもありません。

加えて、マッチングの過程でサービスから離脱することを前提としている点も工夫したポイントです。<br>
プラットフォームビジネスは、サービスを介してユーザー同士をマッチングさせ、発生したコストの一部を手数料とすることで収益化していることが多いかと思います。<br>
しかし、このアプリケーションの目的は、エンジニアと企業のマッチングによる'可能性'を創出することです。<br>
余計なことは考えず、純粋にそのサービスの価値を最大限に高めることができる場を提供できればと思いこのようなビジネスモデルにしました。

# 使用技術（開発環境）

### バックエンド
Ruby,Ruby on Rails

### フロントエンド
HTML,CSS,JavaScript,jQuery

### データベース
MySQL

### ソース管理
GitHub,GitHubDesktop

### テスト
RSpec

### エディタ
VSCode

### 今後実装したい機能
- チャットの非同期通信
- 画像のプレビュー機能
- 画像の複数投稿、複数表示機能
- 通知機能

# DB設計

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

### Association

- has_many :rooms
- has_many :messages


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

### Association

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

### Association

- belongs_to :user
- belongs_to :company
- belongs_to :room




