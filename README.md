# アプリ名
## 🌐How much
自身のアイデアに果たして<b>どのくらい価値</b>があるのかという投げかけと、ITエンジニアと企業の<b>マッチング</b>という2つの意味を持つ
# 概要
### ITエンジニアの制作物に対し、権利購入や共同開発の提案をする新しいプラットフォーム<br>
既存サービスのような<b>「企業側が掲示した案件にITエンジニアが応募」</b>というフローとは逆で、<b>「ITエンジニアに対し企業側からアプローチをかける」</b>というフロー。<br>
<br>
ITエンジニアは制作物を投稿し、後は企業からのアプローチを待つのみ。<br>
企業側は気になる制作物があれば制作者とコンタクトをとり、権利購入や共同開発などの提案をする。

# 制作背景
### アイデアを自由に発信できる場があれば、もっと革新的なサービスが生まれるのではないか<br>
ITエンジニアは、アイデアとPC1台で世の中を変えることができる可能性を持ってる。<br>
しかし、どのようにして世間に発信したら良いのか分からなかったり、自身でサービスを運営していくことを考えると、一歩踏み出すまでのハードルが高いように思う。<br>
<br>
一方世の中の企業は、自社サービスの価値を高めるために日々奮闘している。<br>
<b>「新しいアイデアを取り入れたい」「自身のアイデアで勝負してみたい」</b>という需要と供給のマッチングにより、世の中をより便利に変えるサービスが生まれるのではないかと思う。<br>
そんな場を提供したいと思い、本アプリケーション作成に至る。

# DEMO
### トップページ
<img width="1680" alt="スクリーンショット 2021-04-07 9 04 32" src="https://user-images.githubusercontent.com/79129848/113792331-a1bc1c80-9780-11eb-910b-b2564d332b8b.png">
deviseを用いてユーザーを<b>「ITエンジニア」</b>と<b>「企業」</b>の2つに分けている。<br>
新規登録後、もしくはログイン後に遷移するページを指定するため、deviseのルーティングやコントローラーもアレンジしている。
<br>
<br>
<br>

### 投稿一覧ページ
![README1](https://user-images.githubusercontent.com/79129848/113881742-ac65c880-97f7-11eb-8df8-48bb262dd6d7.gif)
- アプリケーションのDEMO画像
- ユーザー名
- タイトル
- 概要の一部
- 販売の有無や価格
<br>
上記を表示<br>
企業側のみ閲覧可能。
<br>
<br>
<br>

### 投稿検索機能
![README2](https://user-images.githubusercontent.com/79129848/113885632-f308f200-97fa-11eb-96c8-9414cf196be9.gif)
デフォルトでは検索フォームは表示せず、ボタンを押下することでjQueryが発火し、画面上部から検索フォームが降りてくる仕様。<br>
検索対象をユーザーとポートフォリオで分け、検索対象によって検索項目が変動。<br>
指定したい項目のみ入力することで検索が可能。<br>
また、ラジオボックスの選択内容によって入力項目を制御。
<br>
<br>
<br>

### 投稿詳細ページ
<img width="1677" alt="スクリーンショット 2021-04-07 10 22 50" src="https://user-images.githubusercontent.com/79129848/113797454-43953680-978c-11eb-8aea-72ce3caa0b89.png">
投稿者本人のみ編集と削除が可能
<br>
<br>
<br>

### ユーザー詳細ページ
![README3](https://user-images.githubusercontent.com/79129848/113889187-f0f46280-97fd-11eb-9970-9c4802cb6bbf.gif)
「DMを送る」ボタンを押下した際、同一の組み合わせのチャットルームがないか確認し、なければ新規でチャットルームを作成。<br>
既存の場合はチャットルームに遷移。
<br>
<br>
<br>

### チャットルーム
<img width="1674" alt="スクリーンショット 2021-04-07 11 58 25" src="https://user-images.githubusercontent.com/79129848/113804047-b3112300-9798-11eb-97ef-e7da225894a2.png">
画面左のチャットルーム一覧には、各チャットルームごとに最新のメッセージや日時を表示。<br>
画面上部のユーザー名や相手のアイコンを押下すると、相手の詳細ページに遷移。

# 工夫した点
### エンジニア側と企業側で機能を完全に切り分け<br>
特にエンジニアの機能を絞ることで、本アプリケーションの運用にかかる労務コストを最小限に留めることができると考えた。<br>
他のユーザーとの接点がなく、他者からの評価を気にしない自由な発信の場としている。<br>
また、ユーザー同士のトラブルが発生することもない。

### マッチングの過程でサービスから離脱することを前提としている<br>
プラットフォームビジネスは、サービスを介してユーザー同士をマッチングさせ、発生したコストの一部を手数料とすることで収益化していることが多い。<br>
しかし、このアプリケーションの目的は、<b>エンジニアと企業のマッチングによる"可能性"を創出すること</b>である。<br>
一人ひとりから発信されたサービスの中身のみが判断基準となる場を提供できればと思い、このようなビジネスモデルに至る。

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




