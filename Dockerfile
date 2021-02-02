FROM node:10.15-alpine
LABEL org.opencontainers.image.source https://github.com/okgolove/docker-prerender

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

COPY package.json server.js ./

# install chromium and clear cache
RUN apk add --update-cache chromium git \
    && rm -rf /var/cache/apk/* /tmp/*

# install npm packages
RUN npm install --no-package-lock

EXPOSE 3000

CMD ["node", "server.js"]
