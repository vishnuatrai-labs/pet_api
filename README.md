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

***API Endpoints***


Create a Pet

curl -X POST http://localhost:3000/pets -H "Content-Type: application/json" -d '{"pet": {"name":"Buddy", "breed":"Labrador", "age":4, "vaccinated":true}}'

View all pets

curl http://localhost:3000/pets

View a pet

curl http://localhost:3000/pets/:id


Expire Vaccination

curl -X POST http://localhost:3000/pets/1/expire_vaccination


