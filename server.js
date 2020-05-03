const prerender = require('prerender');
const server = prerender({
  chromeFlags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars', '--blink-settings=imagesEnabled=false' ],
  forwardHeaders: true,
  chromeLocation: '/usr/bin/chromium-browser'
});

server.use(require('prerender-request-blacklist'));
server.use(prerender.httpHeaders());
server.use(require('prerender-aws-s3-cache'));
server.use(prerender.blacklist());

server.start();
