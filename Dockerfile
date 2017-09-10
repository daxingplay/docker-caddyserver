FROM alpine:3.6
MAINTAINER "daxingplay <daxingplay@gmail.com>"

RUN apk add --no-cache openssh-client bash git tar curl && \
    curl --silent --show-error --fail --location \
    https://getcaddy.com | bash -s hook.service,http.authz,http.awses,http.awslambda,http.cache,http.cgi,http.cors,http.datadog,http.expires,http.filter,http.forwardproxy,http.ipfilter,http.jwt,http.login,http.minify,http.nobots,http.proxyprotocol,http.ratelimit,http.realip,http.reauth,http.restic,http.upload,net,tls.dns.cloudflare,tls.dns.digitalocean,tls.dns.dnsimple,tls.dns.dnspod,tls.dns.dyn,tls.dns.exoscale,tls.dns.gandi,tls.dns.googlecloud,tls.dns.linode,tls.dns.namecheap,tls.dns.ovh,tls.dns.rackspace,tls.dns.rfc2136,tls.dns.route53,tls.dns.vultr && \
    chmod 0755 /usr/bin/caddy && \
    /usr/bin/caddy -version && \
    apk remove git tar curl bash

COPY Caddyfile /etc/Caddyfile

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]