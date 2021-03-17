FROM alpine:3.12.4

WORKDIR /hasuracli

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub  
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk 
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk
RUN apk add glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk
RUN /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
RUN apk add --no-cache curl bash libstdc++

RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

RUN hasura update-cli --version v1.3.2
RUN hasura plugins install cli-ext --version v1.3.2


RUN touch config.yaml

COPY LICENSE LICENSE

ENTRYPOINT ["hasura"]
CMD ["-?"]

# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]
