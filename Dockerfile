FROM ruby:3.1.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq && apt-get install -y nodejs yarn && gem install bundler

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME/
RUN bundle install

CMD ["/bin/bash"]
