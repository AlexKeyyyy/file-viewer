# Third-Party Notices

Репозиторий содержит вендорные JavaScript-библиотеки, которые распространяются вместе со статическим контейнером. Ниже перечислены компоненты, которые удалось идентифицировать по именам файлов и встроенным лицензионным заголовкам.

## Компоненты с явно обнаруженным лицензионным заголовком

| Component | Paths | Notes |
| --- | --- | --- |
| PDF.js | `public/libs/pdf.min.js`, `public/libs/pdf.worker.min.js`, `public/ViewerJS/pdf.js`, `public/ViewerJS/pdf.worker.js`, `public/ViewerJS/compatibility.js`, `public/ViewerJS/text_layer_builder.js`, `public/ViewerJS/ui_utils.js` | В файлах присутствуют заголовки Mozilla Foundation. |
| WebODF | `public/libs/webodf.js`, `public/ViewerJS/webodf.js` | В файлах присутствуют copyright notices KO GmbH. |
| ViewerJS | `public/ViewerJS/index.html`, `public/ViewerJS/*` | В `index.html` присутствует указание на ViewerJS и лицензионное уведомление AGPL. |

## Компоненты, присутствующие в виде bundled/minified assets

| Component | Paths | Notes |
| --- | --- | --- |
| Mammoth.js | `public/libs/mammoth.browser.min.js` | Используется для преобразования DOCX в HTML. Проверь исходный upstream release и его лицензию перед внешним распространением. |
| JSZip | `public/libs/jszip.min.js` | Используется как зависимость при работе с DOCX/ZIP-контейнерами. Проверь исходный upstream release и его лицензию перед внешним распространением. |
| docx-preview | `public/libs/docx-preview.min.js` | Используется для preview DOCX. Проверь исходный upstream release и его лицензию перед внешним распространением. |
| Promise polyfill | `public/libs/polyfill.min.js` | Используется как вспомогательный браузерный полифилл. Проверь исходный upstream release и его лицензию перед внешним распространением. |

## Важно

- Этот файл не заменяет оригинальные лицензии upstream-проектов.
- Перед публичной поставкой или коммерческим использованием стоит сверить точные версии библиотек и приложить полные тексты лицензий, если это требуется их условиями.
- Для академического репозитория этого файла достаточно как стартовой инвентаризации зависимостей, но для production-поставки лучше оформить отдельный compliance-пакет.
