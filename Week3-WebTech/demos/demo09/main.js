//Create calc function accepting arrow functions
//()=>{}   (for these parameters)=>{do this action}

function calc(operation, n1, n2){
    console.log(operation(n1, n2));
}

const n1=400
const n2=10

console.log("Addition");
calc((a, b)=>a+b, n1, n2);

console.log("Subtract");
calc((a, b)=>a-b, n1, n2);

console.log("Multiply");
calc((a, b)=>a*b, n1, n2);

console.log("Divide");
calc((a, b)=>a/b, n1, n2);