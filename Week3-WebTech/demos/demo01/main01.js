// Understanding the Data types and varaibles in javascript

v1=10;
v2="10";
v3="10.0";
v4=10.0;
v5=(v1<v2);

console.log(v1+" type of "+typeof v1);
console.log(v2+" type of "+typeof v2);
console.log(v3+" type of "+typeof v3);
console.log(v4+" type of "+typeof v4);
console.log(v5+" type of "+typeof v5);

//Comparison operator

//object(==)
if (v1==v2) {
    console.log("same");
}
if (v3==v4) {
    console.log("same");
}

//object(===)
if (v1===v2) {
    console.log("same");
}else{
   console.log("different");
}
if (v3===v4) {
    console.log("same");
}else{
   console.log("different");
}

