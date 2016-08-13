# Todo Apps

![circleci build status](https://circleci.com/gh/yusabana/todo-rails.svg?style=shield&circle-token=cadc9aaaefbf25ba57033583b2b7f724be153b92)

## Todo API

## System dependencies

* Ruby 2.3 or higher.
* PostgreSQL9.5 or higher.


* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions


## Application setup

```
% bundle install
% cp config/database.yml.base config/database.yml
% bundle exec rails db:create
% bundle exec rails db:migrate
```

## JSON Schema

### API Document
https://github.com/yusabana/todo-rails/blob/jsonschema/jsonschema/dist/schema.md



```
% cd jsonschema/api/ && bundle exec prmd init --yaml todo -o schemata/todo.yml

# document生成
% cd jsonschema/api/ && sh build.sh
```



## History of my doing command (memo)

```
% bundle exec rails new app-name --api --skip-bundle -d postgresql
% bundle exec rails g scaffold todo title:string body:text -p
```
