![エフー！知恵袋](https://i.gyazo.com/2227d0e090f13a2ae60c6bc0e97d0ca0.png)

## アプリケーション概要
エフー知恵袋はF1の動画でわからない英語を質問するとアプリ開発者がレースの状況をもとに内容を推測し、適切な日本語訳の案を提供するサービスです。

## 開発環境
* Ruby(Ruby on Rails)
* Javascript
* Bootstrap
* AWS

## アプリ機能
### １、質問と回答の閲覧
![質問と回答の閲覧](https://i.gyazo.com/9c042315f29059445c1310dd05598c0b.png)
未ログインユーザーでも質問と回答の閲覧をすることができます。

### ２、質問の投稿
![質問の投稿](https://i.gyazo.com/cb8108a5a18613c9b43782034c4cbe6a.png)
ログインしているユーザーは質問をすることができます。

### ３、回答の投稿(現在は管理者のみが回答できる仕様)
![回答の投稿](https://i.gyazo.com/135f031fe284d42f1e433d6d5e76d691.png)
管理者(user_idが1のユーザー)のみが回答の登録ページにアクセスすることができます。

### ４、質問と回答に対するリアクション機能
![リアクション機能](https://i.gyazo.com/f6602e4305cb47b71414c2374cbf60d8.png)
質問には「共感した！」ボタン、回答には「役に立った！」ボタンでリアクションすることができます。
これらは非同期通信でデータベースにリアクションの情報が保存されます。
![リアクション後](https://i.gyazo.com/492785469db477809b3459131102b39a.png)
一度ボタンを押すとボタンが無効化し、ブラウザをリロードすると取り消すボタンが現れます。
![リロード後](https://i.gyazo.com/1302ec71dff4fbf23554c2aa4345784f.png)

### ５、コメント機能
![コメント機能](https://i.gyazo.com/da718ea8ff98a2ce6019c801f3aca1b9.gif)
ログインユーザーはすべての質問に対してコメントをすることができます。
こちらも非同期通信で実装されています。

## このアプリを開発した背景にあるF1への課題意識
F1ドライバーがレース中に発言する英語を私は「F1英語」と読んでいます。
F1英語の特徴として、その録音される音声にはエンジンノイズやドライバーの荒い呼吸が含まれており、聞き取りが困難という特徴があります。
また300km以上で運転中という極限状態での発言はとても短調になりやすく、意味を理解するにはレース状況を鑑みて意訳を推測をする必要があります。
このようにF1を楽しみにくいという課題に対して、F1観戦歴6年、1年の留学経験のあるアプリ開発者が英語の内容を推測し、回答するサービスを開発しました。
このサービスによって多くの人がF1英語に親しみ、日本のF1が盛り上がることを願っています。


## 以下テーブル情報

### users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

#### Association
* has_many :answers
* has_many :questions

### questions テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| url      | string     | null: false                    |
| time     | string     | null: false                    |
| text     | string     | null: false                    |
| category | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* has_many :answers

### answers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* belongs_to :question

### likes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* belongs_to :question

### favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| answer   | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* belongs_to :answer

### comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* belongs_to :question