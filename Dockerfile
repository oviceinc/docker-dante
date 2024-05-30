FROM debian:bookworm-slim

ENV DANTE_VERSION 1.4.3

ENV DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VERSION.tar.gz

RUN apt-get update && apt-get install -y curl build-essential && \
    curl -sSL $DANTE_URL -o /tmp/dante.tar.gz && \
    tar xzf /tmp/dante.tar.gz -C /tmp && \
    cd /tmp/dante-$DANTE_VERSION && \
    ./configure && make && make install

COPY sockd.conf /etc/sockd.conf

CMD ["sockd", "-f", "/etc/sockd.conf"]
