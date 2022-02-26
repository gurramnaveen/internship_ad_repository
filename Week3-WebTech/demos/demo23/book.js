//we are creating services which will share records of books
const express=require('express');
const server=express();
const port=3000;

server.use(express.urlencoded({extended:true}));
server.use(express.json());

const books=[
    {isbn:"P101", title:"Alchemist", author:"Paulo", unitPrice:"200"}];

//GET : all books http://localhost:3000/books
server.get('/books',(req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    res.send(books);
});

//POST : add new book http://localhost:3000/books/add
server.post('/books/add',(req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    const newBook = {isbn:req.body.isbn, title:req.body.title, author:req.body.author, unitPrice:req.body.unitPrice};
    console.log(newBook);
    books.push(newBook);
    res.send({message:"new book added"});
});

//Put : update book http://localhost:3000/books/update/:isbn/:unitprice
server.put('/books/update/:isbn/:unitprice',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    books.forEach(book=>{
        if(book.isbn===req.params.isbn){
            book.unitPrice=req.params.unitprice;
        }
    })
    const msg=req.params.isbn+" updated";
    resp.send({message:msg});
});

//DELETE : delete book http://localhost:3000/books/delete/:isbn
server.delete('/books/delete/:isbn', (req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    books.forEach(book=>{
        if(book.isbn===req.params.isbn){
            books.pop();
        }
    })
    const msg=req.params.isbn+ " deleted";
    res.send({message:msg});
});

server.listen(port, ()=>{
    console.log(`http://localhost:${port}/books`);
});