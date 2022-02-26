const http=require('http');
const fs=require('fs');
const port=3000;
const serverMessage=`http://localhost:${port} started`;

function preProcess(fileName, contentType, res) {
    fs.readFile(fileName, (err, data)=>{
        res.setHeader('Content-Type',contentType);
        if(err){
            res.write(err);
        } else{
            res.write(data);
        }
        res.end();
    });
}

http.createServer((req,res)=>{
const url=req.url;
const method=req.method;
res.setHeader('Content-Type','text/html');
// res.write("<br/>req.url"+url);
// res.write("<br/>req.method")+method;
// res.end();

switch (url) {
    case '/':
    case '/index.html':
        preProcess(__dirname+'/index.html', 'text/html', res);
        break;
    case '/aboutus.html':
        preProcess(__dirname+'/aboutus.html', 'text/html', res);
        break;
    case '/contactus.html':
        preProcess(__dirname+'/contactus.html', 'text/html', res);
        break;
    case '/signup.html':
        preProcess(__dirname+'/signup.html', 'text/html', res);
        break;
    case '/signin.html':
        preProcess(__dirname+'/signin.html', 'text/html', res);
        break;
    case '/style.css':
        preProcess(__dirname+'/css/style.css', 'text/css', res);
        break;
    default:
        res.write('Content not found');
        res.end();
        break;
}
}).listen(port, ()=>{console.log(serverMessage);});
