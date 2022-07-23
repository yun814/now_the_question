# アプリケーション名
Now The Question

# アプリケーション概要
ユーザー同士でクイズを出し合い、楽しむことができる。  
正解率やいいね獲得数のランキングで競い合うことができる。

# URL
https://now-the-question.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード：2222
- Basic認証ID：admin
- メールアドレス：test@test
- パスワード：123456

# 利用方法
## クイズ集新規作成
1. トップページ（クイズ集一覧ページ）のヘッダーからユーザー新規登録またはログインを行う
2. トップページのヘッダーの「クイズ集を作成」ボタンからクイズ集作成画面へ遷移する
3. タイトル、ジャンル、詳細説明を入力し、新規作成を押す

## クイズ追加・編集・削除
1. 作成したクイズ集の詳細画面（新規作成時は自動で遷移）の「次のクイズを追加する」の問題文、選択肢１、選択肢２、選択肢３、選択肢４、正解を入力しクイズを追加を押す
2. クイズの編集が必要な場合は、編集したいクイズの欄内の編集を押す
3. 問題文、選択肢１、選択肢２、選択肢３、選択肢４、正解のうち必要な箇所を編集し、更新するを押す
4. クイズの削除が必要な場合は、削除したいクイズの欄内の削除を押す
5. 確認ダイアログが出るので、OKを押すと削除され、キャンセルを押すと削除がキャンセルされる

## クイズを解く
1. 他のユーザーが作成したクイズ集のタイトルをクリックし詳細画面へ遷移する
2. 「クイズに挑戦」ボタンを押す
3. 各クイズの選択肢をクリックして解答して、最後に解答終了ボタンを押す
4. 結果表示画面に遷移し、挑戦回数、正回数、正解率が表示される
5. クイズ集が気に入ったらいいねボタンを押していいねができる（再度押すといいねを解除できる）
6. コメント欄のテキストを入力し、送信ボタンを押すとコメントできる（コメント投稿者のみ削除が可能）
7. 「正解を確認する」をクリックするとクイズの正解が表示される

# アプリケーションを作成した背景
クイズが好きな人が、自作のクイズを公開して他ユーザーに解いてもらう。逆に、他ユーザーが公開したクイズを自分が解くことで、友人と問題を出し合う感覚をオンライン上で手軽に味合い楽しむことができるように、クイズ投稿アプリケーションを開発した。  
また、将来的には学習アプリケーションを開発することを目指しており、その練習として「問題に解答する」というコンセプトからクイズという題材を選んだ。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1FjFZSAV6R4gZJtOmv5wjZROX9nFLqSOOxDfVZASlBpI/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
## クイズ集を新規作成する・クイズを追加する
<img src="https://i.gyazo.com/f321ba4b9763a356de547e507840610e.gif" width="45%"> <img src="https://i.gyazo.com/c6f09008d76cf0acbb7044b4390a5f4b.gif" width="45%">
<img src="https://i.gyazo.com/5d11a3e81a82366e1e3449376cc33d04.gif" width="45%"> <img src="https://i.gyazo.com/f9942891487edcc41dcff4954ec2b559.gif" width="45%">

## クイズを解答する・結果の表示
<img src="https://i.gyazo.com/b145e44ad8820a6adafa35b6d4b8f00e.gif" width="45%"> <img src="https://i.gyazo.com/91337078708c412b0ee773f4dae7bdd6.gif" width="45%">
<img src="https://i.gyazo.com/2e257c43eb6c6ed6b95f3ed1fb22f7dc.gif" width="45%">

## いいね機能・コメント機能
<img src="https://i.gyazo.com/87e7bd6ab6d4e82ddf23163a8fbb4ad6.gif" width="45%"> <img src="https://i.gyazo.com/635417403d9e24e729e2aaffe3e1e5a0.gif" width="45%">
<img src="https://i.gyazo.com/97045420524d5e1779b925a680442c55.gif" width="45%">

## ジャンル別に表示する・検索する
<img src="https://i.gyazo.com/cc624f872498d146f1c3f47b76be333e.gif" width="45%"> <img src="https://i.gyazo.com/8556cdfe5c303788011c7785833ed439.gif" width="45%">

## ランキングを見る
<img src="https://i.gyazo.com/ea3070faf158458f24127407e28d520e.gif" width="45%"> <img src="https://i.gyazo.com/021677fedff275b58225341c9c527253.gif" width="45%">
<img src="https://i.gyazo.com/a565f5296ff5b1f8db4542cf922fdeb4.gif" width="45%">

## マイリスト機能
<img src="https://i.gyazo.com/7255ffe14d1b6c29327ec1072ce1927c.gif" width="45%"> <img src="https://i.gyazo.com/7b51921e979631f8e4570a7d889cf620.gif" width="45%">
<img src="https://i.gyazo.com/66dc77be48b58f4ee3defa49a7e34fd3.gif" width="45%"> <img src="https://i.gyazo.com/b22356b7800ba7cc4366ea28aa655a3b.gif" width="45%">
<img src="https://i.gyazo.com/b029e26f261ec4294a2ee46de9965a25.gif" width="45%">

# データベース設計
![ER図](public/images/now_the_question.png)

# 画面遷移図
![画面遷移図](public/images/screen_transition.png)

# 開発環境
- Ruby on Rails
- Ruby
- HTML･CSS
- JavaScript
- Visual Studio Code
- Heroku

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/yun814/now_the_question  
% cd now_the_question  
% bundle install  
% yarn install

# 工夫したポイント
- クイズの追加・編集・削除、コメントの投稿・削除、いいね機能を非同期通信で実装した。また、これらの機能のJavaScriptはjQueryを用いて記述した。
- 画面遷移はユーザーが自然に行えるように意識し、各ページに様々なリンクを表示するようにした。例えば、全てのページのジャンル名は、ジャンル別一覧表示に遷移するリンクにしてある。
- クイズ結果表示画面から解答画面にブラウザバックできないようにしてある。GoogleChromeのみ仕様上フォーカスを当てないでブラウザバックをすると戻れてしまうので、ブラウザバック後に解答終了ボタンを押すと結果が保存されないようにもなっている。