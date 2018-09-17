FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_ROOT /var/www/docker-sinatra
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile* $APP_ROOT/
RUN bundle install
ADD . $APP_ROOT

EXPOSE 80
CMD ["ruby", "app.rb"]
