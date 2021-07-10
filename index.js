const http = require('http');

const server = http.createServer((req, res) => {
  console.log('hello');
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    data: 'Hello World!'
  }));
});

server.listen(8000, () => {
  console.log(`Server started on port 8000`);
});
