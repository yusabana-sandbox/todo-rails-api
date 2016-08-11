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

## <a name="resource-todo"></a>Todo

Todo リソース

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body** | *string* | 内容 | `"内容 サンプル"` |
| **created_at** | *date-time* | when todo was created | `"2015-01-01T12:00:00Z"` |
| **id** | *integer* | ユニークなID | `42` |
| **title** | *string* | タイトル | `"タイトル サンプル"` |
| **updated_at** | *date-time* | when todo was updated | `"2015-01-01T12:00:00Z"` |

### Todo 一覧

Todoの内容をすべて取得する。

```
GET /todos
```


#### Curl Example

```bash
$ curl -n https://hoge.example.com/todos
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "todos": [
    {
      "id": 42,
      "title": "タイトル サンプル",
      "body": "内容 サンプル",
      "created_at": "2015-01-01T12:00:00Z",
      "updated_at": "2015-01-01T12:00:00Z"
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
$ curl -n https://hoge.example.com/todos/$TODO_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 42,
  "title": "タイトル サンプル",
  "body": "内容 サンプル",
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
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
$ curl -n -X POST https://hoge.example.com/todos \
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
  "id": 42,
  "title": "タイトル サンプル",
  "body": "内容 サンプル",
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Todo 更新

idで指定したTodoの情報を更新する。

```
PATCH /todos/{todo_id}
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
$ curl -n -X PATCH https://hoge.example.com/todos/$TODO_ID \
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
  "id": 42,
  "title": "タイトル サンプル",
  "body": "内容 サンプル",
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Todo Delete

指定したidのTodoを削除する

```
DELETE /todos/{todo_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://hoge.example.com/todos/$TODO_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 42,
  "title": "タイトル サンプル",
  "body": "内容 サンプル",
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


