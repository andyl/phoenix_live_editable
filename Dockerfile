# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian instead of
# Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?page=1&name=ubuntu
# https://hub.docker.com/_/ubuntu?tab=tags
#
#
# This file is based on these images:
#
#   - https://hub.docker.com/r/hexpm/elixir/tags - for the build image
#   - https://hub.docker.com/_/debian?tab=tags&page=1&name=bullseye-20210902-slim - for the release image
#   - https://pkgs.org/ - resource for finding needed packages
#   - Ex: hexpm/elixir:1.13.3-erlang-24.2-debian-bullseye-20210902-slim
#
ARG ELIXIR_VERSION=1.13.3
ARG OTP_VERSION=24.2
ARG DEBIAN_VERSION=bullseye-20210902-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} as builder

# install build dependencies
RUN apt-get update -y && apt-get install -y build-essential git \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV="prod"
ENV HEX_HTTP_CONCURRENCY=1
ENV HEX_HTTP_TIMEOUT=120

# install mix dependencies
COPY mix.exs mix.lock ./
COPY apps/phoenix_live_editable/mix.exs ./apps/phoenix_live_editable/mix.exs
COPY apps/ple_demo_base/mix.exs ./apps/ple_demo_base/mix.exs
COPY apps/ple_demo_milligram/mix.exs ./apps/ple_demo_milligram/mix.exs
COPY apps/ple_demo_tailwind3/mix.exs ./apps/ple_demo_tailwind3/mix.exs 
COPY apps/ple_util/mix.exs ./apps/ple_util/mix.exs 
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

# copy compile-time config files before we compile dependencies
# to ensure any relevant config change will trigger the dependencies
# to be re-compiled.
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY apps/ple_demo_base/priv ./apps/ple_demo_base
COPY apps/ple_demo_milligram/priv ./apps/ple_demo_milligram
COPY apps/ple_demo_tailwind3/priv ./apps/ple_demo_tailwind3

COPY apps/phoenix_live_editable/lib ./apps/phoenix_live_editable/lib
COPY apps/ple_demo_base/lib ./apps/ple_demo_base/lib
COPY apps/ple_demo_milligram/lib ./apps/ple_demo_milligram/lib
COPY apps/ple_demo_tailwind3/lib ./apps/ple_demo_tailwind3/lib
COPY apps/ple_util/lib ./apps/ple_util/lib 

COPY apps/phoenix_live_editable/assets ./apps/phoenix_live_editable/assets
COPY apps/ple_demo_base/assets ./apps/ple_demo_base/assets
COPY apps/ple_demo_milligram/assets ./apps/ple_demo_milligram/assets
COPY apps/ple_demo_tailwind3/assets ./apps/ple_demo_tailwind3/assets 

# compile assets
RUN mix assets.deploy

# Compile the release
RUN mix compile

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

# COPY rel rel
RUN mix release

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE}

RUN apt-get update -y && apt-get install -y libstdc++6 openssl libncurses5 locales \
  && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR "/app"
RUN chown nobody /app

# set runner ENV
ENV MIX_ENV="prod"

# Only copy the final release from the build stage
COPY --from=builder --chown=nobody:root /app/_build/${MIX_ENV}/rel/demo ./

USER nobody

CMD ["/app/bin/demo", "start"]
