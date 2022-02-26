const express=require('express');
const server=express();
const port=3000;
const message=`http://localhost:${port} started`;

//if url / or /index.html
server.get('/', (req, res)=>{
    res.sendFile(__dirname+'/index.html');
});

server.get('/index.html', (req, res)=>{
    res.sendFile(__dirname+'/index.html');
});

server.get('/aboutus.html', (req, res)=>{
    res.sendFile(__dirname+'/aboutus.html');
});

server.get('/contactus.html', (req, res)=>{
    res.sendFile(__dirname+'/contactus.html');
});

server.get('/signup.html', (req, res)=>{
    res.sendFile(__dirname+'/signup.html');
});

server.get('/signin.html', (req, res)=>{
    res.sendFile(__dirname+'/signin.html');
});

server.get('/style.css', (req, res)=>{
    res.sendFile(__dirname+'/css/style.css');
});

server.get('/signup.js', (req, res)=>{
    res.sendFile(__dirname+'/js/signup.js');
});

server.post('/welcome', (req, res)=>{
    //res.sendFile(__dirname+'/welcome.html');
    res.setHeader('Content-Type', 'application/json');
    const user = {
                "firstName":req.body.firstName,
                "lastName":req.body.lastName,
                "email":req.body.email
                };
    res.send(user);

});

server.listen(port, ()=>{
    console.log(message);
});