FROM ubuntu:focal

# register arguments (from make)
ARG REPO

# add powerdns repository
ADD powerdns.pref /etc/apt/preferences.d/powerdns
ADD https://repo.powerdns.com/FD380FBB-pub.asc /etc/apt/trusted.gpg.d/powerdns.asc
RUN echo "deb [arch=amd64] http://repo.powerdns.com/ubuntu ${REPO} main" >> /etc/apt/sources.list \
  && chmod 0644 /etc/apt/trusted.gpg.d/powerdns.asc

# install pdns-server and tools
RUN apt-get update \
  && apt-get install -y --no-install-recommends dnsdist \
  && rm -rf /var/lib/apt/lists/*

# prepare ports
EXPOSE 53/udp 53/tcp

# defaults
ENTRYPOINT ["/usr/bin/dnsdist", "--uid=_dnsdist", "--gid=_dnsdist", "--supervised", "--disable-syslog", "--local=0.0.0.0"]
#CMD ["/usr/bin/dnsdist", "--uid=_dnsdist", "--gid=_dnsdist", "--supervised", "--disable-syslog", "--local=0.0.0.0"]
