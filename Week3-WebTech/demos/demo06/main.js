//Callback function
function f1(){
    console.log("We will call this function f1() inn another function");
}

function doSomething(functionName){
    console.log("Do Something");
    console.log("calling function whose name is passed in functionName");
    functionName();
    console.log("Work Completed");
}

doSomething(f1);