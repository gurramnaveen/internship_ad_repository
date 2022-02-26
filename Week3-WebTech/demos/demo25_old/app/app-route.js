import express from 'express';
const app=express.Router();

const products=[{"pid":"P101", "pname":"Dell", "unitPrice":40000}];

//following service will provide list of all the products
app.get('/products', (req, res)=>{
    res.setHeader('Content-Type', 'application/json')
    res.send(products);
});

//following service will provide the product by id
app.get('/products/:pid', (req, res)=>{
    res.setHeader('Content-Type', 'application/json')
    const pid=req.params.pid;
    const product=products.find(p=>p.pid===pid);
    if(product) res.send(product);
    else res.status(404).send("Product with pid : "+pid+" not found!");
});

//following service will add new product
app.post('/products/add', (req, res)=>{
    res.setHeader('Content-Type', 'application/json')
    const pid=req.body.pid;
    const pname=req.body.pname;
    const unitPrice=req.body.unitPrice;
    const newProduct={"pid":pid, "pname":pname, "unitPrice":unitPrice};
    products.push(newProduct);
    res.send("products added successfully");
});

//following service will update the product using pid
app.put('/products/update/:pid/:unitprice', (req, res)=>{
    res.setHeader('Content-Type', 'application/json')
    const pid=req.params.pid;
    const unitprice=req.params.unitprice;
    products.forEach(element=>{
        if(element.pid===pid){
            element.unitPrice=parseInt(unitprice);
            res.send("Product updated successfully");
        }
    });
    res.status(404).send("Product not found!");
});

//following service will delete the product using id
app.delete('/products/delete/:pid', (req, res)=>{
    res.setHeader('Content-Type', 'application/json')
    const pid=req.params.pid;
    const productIndexToDelete=products.findIndex(p=>p.pid===pid);
    if(productIndexToDelete > -1){
        //console.log("if "+productIndexToDelete);
        products.splice(productIndexToDelete, 1);
        res.send("Product deleted successfully");
    }else{
        //console.log("else "+productIndexToDelete);
        res.status(404).send("Product not found!");
    }
});

// export to use in another file
export default app;