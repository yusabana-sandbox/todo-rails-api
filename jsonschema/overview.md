Todo API 仕様
============

## 概要

TodoアプリケーションのAPIインターフェース仕様


### リクエスト形式

* GETの場合はURIクエリを利用して検索条件をリクエストします。
* GET以外の場合はリクエストボディに検索条件を埋め込む方式で条件やパラメータを含めてリクエストします。


### レスポンス形式

* データ形式はJSONを利用します。
* JSONのキー名は スネークケース とします。
* 日付形式は [ISO8601](https://ja.wikipedia.org/wiki/ISO_8601) に準拠します。 (例) 2015-06-12T09:17:45Z


### ステータスコード

`200`, `201`, `400`, `401`, `403`, `404`, `422`, `500`, `503` のステータスコードを利用する。


### エラー

未定