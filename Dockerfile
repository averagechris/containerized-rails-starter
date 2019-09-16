FROM ruby:2.6-alpine

ARG APP_ROOT=/app/
RUN mkdir $APP_ROOT

############################
# Install Build Dependencies
############################
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
        build-base \
        curl-dev \
        git \
        nodejs \
        postgresql-dev \
        tzdata \
        yaml-dev \
        zlib-dev

WORKDIR /opt
RUN wget https://yarnpkg.com/latest.tar.gz \
    && tar zvxf latest.tar.gz \
    && ln -fs /opt/*/bin/yarn /usr/local/bin/

WORKDIR $APP_ROOT

############################
# Install Rails Dependencies
############################
RUN apk add --update --no-cache \
    bash \
    postgresql-client

###################
# Install Ruby Gems
###################
COPY Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT
RUN bundler update --bundler \
    && bundle lock --add-platform x86_64-linux \
    && bundle lock --add-platform ruby \
    && bundle install --jobs 3  --retry 3


########################
# Setup Application Code
########################
COPY . .
# RUN rake assets:precompile

##################
# Setup Executable
##################
EXPOSE 3000
# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# CMD ["rails", "server", "-b" "0.0.0.0"]
CMD rails server -b 0.0.0.0
