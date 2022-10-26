# PowerDNS dnsdist

PowerDNS dnsdist is a highly DNS-, DoS- and abuse-aware loadbalancer. A [full description](https://www.powerdns.com/dnsdist.html) can be found on the [project website](https://www.powerdns.com/).

## The Image

Docker image with PowerDNS dnsdist.

### References

* Docker: <https://hub.docker.com/r/tmuncks/dnsdist/>
* Github: <https://github.com/tmuncks/docker-dnsdist/>

### Usage

#### Specifying downstream servers directly

It is possible to specify downstream servers directly on the docker command line:

```bash
docker run -d -p 53:53 -p 53:53/udp tmuncks/dnsdist:latest 8.8.8.8 8.8.4.4
```

#### Mounting configuration file

The image becomes a lot more flexible when using a configuration file.

Mount a full PowerDNS dnsdist configuration on `/etc/dnsdist/dnsdist.conf` in the container.

___Please note:__ The container ENTRYPOINT specifies `--local=0.0.0.0` which effectively disables setLocal() statements in the configuration file._

### Reference

Have a look [here](https://dnsdist.org/reference/config.html) for all available dnsdist settings.

## Examples

Dnsdist forwarding queries to `8.8.8.8` and `8.8.4.4`:

```bash
docker run -d -p 53:53 -p 53:53/udp tmuncks/dnsdist:latest 8.8.8.8 8.8.4.4
```

