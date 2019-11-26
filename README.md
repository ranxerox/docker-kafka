Kafka in Docker
===

This repository provides everything you need to run Kafka in Docker. It is forked from the outdate spotify-kafka docker
https://github.com/spotify/docker-kafka

Main difference is that it uses an alpine container and advertiser host are set by default


Why?
---
The main hurdle of running Kafka in Docker is that it depends on Zookeeper.
Compared to other Kafka docker images, this one runs both Zookeeper and Kafka
in the same container. This means:

* No dependency on an external Zookeeper host, or linking to another container
* Zookeeper and Kafka are configured to work together out of the box

Run
---

```bash
docker run -p 9092:9092 agustincito/kafka
```

If you also need to expose zookeeper, just publish this port:
```bash
docker run -p 2181:2181 -p 9092:9092 agustincito/kafka
```

In the box
---
* **agustincito/kafka**

  The docker image with both Kafka and Zookeeper. Built from the `kafka`
  directory.

Public Builds
---
https://hub.docker.com/r/agustincito/kafka
