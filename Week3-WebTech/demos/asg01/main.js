//create object to store Product details such as pid, pname, unitprice

//usinng new obj
const product = new Object();
product.pid = "P101";
product.pname = "Pepsi";
product.unitPrice = 25.00;
product.details = function () {
    return this.pid +" "+ this.pname +" "+ this.unitPrice;
}
console.log(product.details());

//using Constructor
function Product(id, name, price) {
    this.pid=id;
    this.pname=name;
    this.unitPrice=price;
    this.details = function() {
        return this.pid+" "+this.pname+" "+this.unitPrice;
    }
}
const p1 = new Product("P102", "ThumbsUP", 30.00);
console.log(p1.details());

//usnig JSON
const p2 = {"pid":"P103", "pname":"7UP", "unitPrice":30.00, "details":function(){return this.pid+" "+this.pname+" "+this.unitPrice;}};
console.log(p2.details());