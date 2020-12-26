function acc_check(){
	var acc=document.getElementById("acc_in");
	var acc_err=document.getElementById("acc_err");
	console.log(acc);
		if(acc.value.length!=9)
		{
			acc_err.innerHTML="Account Id must be 9 digit number";
			document.getElementById("delete_btn").disabled =true;
		}
		else
		{
			acc_err.innerHTML="";
			document.getElementById("delete_btn").disabled =false;
		}
}