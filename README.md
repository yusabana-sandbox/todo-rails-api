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

TEST of curl

```
List
% curl http://localhost:3000/todos

Self Detail
% curl http://localhost:3000/:id

Create
% curl -XPOST -d 'title=TITLE_TEST&body=BODY_TEST' http://localhost:3000/todos

Update
% curl -XPATCH -d 'title=TITLE_UPDATE&body=BODY_UPDATE' http://localhost:3000/todos/:id

Delete
% curl -XDELETE http://localhost:3000/todos/:id
```

### JSON Schema

#### API Document by generated JSON Schema

* API Document URL  
https://github.com/yusabana/todo-rails/blob/master/jsonschema/dist/schema.md

* API Document For generating.

```
% cd jsonschema/api/ && sh build.sh
```

### History of my doing command (memo)

```
% bundle exec rails new todo-rails --api --skip-bundle -d postgresql
% bundle exec rails g scaffold todo title:string body:text -p
```
