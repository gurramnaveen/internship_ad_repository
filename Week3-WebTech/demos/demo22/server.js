//we are creating services which will share records of user
const express=require('express');
const server=express();
const port=3000;

server.use(express.urlencoded({extended:true}));
server.use(express.json());

const users=[
    {id:1, firstName:"Chandani", lastName:"Tomar"},
    {id:2, firstName:"Deep", lastName:"Shah"},
    {id:3, firstName:"Honey", lastName:"Kholwala"},
    {id:4, firstName:"Akash", lastName:"Rathore"},
    {id:5, firstName:"Vishal", lastName:"R"}
]

//GET : all users http://localhost:3000/users
server.get('/users',(req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    res.send(users);
});

//POST : add new user http://localhost:3000/users/add
server.post('/users/add',(req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    const newUser = {id:req.body.id, firstName:req.body.firstName, lastName:req.body.lastName};
    console.log(newUser);
    users.push(newUser);
    res.send({message:"new object added"});
});

//Put : update user http://localhost:3000/users/update/:id/:lastname
server.put('/users/update/:id/:lastname',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    users.forEach(user=>{
        if(user.id===parseInt(req.params.id)){
            user.lastName=req.params.lastname;
        }
    })
    const msg=req.params.id+" updated";
    resp.send({message:msg});
});

//DELETE : delete user http:/localhost:3000/users/delete/:id
server.delete('/users/delete/:id', (req, res)=>{
    res.setHeader('Content-Type', 'application/json');
    users.forEach(user=>{
        if(user.id==req.params.id){
            users.pop();
        }
    })
    const msg=req.params.id+ " deleted";
    res.send({message:msg});
});

server.listen(port, ()=>{
    console.log(`http://localhost:${port}/users`);
});