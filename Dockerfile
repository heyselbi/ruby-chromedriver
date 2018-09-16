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
ENV CHROMEDRIVER_VERSION=2.38
RUN mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION
RUN curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip 
RUN unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION 
RUN rm /tmp/chromedriver_linux64.zip 
RUN chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver 
RUN ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

# INSTALL CHROME
RUN apt-get install -yqq fonts-liberation && apt-get install -yqq libappindicator3-1 && apt-get install -yqq libasound2  && apt-get install -yqq libatk-bridge2.0-0 && apt-get install -yqq libgtk-3-0 && apt-get install -yqq libnspr4 && apt-get install -yqq libnss3 && apt-get install -yqq libxss1 && apt-get install -yqq libxtst6 && apt-get install -yqq xdg-utils
RUN wget https://github.com/kusumandaru/chrome-downloads/blob/master/x64.deb/google-chrome-stable_68.0.3440.84-1_amd64.deb
RUN dpkg -i google-chrome-stable_68.0.3440.84-1_amd64.deb
