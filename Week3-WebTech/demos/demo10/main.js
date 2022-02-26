//Without Closure

const calc=function(n1, n2){
    this.addition=function(n1, n2){
        return n1+n2;
    }
    return {add:this.addition};
}

const res=calc().add(10, 20);
console.log(res);