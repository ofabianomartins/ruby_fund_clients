FROM ruby:2.7.5

WORKDIR /app

COPY ./Gemfile /app
COPY ./Gemfile.lock /app

RUN gem install bundler

RUN bundle install

COPY . /app

CMD ["rails","s", "-p","3001","-b","0.0.0.0"]
