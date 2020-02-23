FROM elixir:1.9.4-alpine AS build-stage
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
RUN mix release

EXPOSE 4000

FROM alpine:3.10.4

ENV LANG=en_US.UTF-8

RUN apk add --no-cache \
        ncurses-libs \
        zlib \
        openssl \
        ca-certificates && \
    update-ca-certificates --fresh && \
    apk --no-cache upgrade

WORKDIR /app
COPY --from=build-stage /app/_build/prod .

ENV PORT=4000
CMD ["./rel/buttons/bin/buttons", "start"]
