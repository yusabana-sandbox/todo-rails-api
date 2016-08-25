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


## <a name="resource-todo"></a>Todo

Todo リソース

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body** | *string* | 内容 | `"内容 サンプル"` |
| **id** | *integer* | ユニークなID | `34` |
| **title** | *string* | タイトル | `"タイトル サンプル"` |

### Todo 一覧

Todoの内容をすべて取得する。

```
GET /todos
```


#### Curl Example

```bash
$ curl -n http://localhost:3000/todos
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "todos": [
    {
      "id": 34,
      "title": "タイトル サンプル",
      "body": "内容 サンプル"
    }
  ]
}
```

### Todo 詳細

idで指定したTodoの情報を取得する。

```
GET /todos/{todo_id}
```


#### Curl Example

```bash
$ curl -n http://localhost:3000/todos/$TODO_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "todo": {
    "id": 34,
    "title": "タイトル サンプル",
    "body": "内容 サンプル"
  }
}
```

### Todo 新規作成

リクエストされたタイトルと内容でTodo作成する。

```
POST /todos
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **title** | *string* | タイトル | `"タイトル サンプル"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body** | *string* | 内容 | `"内容 サンプル"` |


#### Curl Example

```bash
$ curl -n -X POST http://localhost:3000/todos \
  -d '{
  "title": "タイトル サンプル",
  "body": "内容 サンプル"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "todo": {
    "id": 34,
    "title": "タイトル サンプル",
    "body": "内容 サンプル"
  }
}
```

### Todo 更新

idで指定したTodoの情報を更新する。

```
PATCH /todos/{todo_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body** | *string* | 内容 | `"内容 サンプル"` |
| **title** | *string* | タイトル | `"タイトル サンプル"` |


#### Curl Example

```bash
$ curl -n -X PATCH http://localhost:3000/todos/$TODO_ID \
  -d '{
  "title": "タイトル サンプル",
  "body": "内容 サンプル"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "todo": {
    "id": 34,
    "title": "タイトル サンプル",
    "body": "内容 サンプル"
  }
}
```

### Todo Delete

指定したidのTodoを削除する

```
DELETE /todos/{todo_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://localhost:3000/todos/$TODO_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 204 No Content
```

```json
No body
```


## <a name="resource-user_token"></a>User Token(JWT)

tokenを発行する

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **jwt** | *string* | Json Web Token | `"eyJ0eXAiOiJKV1QiLCJhbaciOiJIUzI1NiJ9.eyJleHAiOjE0NzIxghlwNDUsInN1eiI6Nn0.eJlwj1-gzvajsX8o-I8YjUuHw-5s8sZ4kzgMR4FP0DU"` |

### User Token(JWT) トークン生成

ユーザが存在すればJWTトークンを生成する、ユーザが存在しなければユーザを作成しJWTトークンを生成する。

```
POST /user_token
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **auth:password** | *string* | パスワード | `"password"` |
| **auth:username** | *string* | ユーザ名 | `"yusabana"` |



#### Curl Example

```bash
$ curl -n -X POST http://localhost:3000/user_token \
  -d '{
  "auth": {
    "username": "yusabana",
    "password": "password"
  }
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "jwt": "eyJ0eXAiOiJKV1QiLCJhbaciOiJIUzI1NiJ9.eyJleHAiOjE0NzIxghlwNDUsInN1eiI6Nn0.eJlwj1-gzvajsX8o-I8YjUuHw-5s8sZ4kzgMR4FP0DU"
}
```


