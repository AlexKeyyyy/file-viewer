FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="file-viewer"
LABEL org.opencontainers.image.description="Static Nginx image with bundled file-viewer libraries and BSL console"
LABEL org.opencontainers.image.licenses="NOASSERTION"

RUN rm -rf /usr/share/nginx/html/* \
    && rm -f /etc/nginx/conf.d/default.conf

COPY public/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://127.0.0.1/healthz || exit 1

CMD ["nginx", "-g", "daemon off;"]
