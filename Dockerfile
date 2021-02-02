FROM node:10.15-alpine
LABEL org.opencontainers.image.source https://github.com/okgolove/docker-prerender

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

# install chromium
RUN apk add --no-cache chromium git

COPY package.json server.js ./
RUN npm install --no-package-lock

EXPOSE 3000

CMD ["node", "server.js"]
