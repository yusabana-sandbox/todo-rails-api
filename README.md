# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




```
bundle exec rails new app-name --api --skip-bundle -d postgresql
```



```
cp config/database.yml.base config/database.yml

bundle exec rails g scaffold
```



```
cd jsonschema/api/ && bundle exec prmd init --yaml todo -o schemata/todo.yml

# document生成
cd jsonschema/api/ && sh build.sh
```
