# README

## Goals
This is our Turing School Mod 3-Rails Applications project: the intentions of this project are to master our Rails skills, learn how to build single-responsibility controllers to provide a well-designed and versioned API, practice developing controller tests to drive design, and implement ActiveRecord and SQL query methods to perform complicated business intelligence.

## Setup

1. Clone down repo
2. From repo directory run bundle
3. From repo directory run rake db:create
4. From repo directory run rake db:migrate
5. From repo directory run rake seed:all_data. This may take several minutes
6. From repo directory run rails server
7. From repo directory run rspec
8. Switch to directory with rales engine spec harness, run rake


* Ruby version: 2.3.0

* To deploy to heroku from a machine with heroku installed:
1. From repo directory run git push heroku master
2. From repo directory run herkou run rails db:migrate
3. from repo directory run rake seed:all_data
