# Refuge Recovery Meeting Manager Backend

This application provides a backend API and services for clients to consume and manage the database of meeting information. This repository also houses the codebase for the browser client build. Eventually, the client-side codebase may be separated, but for simplicity, it is located in the `web_client/` directory.

The Rails application is serves the "end user" application via the root `/` route. It also serves the admin interface, which can be found at the path `/admin`.

## Git Branches

Please **DO NOT** commit to or push to the `main` branch. This branch is only to be merged into once everything that is in the `development` branch has been deployed, tested, and approved.

The `development` branch is the main active branch for the purposes of this project. When working on a feature or a fix, please cut a new branch off of `development` using a naming convention like `jo-some-feature-name` with your initials first and a descriptive feature name following them all separated by hyphens.

Once your feature or fix is ready, push your branch to the remote and open a pull request against `development`. Please get a code review before merging into `development` if possible!

## Rails (Backend) Setup

### Development Platforms & Package Management

If you are developing using MacOS, the best way to install most of the dependencies outlined below is to use the [Homebrew](https://brew.sh/) package manager. On Linux, your native package manager (e.g. `apt-get` or `pacman`, etc.) will probably do the trick. If you're on Windows... well, good luck. I would recommend using [VSCode](https://code.visualstudio.com/) as it has a lovely extension called [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) that includes a feature called _Windows Subsystem for Linux (WSL)_ which allows you to use an Ubuntu subsystem which is easier to manage your dependencies with.

### Ruby Version

This application has been developed using Ruby version 3.1.2. Please make sure this version of Ruby is installed on your development machine. If you are developing on MacOS or Linux, I recommend using [rbenv](https://github.com/rbenv/rbenv) to manage your Ruby version.

### PostgreSQL (Database)

PostgreSQL is used as our relational datastore. Currently, we are using version [14.6](https://www.postgresql.org/docs/14/index.html) for development purposes. Please assure that your installation is running locally with a "postgres" superuser (which may be aliased to your localhost's username).

### Application Setup

We are using [Bundler](https://bundler.io/) to manage the dependencies of the Rails application.

After cloning this repository, `cd RRMMDbackend` and run `bundle install`.

## Database Setup

In a terminal, run `bin/rails db:create` and then `bin/rails db:migrate` to create the database and establish the schema.

For development purposes, you can also run `bin/rails db:seed`, which will create many artificial database records so that you have something to look at when you're developing locally and using your local database.

## Client-side Setup

The client-side web build is housed in the `web_client/` directory. `cd` into that directory in order to follow the directions below.

### Installing Dependencies

Once inside the `web_client/` directory, we are using `npm` to install dependencies. Just run `npm install` to install dependencies.

The client-side web build was bootstrapped using the [Create React App](https://create-react-app.dev/) framework.

## Development Flow

The client-side web build can has a hot-reloading development server that can be started from within `web_client/` using the command `npm start`. It will serve the client-side build on `localhost:3001`.

The API layer (Rails application) also needs to be started to serve data, which can be done from the application root directory with the command `bin/rails s`. The API runs on `localhost:3000`.

## Tests

Right now there are only backend tests for the Rails application. One way to develop with testing in mind is to use the `guard` gem in the application root by running the command: `bundle exec guard`. This will watch ruby files and when they change, run the corresponding tests.

Alternatively, you can run the tests in a one-off fashion with the command `bundle exec rspec`.

## Deployment

The process for deploying the latest iteration of the API and the client-side web build is a little wonky and hopefully will be improved in the future.

Any changes you made to the client-side build inside of `web_client/` need to be compiled and the resulting build copied over into the appropriate places within the main Rails application. There is a script to do this. In the application root directory, execute `bin/build_web_client`. This should result in many changes in git as several files will be replaced. Check the changes into git and push your changes up to the remote.