# File Viewer

Статический Docker-сервис на базе `nginx`, который раздаёт библиотеки для просмотра файлов и документов. Репозиторий подготовлен как отдельный publish-ready артефакт для дипломного проекта: с контейнеризацией, локальным запуском, healthcheck, CI и описанием сторонних зависимостей.

## Назначение

Этот проект не содержит бизнес-логики просмотра файлов. Его задача - выступать отдельным сервером статических ассетов:

- библиотеки из `public/libs/` для встраивания в клиентское приложение;
- `ViewerJS` из `public/ViewerJS/` как готовый web viewer;
- стартовая страница `public/index.html` как точка входа и краткая документация.

## Структура

```text
.
├── .github/workflows/ci.yml   # сборка и smoke-test образа в GitHub Actions
├── Dockerfile                 # production-ready образ на базе nginx
├── docker-compose.yml         # локальный запуск
├── nginx/default.conf         # конфигурация nginx
├── public/                    # статические библиотеки и landing page
├── THIRD_PARTY_NOTICES.md     # сведения о bundled third-party компонентах
└── README.md
```

## Быстрый старт

### Через Docker Compose

```bash
docker compose up --build
```

После старта сервис будет доступен по адресу `http://localhost:8080`.

### Через Docker

```bash
docker build -t file-viewer .
docker run --rm -p 8080:80 file-viewer
```

## Доступные URL

- `GET /` - стартовая страница сервиса;
- `GET /libs/` - каталог библиотек;
- `GET /ViewerJS/` - bundled viewer;
- `GET /healthz` - healthcheck endpoint.

## Технические решения

- официальный базовый образ `nginx:stable-alpine`;
- кэширование статических файлов и `gzip`;
- CORS-заголовки для библиотек и viewer-ассетов;
- минимальные security headers;
- отдельный CI workflow для проверки сборки и базовой доступности ресурсов.

## Подготовка к GitHub

Проект уже приведён к состоянию, в котором его можно публиковать:

- добавлены `.gitignore`, `.dockerignore`, `.editorconfig`;
- убрана зависимость от приватного Docker registry;
- добавлена документация по сторонним библиотекам;
- подготовлен GitHub Actions workflow для автоматической проверки.

Если нужно, дальше можно отдельно добавить `LICENSE`, описание релизов и badges в README. Файл лицензии я намеренно не создавал автоматически, потому что это юридически осознанный выбор, который лучше зафиксировать отдельно.
