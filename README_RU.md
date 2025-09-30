🦀 MailCrab Compose
===

Готовая конфигурация для запуска [MailCrab](https://github.com/tweedegolf/mailcrab) (mail catcher)
в Docker/Podman окружении.
Сервис предполагается использовать для <u>тестирования</u> функции отправки Email (SMTP) в изолированной среде.

## 🚀 Быстрый старт

В проекте присутствует два конфигурационных файла для запуска сервиса через [Docker Compose](https://docs.docker.com/compose/):

1. [docker-compose.simple.yml](docker-compose.simple.yml) — простая конфигурация с публичными портами `1025/tcp` & `1080/tcp`.
1. [docker-compose.traefik.yml](docker-compose.traefik.yml) — готовая конфигурация для запуска сервиса с поддержкой [Traefik](https://doc.traefik.io/traefik/) в качестве обратного прокси.

Пример команды для запуска сервиса:

```shell
$ cp -f docker-compose.simple.yml docker-compose.yml
$ docker compose up -d
```

Также можно воспользоваться готовой [make](Makefile) командой:

```shell
$ make docker-up
```

## 🕹️ Эксплуатация

Ваше приложение должно поддерживать отправку Email через внешний SMTP сервер.
В настройках подключения необходимо указать в качестве хоста наименование контейнера `mailcrab` и порт `1025`.
Авторизация при этом не требуется, т.е можно указать любые данные или вовсе не заполнять.

Пример конфигурации файла `php.ini`:

```ini
sendmail_from = "testing@app.local"
sendmail_path = /usr/sbin/sendmail -t -i -S mailcrab:1025
```

---

## 📜 Лицензия

Данный проект распространяется по лицензии [MIT](https://en.wikipedia.org/wiki/MIT_License).
Полный текст лицензии можно прочитать в соответствующем [файле](LICENSE).
