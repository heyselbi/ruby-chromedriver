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

# Install chromedirver
ENV CHROMEDRIVER_VERSION=2.41
RUN mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION
RUN curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip 
RUN unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION 
RUN rm /tmp/chromedriver_linux64.zip 
RUN chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver 
RUN ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

# INSTALL CHROMIUM
RUN add-apt-repository -y ppa:chromium-team/stable
RUN apt-get -yqq update
RUN apt-get install -yqq chromium-browser

