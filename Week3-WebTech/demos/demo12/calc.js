//Create custom module using closures
//You need a logic which is called only once
//Can be acheived using closure(function(){})();

const calc=(function(){
    this.addition=(a, b)=>a+b;
    this.subtract=(a, b)=>a-b;
    this.multiply=(a, b)=>a*b;
    this.divide=(a, b)=>a/b;

    return {
        add:this.addition,
        sub:this.subtract,
        mul:this.multiply,
        div:this.divide
    }
})();

module.exports=calc;