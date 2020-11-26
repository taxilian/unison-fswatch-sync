
FROM alpine

RUN apk add --no-cache bash unison

RUN mkdir -p /data/shared && mkdir -p /data/local && mkdir -p /scripts \
    && chown -R 33:33 /data && chown -R 33:33 /scripts

ENV HOME=/scripts

# These are the same as what wordpress runs as
USER 33

ADD --chown=33:33 *.sh /scripts/
WORKDIR /scripts
CMD /scripts/run.sh