# アプリ名
## 🌐 How much
自身のアイデアに果たして<b>どのくらい価値</b>があるのかという投げかけと、ITエンジニアと企業の<b>マッチング</b>という2つの意味を持つ
# 概要
### ITエンジニアの制作物に対し、権利購入や共同開発の提案をする新しいプラットフォーム<br>
既存サービスのような<b>「企業側が掲示した案件にITエンジニアが応募」</b>というフローとは逆で、<b>「ITエンジニアに対し企業側からアプローチをかける」</b>というフロー。<br>
<br>
ITエンジニアは制作物を投稿し、後は企業からのアプローチを待つのみ。<br>
企業側は気になる制作物があれば制作者とコンタクトをとり、権利購入や共同開発などの提案をする。

# App URL
https://howmuch3.herokuapp.com/

# テスト用アカウント
### ITエンジニア
ID:test@test<br>
PW:test1234

### 企業
ID:test@test<br>
PW:test1234

# 利用方法
### ITエンジニア
- トップページから新規登録
- 新規投稿ページに遷移し制作物を投稿
<br>

- トップページからログイン
- マイページに遷移
- 新規投稿画面に遷移し制作物を投稿

### 企業
- トップページから新規登録/ログイン
- 投稿一覧を閲覧
- 検索機能を駆使し、気になるユーザーもしくは投稿を見つける
- ユーザーにDMを送信

# 制作背景
### アイデアを自由に発信できる場があれば、もっと革新的なサービスが生まれるのではないか<br>
ITエンジニアは、アイデアとPC1台で世の中を変えることができる可能性を持っている。<br>
しかし、どのようにして世間に発信したら良いのか分からなかったり、自身でサービスを運営していくことを考えると、一歩踏み出すまでのハードルが高いように思う。<br>
一方世の中の企業は、自社サービスの価値を高めるために日々新しいアイデアを出し合い奮闘している。<br>
<br>
上記のような<b>「新しいアイデアを取り入れたい」「自身のアイデアで勝負してみたい」</b>という需要と供給のマッチングにより、世の中をより便利に変えるサービスが生まれるのではないかと思う。<br>
そんな場を提供したいと思い、本アプリケーション作成に至る。

# 課題解決
### ITエンジニア視点
|            ユーザーストーリーから考える課題              |                      解決策                                   |
| -------------------------------------------------- | ------------------------------------------------------------ |
| オリジナルアプリ開発後の発信・運営フローが分からない        | 知見・資本のある「法人」とのマッチングができるようDM機能を実装         |
| 世に発信できるほどのクオリティである自信がない             | 他のユーザーの投稿を閲覧できないよう設計                            |
| 成約の確度が低いことに時間をかけたくない                  | 新規チャットルーム作成は企業側のみ可能とし、DMが送付された場合のみ対応 |

### 企業視点
|            ユーザーストーリーから考える課題             |                      解決策                                               |
| ------------------------------------------------- | ------------------------------------------------------------------------- |
| 自社サービスを改善するために必要なものを取り入れたい       | ITエンジニアとコンタクトがとれるようDM機能を実装                                 |
| エンジニアの作品を見た上でをダイレクトリクルーティングしたい | 検索機能において検索対象や検索項目の指定が可能                                   |

# DEMO
### トップページ
<img width="1678" alt="スクリーンショット 2021-04-08 14 33 00" src="https://user-images.githubusercontent.com/79129848/113973509-681a0d00-9877-11eb-9181-44ea212b5d0d.png">
deviseを用いてユーザーを<b>「ITエンジニア」</b>と<b>「企業」</b>に分別。<br>
企業とITエンジニアで機能が異なり、ITエンジニア側の機能はあえて制限。<br>
新規登録後、もしくはログイン後に遷移するページを指定するため、deviseのルーティングやコントローラーをアレンジ。
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
上記を表示。<br>
企業側のみ閲覧可能。
<br>
<br>
<br>

### 投稿検索機能
![README2](https://user-images.githubusercontent.com/79129848/113885632-f308f200-97fa-11eb-96c8-9414cf196be9.gif)
デフォルトでは検索フォームは表示せず、ボタンを押下することでjQueryが発火し、画面上部から検索フォームが降下。<br>
検索対象をユーザーとポートフォリオで分け、<b>検索対象によって検索項目が変動。</b><br>
指定したい項目のみの入力で検索が可能。<br>
また、ラジオボックスの<b>選択内容によって入力項目を制御。</b>
<br>
<br>
<br>

### 投稿詳細ページ
<img width="1678" alt="スクリーンショット 2021-04-08 11 44 18" src="https://user-images.githubusercontent.com/79129848/113960732-dce14d00-985f-11eb-8927-02f66932bbf4.png">
投稿者本人のみ編集と削除が可能。<br>
企業側がログインしている場合、編集削除ボタンの代わりに投稿者詳細ページに遷移できるボタンを設置。
<br>
<br>
<br>

### ユーザー詳細ページ
![README3](https://user-images.githubusercontent.com/79129848/113889187-f0f46280-97fd-11eb-9970-9c4802cb6bbf.gif)
「DMを送る」ボタンを押下した際、同一の組み合わせのチャットルームがないか確認し、なければ新規でチャットルームを作成。<br>
既存の場合は既にやりとりをしているチャットルームに遷移。
<br>
<br>
<br>

### チャットルーム
![README4](https://user-images.githubusercontent.com/79129848/113962179-22067e80-9862-11eb-9a48-39e4aa6cad60.gif)
画面左のチャットルーム一覧には、各チャットルームごとに最新のメッセージや日時を表示。<br>
画面上部のユーザー名や相手のアイコンを押下すると、相手の詳細ページに遷移。

# 工夫した点
### ①エンジニア側と企業側で機能を完全に切り分け<br>
特にエンジニアの機能を絞ることで、本アプリケーションの運用にかかる労務コストを最小限に留めることができると考えた。<br>
他のユーザーとの接点がなく、他者からの評価を気にしない自由な発信の場としている。<br>
また、ユーザー同士のトラブルが発生することもない。

### ②マッチングの過程でサービスから離脱することを前提としている<br>
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


## messagesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| content        | text       | null: false       |
| user           | references | foreign_key: true |
| company        | references | foreign_key: true |
| room           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :company
- belongs_to :room



# ローカルでの動作方法
% git clone https://github.com/junta-nakamura/Howmuch3.git<br>
% cd Howmuch3<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate<br>
<br>
http://localhost:3000/
