FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y nodejs mysql-client
RUN mkdir /Reservation
WORKDIR /Reservation
COPY Gemfile /Reservation/Gemfile
COPY Gemfile.lock /Reservation/Gemfile.lock
RUN bundle install
COPY . /Reservation

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 4000

CMD ["rails", "server", "-b", "0.0.0.0"]
