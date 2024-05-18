FROM debian

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install iproute2 inetutils-tools procps curl net-tools tcpdump dnsutils iputils-ping -y \
    && apt-get clean

WORKDIR /app
COPY scripts/entrypoint.sh /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
