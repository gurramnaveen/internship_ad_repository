//person objetc firstname, lastname
//new Object() new is allocating memory for object()

const person=new Object();
person.firstName="Amit";
person.lastName="Jha";

console.log("Object.property "+person.firstName+" "+person.lastName);
person.details=function(){
    return this.firstName+" "+this.lastName;
}
console.log("Person details: "+ person.details());