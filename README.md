Todo Apps
=======

![circleci build status](https://circleci.com/gh/yusabana/todo-rails.svg?style=shield&circle-token=cadc9aaaefbf25ba57033583b2b7f724be153b92)

Todo API (Rails5)
------

### System dependencies

* Ruby 2.3 以上
* PostgreSQL9.4 以上

### Application setup

```
% bundle install
% cp config/database.yml.base config/database.yml
% bundle exec rails db:create
% bundle exec rails db:migrate
```

### Run Test

```
% bundle exec rails spec
```

### Run API Server

```
% bundle exec rails server
```

TEST of Curl. Please read following documents.
[API Documents](https://github.com/yusabana/todo-rails/blob/master/jsonschema/dist/schema.md)

### JSON Schema

#### API Document by generated JSON Schema

* API Document URL  
https://github.com/yusabana/todo-rails/blob/master/jsonschema/dist/schema.md

* API Document for generating

```
% cd jsonschema/api/ && sh build.sh
```

#### Run API Stub Server with committee

```
% bundle exec committee -p <port> jsonschema/dist/schema.json
```

ex. `% curl -X GET http://localhost:<port>/todos`

### jwt(using gem of knock)

* Gemfileでbcryptを有効にする
* Userモデルを作成していることが前提(password_digest込み)

```
% bundle exec rails g knock:install
% bundle exec rails g knock:token_controller user # Auth0などの外部認証サービスを使わない場合のsigninする機能を追加
```

paramsかHEADERにつけることで token をつけることで返す

### History of my doing command (memo)

```
% bundle exec rails new todo-rails --api --skip-bundle -d postgresql
% bundle exec rails g scaffold todo title:string body:text -p
% bundle exec rails g model user username:string password_digest:string
```
