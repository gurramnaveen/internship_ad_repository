//Module with multiple function
const cal=require('./cal');

let result=cal.addition(10,5);
console.log("addition(10,5)="+result);

result=cal.subtract(10,5);
console.log("subtract(10,5)="+result);

result=cal.multiply(10,5);
console.log("multiply(10,5)="+result);

result=cal.divide(10,5);
console.log("divide(10,5)="+result);