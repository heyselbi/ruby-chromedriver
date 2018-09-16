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
RUN wget http://ppa.launchpad.net/chromium-team/stable/ubuntu/pool/main/c/chromium-browser/chromium-codecs-ffmpeg-extra_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb && dpkg -i  chromium-codecs-ffmpeg-extra_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb
RUN wget http://ppa.launchpad.net/chromium-team/stable/ubuntu/pool/main/c/chromium-browser/chromium-browser_69.0.3497.92-0ubuntu0.16.04.1_amd64.deb && dpkg -i chromium-browser_67.0.3396.99-0ubuntu0.17.10.1_amd64.deb 
