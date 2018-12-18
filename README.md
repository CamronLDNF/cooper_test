# **Cooper Test api (back-end)**
-------
This is the back-end for the Cooper Test mobile app. It serves the api to the data stored by the client-side Coooper Test. 

To get the mobile app: https://github.com/CamronLDNF/cooper_test_client

## Tech stack
-------
Building the app:
* Rails with Ruby 2.4.1
* PostgreSQL database

Testing framework:
* Rspec

## How to install
-------
1. Download the app folder
2. Open the app folder in your CLI
3. Run `rvm use 2.4.1` to switch to Ruby version 2.4.1 (install it if you don't have it)
4. Run `bundle install` to install all gems
5. Run `rails db:migrate` to run all db migrations
6. Run `rails s` to launch the server

## How to run the test suite
-------
1. Run `rake spec`

