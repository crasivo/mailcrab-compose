🦀 MailCrab Compose
===

Ready-made configuration for running [MailCrab](https://github.com/tweedegolf/mailcrab) (mail catcher)
in a Docker/Podman environment.
The service is intended to be used for <u>testing</u> the Email (SMTP) sending function in an isolated environment.

## 🚀 Quick Start

The project includes two configuration files for running the service via [Docker Compose](https://docs.docker.com/compose/):

1. [docker-compose.simple.yml](docker-compose.simple.yml) — simple configuration with public ports `1025/tcp` & `1080/tcp`.
1. [docker-compose.traefik.yml](docker-compose.traefik.yml) — ready-made configuration for running the service with [Traefik](https://doc.traefik.io/traefik/) support as a reverse proxy.

Example command to start the service:

```shell
$ cp -f docker-compose.simple.yml docker-compose.yml
$ docker compose up -d
```

You can also use the ready-made [make](Makefile) command:

```shell
$ make docker-up
```

## 🕹️ Operation

Your application must support sending Email via an external SMTP server.
In the connection settings, you must specify the container name `mailcrab` and port `1025` as the host.
Authorization is not required, i.e. you can specify any data or not fill it in at all.

Example configuration of the `php.ini` file:

```ini
sendmail_from = "testing@app.local"
sendmail_path = /usr/sbin/sendmail -t -i -S mailcrab:1025
```

---

## 📜 License

This project is distributed under the [MIT](https://en.wikipedia.org/wiki/MIT_License) license.
The full text of the license can be read in the corresponding [file](LICENSE).
