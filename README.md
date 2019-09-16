How to setup a docker-compose based development environment for a new rails app
- preconditions
    - make is installed.
    - docker is installed. See docs.docker.com or `brew cask install docker`
- `git clone git@github.com:mistahchris/containerized-rails-starter.git $YOUR_APP_NAME`
- `cd $YOUR_APP_NAME && rm -rf .git`
- `make rails-new`
- edit `./config/database.yml` add the following fields to the default config:
  - ```
    host: db-dev
    username: postgres
    password:
  ```
- `docker-compose build`
- `docker-compose up`
- `docker-compose run dev rake db:create`
- That's it! `curl localhost:3000`
