FROM ruby:2.6.5

RUN mkdir /interview_task
WORKDIR /interview_task

RUN gem install bundler

ADD Gemfile /interview_task/Gemfile
ADD Gemfile.lock /interview_task/Gemfile.lock

RUN bundle install

ADD . /interview_task
