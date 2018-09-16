# Base image:
FROM ruby:2.5.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mysql-client apt-transport-https ca-certificates unzip xvfb

# Install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

# Install bundler
RUN gem install bundler --no-ri --no-rdoc


# INSTALL Chromium and chromedriver
RUN apt-get install -yqq libasound2 && apt-get install -yqq libatk-bridge2.0-0 && apt-get install -yqq libgtk-3-0 && apt-get install -yqq libnspr4 && apt-get install -yqq libnss3 && apt-get install -yqq libxss1 && apt-get install -yqq libxtst6 && apt-get install -yqq xdg-utils

RUN wget http://ppa.launchpad.net/chromium-team/stable/ubuntu/pool/main/c/chromium-browser/chromium-codecs-ffmpeg-extra_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb
RUN wget http://ppa.launchpad.net/chromium-team/stable/ubuntu/pool/main/c/chromium-browser/chromium-browser_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb
RUN wget http://ppa.launchpad.net/chromium-team/stable/ubuntu/pool/main/c/chromium-browser/chromium-chromedriver_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb

RUN dpkg -i chromium-codecs-ffmpeg-extra_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb
RUN dpkg -i chromium-browser_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb 
RUN dpkg -i chromium-chromedriver_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb
