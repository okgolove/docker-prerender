FROM node:14.17.1-alpine
LABEL org.opencontainers.image.source=https://github.com/okgolove/docker-prerender

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

# install chromium
RUN apk add --no-cache \
        chromium==81.0.4044.113-r0 \
        git==2.24.4-r

WORKDIR /opt/prerender
COPY package.json server.js ./
RUN npm install --no-package-lock

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/node", "server.js"]
