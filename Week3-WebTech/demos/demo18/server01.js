//step1: load the http module
const http=require('http');
const port=3000;
//step2: Server must be created
//step2.2: What server will do when client sends the request
function onRequest(req, res){
    res.setHeader('Content-Type','text/html');
    res.write("<h1> Welcome!<h1>");
    res.write("<br/>HTTP Method"+req.method);
    res.write("<br/>Request URL"+req.url);
    res.end();
}
const server=http.createServer(onRequest);
//step3: Server must be listening to a particular port
function onServerStart(){
    console.log(`http://localhost:${port} started`);
}
server.listen(port, onServerStart);