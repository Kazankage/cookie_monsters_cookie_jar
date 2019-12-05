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

# Cookie Monster's Cookie Jar
## User

- Username
- Email
- Name
- Password
 - has_many :reviews
 - has_many :cookies through: :reviews

## Brand

- Name
- in_stores :boolean
- has_many :cookies

## Cookie

- Name
- Type
- Description
- brand_id
- has_many :reviews
- has_many :users through: :reviews
- belongs_to :brand

## Reviews

- Stars
- Title
- Content
- cookie_id
- User_id
- belongs_to :cookie