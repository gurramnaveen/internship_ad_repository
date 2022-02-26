//Create calc function accepting anonymous function

function calc(operation, n1, n2){
    console.log(operation(n1, n2));
}

const n1=1000;
const n2=40;

console.log("Addition");
calc(function(a, b){return a+b}, n1, n2);

console.log("Subtract");
calc(function(a, b){return a-b}, n1, n2);

console.log("Multiply");
calc(function(a, b){return a*b}, n1, n2);

console.log("Divide");
calc(function(a, b){return a/b}, n1, n2);