FROM ruby:2.3
MAINTAINER Bryan <dongchirua@live.com>
EXPOSE 4000

RUN apt-get update \
  && apt-get install -y \
    python-pygments \
    node \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem update --system
RUN gem install bundler ffi jekyll github-pages

VOLUME /src
WORKDIR /src
COPY . .

RUN bundle

ENTRYPOINT ["jekyll"]
CMD ["server", "--host=0.0.0.0"]
