<<<<<<< HEAD
## Alpine microcontainer with apache and php7

This is a micro docker container [![](https://images.microbadger.com/badges/image/krosh961/apache-php7-docker.svg)](https://microbadger.com/images/krosh961/apache-php7-docker "Get your own image badge on microbadger.com") based on Alpine 3.7, Apache 2.4 and php7

### Examples

This images are build on nimmis/alpine-micro [![](https://images.microbadger.com/badges/image/krosh961/alpine3.7-docker.svg)](https://microbadger.com/images/krosh961/alpine3.7-docker "Get your own image badge on microbadger.com") which are a modified version of Alpine with a working init process, and a working cron, logrotate  and syslog. Services are started with runit daemon, for more information about that see [krosh961/alpine3.7-docker](https://hub.docker.com/r/krosh961/alpine3.7-docker/)


#### starting the container as a daemon

	docker run -d --name apache-php7 krosh961/apache-php7-docker

This will start the container with apache process runnung, access the container with

	docker exec -ti apache-php7 /bin/sh

#### Static web folder

The images exposes a volume at /web. The structure below /web is

| Directory | Function |
| --------- | -------- |
| html | web root |
| cgi-bin | cgi bin folder |
| config | config directory |
| logs | log directory |

To use this start the container with

	docker run -d --name apache-php7 -v /path/to/web:/web krosh961/apache-php7-docker

if the folders are missing they will be created

#### Accessing apache from outside the container

To access the webserver from external you use the -P command where the syntax is

	-P <external port on host>:<local port in container>

so to access the apache server on port 8080 you should use the command

	docker run -d --name apache-php7 -p 8080:80  krosh961/apache-php7-docker

=======