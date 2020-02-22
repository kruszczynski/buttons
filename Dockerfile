FROM elixir:1.9.4-alpine
RUN apk add --no-cache build-base git nodejs-npm && \
    mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod
WORKDIR /app
COPY mix.exs mix.lock ./
COPY assets/package.json ./assets/package.json
RUN mix deps.get && mix deps.compile
RUN cd assets && npm install

COPY . .

RUN cd assets && node_modules/webpack/bin/webpack.js --mode production
RUN mix phx.digest
RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]
