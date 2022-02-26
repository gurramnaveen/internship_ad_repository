function validation(event) {
    alert("validation() called!");
    const password=document.getElementById("password").value;
    const cpassword=document.getElementById("confirm_password").value;
    console.log("password "+password+" cpassword "+cpassword);
    const err_cpassword=document.getElementById("err_cpassword");
    if (password===cpassword) {
        return true;
    }
    event.preventDefault();
    err_cpassword.innerHTML="<br/>Password value does not match"
    err_cpassword.style.color="red";
    return false;
}