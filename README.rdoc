== README

This is a standard rails app

* Ruby version: jruby 1.7.10
* Rails version: 4.0.2
* Postgres

To run locally, set up ruby, rails and postgres
    http://www.postgresql.org/download/ --download and follow the guide
    use the database.sample.yml as a guide to config your Database
    gem install rails
    rvm install jruby
    bundle
    rake db:migrate
    rails s

Visit in browser: localhost:3000/

rake db:reset is also useful