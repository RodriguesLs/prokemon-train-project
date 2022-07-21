FROM ruby:3.1.1

ENV APP_HOME /app
RUN mkdir $APP_HOME
RUN apt-get update && apt-get install node yarn -y
WORKDIR $APP_HOME
ADD . $APP_HOME/
RUN gem install bundler && bundle install

CMD ['bin', 'bash']
