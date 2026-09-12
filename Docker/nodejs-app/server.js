const http = require('http');

const html = '<!doctype html><html><body><h1>Hello World</h1></body></html>';

http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(html);
}).listen(3000, '0.0.0.0');
