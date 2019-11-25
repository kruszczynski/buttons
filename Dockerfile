FROM elixir:1.9.1-alpine
RUN apk add --no-cache build-base git nodejs-npm && \
    mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod
WORKDIR /app

COPY . .

EXPOSE 4000

CMD ["mix", "phx.server"]
