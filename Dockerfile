FROM ubuntu:bionic

# Add dnsdist repository
ADD dnsdist.pref /etc/apt/preferences.d/dnsdist
ADD https://repo.powerdns.com/FD380FBB-pub.asc /etc/apt/trusted.gpg.d/powerdns.asc
RUN echo 'deb [arch=amd64] http://repo.powerdns.com/ubuntu bionic-dnsdist-14 main' >> /etc/apt/sources.list \
  && chmod 0644 /etc/apt/trusted.gpg.d/powerdns.asc

# install dnsdist
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y dnsdist=1.4.0-1pdns.bionic \
  && rm -rf /var/lib/apt/lists/*
ADD dnsdist.conf /etc/dnsdist/dnsdist.conf

EXPOSE 53/udp 53/tcp 853/tcp 443/tcp 8083/tcp

CMD ["/usr/bin/dnsdist", "--supervised"]
