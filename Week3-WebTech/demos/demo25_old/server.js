import express from 'express';
import path from 'path';
import app from './app/app-route.js';

const server=express();
const port=3000;
server.use(express.urlencoded({extended:true}));
server.use(express.json());
const __dirname=path.resolve(path.dirname(""));

//setting welcome url for server
server.get('/', (req, res)=>{
    res.setHeader('Content-Type', 'text/html');
    res.send("<h3>Welcome to express server!</h3>");
});

//create a router such as http://localhost:3000/app
server.use('/app', app);

//server will listen on port 3000
server.listen(port, ()=>{
    console.log(`http://localhost:${port} started`);
})