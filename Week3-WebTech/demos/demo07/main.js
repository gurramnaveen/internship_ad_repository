//Create a calc function which will accept name of opertion
//And n1, n2 as parameter as per the operation will give result

function add(n1, n2){return n1+n2;}
function sub(n1, n2){return n1-n2;}
function mul(n1, n2){return n1*n2;}
function div(n1, n2){return n1/n2;}

function calc(operation, n1, n2){
    console.log(operation(n1,n2));
}

const a=200;
const b=50;

calc(add, a, b);
calc(sub, a, b);
calc(mul, a, b);
calc(div, a, b);