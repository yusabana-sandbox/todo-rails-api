Todo API 仕様
============

## 概要

TodoアプリケーションのAPIインターフェース仕様


### リクエスト形式

* GETの場合はURIクエリを利用して検索条件をリクエストします。
* GET以外の場合はリクエストボディに `Content-Type: application/json` 形式で条件やパラメータを含めてリクエストします。


### レスポンス形式

* データ形式はJSONを利用します。
* JSONのキー名は スネークケース とします。
* 日付形式は [ISO8601](https://ja.wikipedia.org/wiki/ISO_8601) に準拠します。 (例) 2015-06-12T09:17:45Z


### ステータスコード

* 正常処理
  * `200`, `201`, `204`, 
* 正常以外の処理
  * `400`, `401`, `403`, `404`, `422`, `500`, `503` 


### エラー

未定


### 認証

JWT(Json Web Token)トークンの仕組みを利用してAPIにアクセスします。

#### アクセストークン

* `/user_token` というパスに `username` と `password` をPOSTすることでJWTを発行します。
* その際すでに `username` が存在すればそのユーザとしてトークンを発行します。 `username` が存在しなければユーザを作成しトークンを発行します。
* トークンの発行以外のリクエストはリクエストヘッダまたはクエリにトークンの情報を含めてリクエストが必須です。

* リクエストヘッダに含める場合
  * `Authorization: Bearer ey1NiJ9.eyJeHAiOjE0NzIx.eJwj1-gzvaFP0DU`

* クエリに含める場合
  * `/todos?token=ey1NiJ9.eyJeHAiOjE0NzIx.eJwj1-gzvaFP0DU`

