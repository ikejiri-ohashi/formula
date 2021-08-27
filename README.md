![エフー！知恵袋](https://i.gyazo.com/2227d0e090f13a2ae60c6bc0e97d0ca0.png)

## :checkered_flag:アプリケーション概要
エフー知恵袋はF1の動画でわからない英語を質問するとアプリ開発者がレースの状況をもとに内容を推測し、適切な日本語訳の案を提供するサービスです。

## :checkered_flag:開発環境
* Ruby(Ruby on Rails)
* Javascript
* Bootstrap
* AWS

## :checkered_flag:アプリ機能
### :pencil2:１、質問と回答の閲覧
![質問と回答の閲覧](https://i.gyazo.com/7ee0ac4644605b8280197cc9a6fe21de.gif)
未ログインユーザーでも質問と回答の閲覧をすることができます。

### :pencil2:２、質問の投稿
![質問の投稿](https://i.gyazo.com/d914b41ef5a241e16cd2141cc57e2ceb.gif)
ログインしているユーザーは質問をすることができます。

### :pencil2:３、回答の投稿(現在は管理者のみが回答できる仕様)
![回答の投稿](https://i.gyazo.com/d35f8d75d79b0cd4c29513aed02220b3.gif)
管理者(user_idが1のユーザー)のみが回答の登録ページにアクセスすることができます。

### :pencil2:４、質問と回答に対するリアクション機能
![リアクション機能](https://i.gyazo.com/9eec8878a3b2f6fe6c0d0171fae60f98.gif)
質問には「共感した！」ボタン、回答には「役に立った！」ボタンでリアクションすることができます。

一度ボタンを押すとボタンが無効化し、ブラウザをリロードすると取り消すボタンが現れます。
![リロード後](https://i.gyazo.com/aa06dbadf8b7f605711fd80f8650fb8e.gif)

### :pencil2:５、コメント機能
![コメント機能](https://i.gyazo.com/da718ea8ff98a2ce6019c801f3aca1b9.gif)
ログインユーザーはすべての質問に対してコメントをすることができます。
こちらも非同期通信で実装されています。

## :checkered_flag:このアプリを開発した背景にあるF1への課題意識
F1ドライバーがレース中に発言する英語を私は「F1英語」と読んでいます。<br>
F1英語の特徴として、その録音される音声にはエンジンノイズやドライバーの荒い呼吸が含まれており、聞き取りが困難という特徴があります。
<br>
また300km以上で運転中という極限状態での発言はとても短調になりやすく、意味を理解するにはレース状況を鑑みて意訳を推測をする必要があります。
このようにF1を楽しみにくいという課題に対して、F1観戦歴6年、1年の留学経験のあるアプリ開発者が英語の内容を推測し、回答するサービスを開発しました。
<br>
このサービスによって多くの人がF1英語に親しみ、日本のF1が盛り上がることを願っています。


<details><summary>テーブル情報</summary><div>

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

</div></details>