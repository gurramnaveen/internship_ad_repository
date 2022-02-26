// step1: Load the http module
const http=require('http');

//step2:Server must be created
const port=3000;

//step3: Serber must be listening to a particular port
http.createServer((req, res)=>{
    res.setHeader('Content-Type', 'text/html');
    res.write('<h1>Welcome</h1>');//dynamic html page
    res.end();
}).listen(port, ()=>{
    console.log(`http://localhost:${port} started`);
});