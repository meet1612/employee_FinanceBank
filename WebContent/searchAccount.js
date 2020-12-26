function onRadioChange(){
	console.log("inside");
	var ssn_err=document.getElementById("cust_err");
	var id_err=document.getElementById("id_err");
	if(document.getElementById("cust_rb").checked)
	{
		//document.getElementById("id_in").value="";
		document.getElementById("cust_in").disabled=false;
		document.getElementById("id_in").disabled=true;
		id_err.innerHTML="";
	}
	else
	{
		//document.getElementById("ssn_in").value="";
		document.getElementById("cust_in").disabled=true;
		document.getElementById("id_in").disabled=false;
		ssn_err.innerHTML="";
	}
}

function cust_check(){
	var ssn=document.getElementById("cust_in");
	var ssn_err=document.getElementById("cust_err");
	if(document.getElementById("cust_rb").checked)
	{
		if(ssn.value.length!=9)
		{
			ssn_err.innerHTML="Customer Id must be 9 digit number";
			document.getElementById("search_btn").disabled =true;
		}
		else
		{
			ssn_err.innerHTML="";
			document.getElementById("search_btn").disabled =false;
		}
	}
}

function id_check(){
	var id=document.getElementById("id_in");
	var id_err=document.getElementById("id_err");
	console.log(id);
	if(document.getElementById("id_rb").checked)
	{
		if(id.value.length!=9)
		{
			id_err.innerHTML="Id must be 9 digit number";
			document.getElementById("search_btn").disabled =true;
		}
		else
		{
			id_err.innerHTML="";
			document.getElementById("search_btn").disabled =false;
		}
	}
}