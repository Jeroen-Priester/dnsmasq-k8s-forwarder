FROM alpine:3.16

RUN echo "*** install dnsmasq ***" && \
    apk add dnsmasq && \
    echo "comment out \"local-service\" to allow dns requests from non local networks" && \
    sed -i 's/local-service/#local-service/' /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq","--log-facility=-","--keep-in-foreground"]
