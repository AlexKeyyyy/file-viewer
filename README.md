# File Viewer

Статический Docker-сервис на базе `nginx`, который раздаёт библиотеки для просмотра файлов и документов.

## Назначение

Раздача статических библиотек рендеринга документов для универсального просмотра файлов в 1С:Предприятие:

- библиотеки из `public/libs/` для встраивания (PDF.js, docx-preview.js etc.);
- `ViewerJS` из `public/ViewerJS/` на базе WebODF для отображения ODF;
- стартовая страница `public/index.html` с краткой документацией.

## Структура

```text
.
├── .github/workflows/ci.yml   # сборка и smoke-test образа в GitHub Actions
├── Dockerfile                 # production-ready образ на базе nginx
├── docker-compose.yml         # локальный запуск
├── nginx/default.conf         # конфигурация nginx
├── public/                    # статические библиотеки и landing page
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
