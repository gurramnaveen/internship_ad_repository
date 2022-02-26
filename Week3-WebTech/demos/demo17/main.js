//JSON

const p1={"firstName":"Ganesh", "lastName":"P", "details":function(){return this.firstName+" "+this.lastName}};
const p2={"firstName":"Gaurav", "lastName":"M", "details":function(){return this.firstName+" "+this.lastName}};
const p3={"firstName":"Akash", "lastName":"B", "details":function(){return this.firstName+" "+this.lastName}};

const People=[p1, p2, p3];

for (let i in People){
    console.log(People[i].details());
}