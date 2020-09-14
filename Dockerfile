FROM elixir:1.10.3

ENV MIX_ENV=prod

RUN mix local.hex --force \
 && mix archive.install --force hex phx_new 1.5.1 \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y build-essential \
 && apt-get install -y inotify-tools \
 && mix local.rebar --force
 
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN mix deps.get --only $MIX_ENV

RUN mix do clean, compile --force

RUN mix release $MIX_ENV
