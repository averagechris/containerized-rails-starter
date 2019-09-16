How to setup a docker-compose based development environment for a new rails app
- preconditions
    - docker is installed. See docs.docker.com or `brew cask install docker`
- `git clone $repo`
- `cd $repo && rm -rf .git`
- change directory name to a suitable app name
- `docker-compose run dev rails new ./ --database=postgresql --force --no-deps`
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
