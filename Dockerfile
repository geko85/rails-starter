FROM ruby:3.0.0 AS app

# install packages
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# essentials
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim locales tzdata yarn
# image processing stuff
RUN apt-get update -qq && apt-get install -y libmagickcore-6.q16-dev libvips \
                                             advancecomp gifsicle jhead jpegoptim libjpeg-progs \
                                             optipng pngcrush pngquant

# set locales
RUN locale-gen C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C:en
ENV LC_ALL C.UTF-8
ENV TZ Europe/Berlin

RUN mkdir -p /application/bundle
ENV APP_HOME /application/app
ENV GEM_HOME="/application/bundle"
ENV PATH $GEM_HOME:$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

# prepare workdir
WORKDIR $APP_HOME
COPY . $APP_HOME

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
