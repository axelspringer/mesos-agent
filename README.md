[![Build Status](https://travis-ci.org/katallaxie/mesos-agent.svg?branch=master)](https://travis-ci.org/katallaxie/mesos-agent) [![Docker Stars](https://img.shields.io/docker/stars/pixelmilk/mesos-agent.svg)](https://hub.docker.com/r/pixelmilk/mesos-agent/) [![Docker Pulls](https://img.shields.io/docker/pulls/pixelmilk/mesos-agent.svg)](https://hub.docker.com/r/pixelmilk/mesos-agent/)

# mesos-agent

Mesos

http://mesos.apache.org/

# use

[![](https://badge.imagelayers.io/pixelmilk/mesos-agent:1.3.0-2.0.3.svg)](https://imagelayers.io/?images=pixelmilk/mesos-agent:1.3.0-2.0.3)

> all mesos arguments are accessible via `MESOS_*` environment variables 

```
# You can use 
docker run -d \
-e EC2_INSTANCE=true \
-e MESOS_MASTER=zk://node-1:2181,node-2:2181,node-3:2181/mesos \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name slave --net host --privileged --restart always \
--name mesos-agent pixelmilk/mesos-agent:1.3.0-2.0.4
```

Set environment variable `SECRET` to enable framework and slave authentication.

Set environment variable `EC2_INSTANCE=true` to use the EC2 metadata service as to set the `MESOS_ADVERTISE_IP` variable to the local ip of the EC2 instance.

# License
[MIT](/LICENSE)