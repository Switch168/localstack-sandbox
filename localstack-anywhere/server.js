var http = require('http'),
    httpProxy = require('http-proxy'),
    express = require('express');
var cors = require('cors')

// create a server
var app = express();
app.use(cors())
var proxy = httpProxy.createProxyServer({ target: `http://${process.env.LOCALSTACK_INSTANCE_IP}`, ws: true }).on("error", (e) => {
            console.log(e);
        });
var server = require('http').createServer(app);

// proxy HTTP GET / POST
app.get('/*', function(req, res) {
  console.log("proxying GET request", req.url);
  proxy.web(req, res, {});
});
app.post('/*', function(req, res) {
  console.log("proxying POST request", req.url);
  proxy.web(req, res, {});
});

// Proxy websockets
server.on('upgrade', function (req, socket, head) {
  console.log("proxying upgrade request", req.url);
  proxy.ws(req, socket, head);
});

// serve static content
app.use('/', express.static(__dirname + "/public"));

server.listen(4566);