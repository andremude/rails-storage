# README - Storages App

## Tech Stack
   * Ruby '2.7.4'
   * Rails '6.1.6'
   * PostgreSQL '12.9'

## Setup

Clone repository: 

  `git@github.com:andremude/rails-storage.git`

<br>

Install dependencies: 

  `bundle install`

<br>

Database management:

  `rails db:create`

  `rails db:migrate`

  `rails db:seed`

<br>  

Run server

  `rails server`

<br>

## RSpec Testing
  
  In Gemfile add: 
  
 ```
   group :development, :test do
     gem 'rspec-rails'
   end
```

 In terminal: 
  
  run `bundle exec rspec`

<br>

## Screenshots

![Storage-show](https://github.com/andremude/rails-storage/assets/71613801/8966a31c-1a94-4756-8067-a59b326fc3ed)

![storages-home](https://github.com/andremude/rails-storage/assets/71613801/5b88f356-134d-4ce1-bc7a-527f2a58695f)



