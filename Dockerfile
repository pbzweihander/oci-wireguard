FROM alpine:3

RUN apk add --no-cache wireguard-tools sudo socat iptables

RUN addgroup -g 1000 wireguard && \
  adduser -u 1000 -G wireguard -h /home/wireguard -D wireguard && \
  echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel && \
  adduser wireguard wheel

USER wireguard
WORKDIR /home/wireguard
COPY ./Entrypoint.sh ./Entrypoint.sh
CMD ["/bin/sh", "-c", "/home/wireguard/Entrypoint.sh"]
