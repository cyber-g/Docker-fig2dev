FROM alpine:3.24

# Ghostscript is required by fig2dev's PDF export; no Xfig GUI is needed.
RUN apk add --no-cache make fig2dev ghostscript \
    && fig2dev -V \
    && gs --version

WORKDIR /work
CMD ["sh"]
