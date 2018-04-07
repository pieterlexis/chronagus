FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /chronagus
WORKDIR /chronagus
COPY Gemfile /chronagus/Gemfile
COPY Gemfile.lock /chronagus/Gemfile.lock
RUN bundle install
COPY . /chronagus
