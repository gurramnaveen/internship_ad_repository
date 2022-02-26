//With Closure
//You need a logic which is called only once.
//can be achieved using closure (function(){})();

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

console.log("add = "+calc.add(10,20));
console.log("sub = "+calc.sub(10,20));
console.log("mul = "+calc.mul(10,20));
console.log("div = "+calc.div(10,20));