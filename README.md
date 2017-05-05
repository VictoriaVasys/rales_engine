# README

## Goals
This is our Turing School Mod 3-Rails Applications project: the intentions of this project are to master our Rails skills, learn how to build single-responsibility controllers to provide a well-designed and versioned API, practice developing controller tests to drive design, and implement ActiveRecord and SQL query methods to perform complicated business intelligence.

The specifications for the project can be found here: http://backend.turing.io/module3/projects/rails_engine
The original data implemented in the project can be found here: https://github.com/turingschool-examples/sales_engine/tree/master/data
The spec harness for this project can be cloned from here: https://github.com/turingschool/rales_engine_spec_harness

## Setup

1. Clone down repo
2. From repo directory, run the following from the Command Line Interface in sequential order:
    1. `bundle`
    2. `rake nuke`(drops database if one with the same name exists, creates a new database & migrates)
    3. `rake seed:all_data` (this may take several minutes)
    4. `rails server`
    5. `rspec` (optional; runs all rspec tests; to run a singular test, run `rspec spec/<file path>`
3. In order to run the spec harness against the project, clone the rales engine spec harness (linked above), cd into the directory, ensure that the server is running (step 2.iv.) and run `rake` (to run a singular test, run `ruby test/<file path>`

* Ruby version: 2.3.0 (also works with 2.2.5)

* To deploy to heroku from a machine with heroku installed:
1. From repo directory run git push heroku master
2. From repo directory run herkou run rails db:migrate
3. from repo directory run rake seed:all_data
