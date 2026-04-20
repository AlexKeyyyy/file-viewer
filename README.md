# File Viewer

Статический Docker-сервис на базе `nginx`, который раздаёт библиотеки для просмотра файлов и документов, а также веб-консоль `bsl_console` для работы с кодом 1С.

## Назначение

Сервис используется как отдельный статический узел в инфраструктуре проекта и предоставляет:

- библиотеки из `public/libs/` для встраивания в клиентские приложения;
- `ViewerJS` из `public/ViewerJS/` для отображения документов формата ODF;
- `bsl_console` из `public/bsl_console/`, опубликованную по URL `/bsl_console/`;
- стартовую страницу `public/index.html` с описанием доступных ресурсов.

## Структура

```text
.
├── .github/workflows/ci.yml   # сборка и smoke-test образа
├── Dockerfile                 # production-ready образ nginx
├── docker-compose.yml         # локальный запуск
├── nginx/default.conf         # конфигурация nginx
├── public/                    # все публикуемые статические ресурсы
│   ├── ViewerJS/              # viewer для ODF
│   ├── bsl_console/           # веб-консоль BSL
│   ├── libs/                  # отдельные JS-библиотеки
│   └── index.html             # landing page сервиса
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
- `GET /ViewerJS/` - bundled viewer для ODF;
- `GET /bsl_console/` - веб-консоль BSL;
- `GET /healthz` - endpoint для healthcheck.

## Технические решения

- официальный базовый образ `nginx:stable-alpine`;
- единый каталог `public/` для всех публикуемых ресурсов без дублирования структуры между образом и локальным запуском;
- статическая публикация viewer-библиотек и `bsl_console` без дополнительного backend;
- кэширование статических ресурсов и `gzip`;
- CORS-заголовки для библиотек и viewer-ассетов;
- отдельный CI workflow для проверки сборки и доступности основных URL.
