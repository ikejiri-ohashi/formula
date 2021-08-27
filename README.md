![エフー！知恵袋](https://gyazo.com/2227d0e090f13a2ae60c6bc0e97d0ca0)

## アプリケーション概要
エフー知恵袋はF1の動画でわからない英語を質問するとアプリ開発者がレースの状況をもとに内容を推測し、適切な日本語訳の案を提供するサービスです。

## 開発環境
* Ruby(Ruby on Rails)
* Javascript
* Bootstrap
* AWS

## アプリ機能
### １、質問と回答の閲覧
![エフー！知恵袋](https://gyazo.com/ab566a6be9042cdc467cb317f1a48d31)
未ログインユーザーでも質問と回答の閲覧をすることができます。

### ２、質問の投稿
![質問の投稿](https://gyazo.com/6097fdc189634338d99fd02c945d335b)
ログインしているユーザーは質問をすることができます。

### ３、回答の投稿(現在は管理者のみが回答できる仕様)
![回答の投稿](https://gyazo.com/783a37c52a2af0d5cdaf8ac382bf3af8)
管理者(user_idが1のユーザー)のみ回答の登録ページにアクセスすることができます。

### ４、質問と回答に対するリアクション機能
![リアクション機能](https://gyazo.com/1445a3ca89ceb32ac9339bad345e882e)
質問には「共感した！」ボタン、回答には「役に立った！」ボタンでリアクションすることができます。
これらは非同期通信でデータベースにリアクションの情報が保存されます。
![リアクション後](https://gyazo.com/365ed1fa9638d334a925a0cdcc65b97f)
一度ボタンを押すとボタンが無効化し、ブラウザをリロードすると取り消すボタンが現れます。
![リロード後](https://gyazo.com/36ae8833f455416457469492c6209147)

### ５、コメント機能
![コメント機能](https://gyazo.com/d1783dc06b114d609f1aa3901ccc7c74)
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