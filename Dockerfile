FROM debian:buster-slim

ARG HASURA_VERSION

WORKDIR /usr/src/hasura

RUN apt-get update -y && apt-get install -y curl socat procps && rm -rf /var/lib/apt/lists/*

RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && curl -L -o /usr/local/bin/hasura https://github.com/hasura/graphql-engine/releases/download/v${HASURA_VERSION}/cli-hasura-linux-${arch}
RUN chmod +x /usr/local/bin/hasura

COPY start.sh /usr/local/bin/hasura-console-start

RUN chmod +x /usr/local/bin/hasura-console-start

CMD "/usr/local/bin/hasura-console-start"
