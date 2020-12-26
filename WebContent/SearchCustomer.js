function onRadioChange(){
	console.log("inside");
	var ssn_err=document.getElementById("ssn_err");
	var id_err=document.getElementById("id_err");
	if(document.getElementById("ssn_rb").checked)
	{
		//document.getElementById("id_in").value="";
		document.getElementById("ssn_in").disabled=false;
		document.getElementById("id_in").disabled=true;
		id_err.innerHTML="";
	}
	else
	{
		//document.getElementById("ssn_in").value="";
		document.getElementById("ssn_in").disabled=true;
		document.getElementById("id_in").disabled=false;
		ssn_err.innerHTML="";
	}
}

function ssn_check(){
	var ssn=document.getElementById("ssn_in");
	var ssn_err=document.getElementById("ssn_err");
	console.log(ssn);
	if(document.getElementById("ssn_rb").checked)
	{
		if(ssn.value.length!=9)
		{
			ssn_err.innerHTML="SSN must be 9 digit number";
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