import express from "express";
import {json} from "express";
import Product from "./app/product.js";
import path from "path";
const __dirname = path.resolve(path.dirname(''));
const server=express();
const port=3000;
const server_message=`http://localhost:3000/ started`;
const product_list=[];
product_list.push(new Product("P101","Pepsi", 30.0));
product_list.push(new Product("P102","7UP", 30.0));
product_list.push(new Product("P103","Maaza", 30.0));
server.use(express.urlencoded({extended:true}));
server.use(express.json());

server.get('/', (req, resp)=>{
    resp.setHeader('Content-Type', 'text/html');
    resp.sendFile(__dirname+"/index.html");
});

server.get('/style.css',(req,resp)=>{
    resp.setHeader('Content-Type','text/css');
    resp.sendFile(__dirname+"/css/style.css");
});

server.get('/main.js',(req,resp)=>{
    resp.setHeader('Content-Type','application/javascript');
    resp.sendFile(__dirname+"/js/main.js");
});

server.get('/products',(req,resp)=>{
    resp.setHeader('Content-Type', 'application/json');
    resp.send(product_list);
});

server.get('/products/:pid',(req,resp)=>{
    resp.setHeader('Content-Type', 'application/json');
    const pid=req.params.pid;
    const product=product_list.find(p=>p.pid===pid);
    if(product)
        resp.send(product);
    else
        resp.status(404).send(pid+" not found on server!");
});

server.post('/products/add',(req,resp)=>{
    resp.setHeader('Content-Type', 'application/json');
    const newProduct = {"pid":req.body.pid, "pname":req.body.pname, "unitPrice":req.body.unitPrice};
    if(newProduct){
        const n=product_list.push(newProduct);
        if(n>0) resp.send("Product added");
        else resp.status(500).send("Product not added");
    }
});

server.put('/products/update/:pid/:unitPrice',(req,resp)=>{
    resp.setHeader('Content-Type', 'application/json');
    const pid=req.params.pid;
    const unitprice=req.params.unitPrice
    const product=product_list.find(p=>p.pid===pid);
    if(product){
        product.unitPrice=parseInt(unitprice);
        resp.send(pid+" updated");
    }else{
    resp.status(404).send(pid+" not found on server!");
    }
});

server.delete('/products/delete/:pid',(req,resp)=>{
    resp.setHeader('Content-Type', 'application/json');
    const pid=req.params.pid;
    let isDeleted=false;
    product_list.forEach(product=>{
        if(product.pid===pid){
            const ind=product_list.indexOf(product);
            product_list.splice(ind, 1);
            isDeleted=true;
            resp.send("Product with pid:"+pid+" is deleted")
        }
    });
    if(!isDeleted){
        resp.status(404).send("Product with pid:"+pid+" not found")
    }
});

server.listen(port, ()=>{
    console.log(server_message);
});