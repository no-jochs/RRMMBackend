# Refuge Recovery Meeting Manager Backend

This application provides a backend API and services for clients to consume and manage the database of meeting information. It also supports interfacing with the datastore that houses all meeting information.

## Setup
This application has been developed using Ruby version 3.1.2. Please make sure this version of Ruby is installed on your development machine.

PostgreSQL is used as our relational datastore. Currently, we are using version 14.6 for development purposes. Please assure that your installation is running locally with a "postgres" superuser (which may be aliased to your localhost's username).

### Application Dependencies
After cloning this repository, `cd RRMMDbackend` and run `bundle install`.

## Database Setup
In a terminal, run `rails db:create` and then `rails db:migrate` to create the database and establish the schema.