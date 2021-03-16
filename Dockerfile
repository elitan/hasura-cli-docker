FROM alpine:3.12.4

WORKDIR /hasuracli

RUN apk add --no-cache curl bash libstdc++
RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

RUN hasura plugins install cli-ext

COPY LICENSE LICENSE

ENTRYPOINT ["hasura"]
CMD ["-?"]
