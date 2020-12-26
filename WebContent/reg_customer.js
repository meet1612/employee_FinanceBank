var ssn_flag=0;
var email_flag=0;
var name_flag=0;
var age_flag=0;
var city_flag=0;
var state_flag=0;
var address_flag=0;
var password_flag=0;


document.getElementById("btn").disabled=true;


function myfunc1(c)
{
	console.log(c);
	
	if(c=='s')
	{
	//console.log("in myfunc1");
	
	var s1=document.getElementById("ssn1");
	var s1_er=document.getElementById("ss_err");
	//var email=document.getElementById("em1");
	
	if(s1.value.length==0)
		{
			s1_er.innerHTML="SSN is required";
			ssn_flag=0;
		}
	
	if(s1.value.length!=9)
		{
			s1_er.innerHTML="SSN must be 9 digit number";
			//document.getElementById("btn").disabled=true;
			ssn_flag=0;
		}
	
	else
		{
		s1_er.innerHTML="";
		ssn_flag=1;
		//document.getElementById("btn").disabled=false;
		}
	}
	
	else if(c=='e')
	{
	//console.log("in myfunc1");
	
	
	var ss_em1=document.getElementById("ss_em");
	var email=document.getElementById("em1");
	
	if(email.value.length==0)
		{
			ss_em1.innerHTML="Email is required";
			email_flag=0;
		}
	
	
	else if(email.value.includes("@")==false || email.value.includes(".")==false)
		{
			ss_em1.innerHTML="Email is invalid";
			email_flag=0;
		}
	
	
	else
		{
		ss_em1.innerHTML="";
		email_flag=1;
		//document.getElementById("btn").disabled=false;
		}
	}
	
	else if(c=='p')
		{
			var pass1=document.getElementById("pass");
			var pass_err=document.getElementById("pass_err");
			
			if(pass1.value.length<8)
				{
				pass_err.innerHTML="Password must contain atleast 8 characters";
				password_flag=0;
				}
			else
				{
				pass_err.innerHTML="";
				password_flag=1;
				}
		}
	else if(c=='n')
		{
			var name=document.getElementById("name");
			var nm_err=document.getElementById("nm_err");
			
			if(name.value.length==0)
				{
				nm_err.innerHTML="Name is required";
				name_flag=0;
				}
			else
				{
				nm_err.innerHTML="";
				name_flag=1;
				}
		}
	else if(c=='a')
		{
			var age=document.getElementById("age");
			var age_err=document.getElementById("age_err");
			
			if(age.value<10)
				{
					age_err.innerHTML="Age is invalid";
					age_flag=0;
				}
			else
				{
					age_err.innerHTML="";
					age_flag=1;
				}
		}
	
	else if(c=='ad')
		{
			var address=document.getElementById("address");
			var add_err=document.getElementById("add_err");
			
			if(address.value.length==0)
				{
					add_err.innerHTML="Address is required";
					address_flag=0;
				}
			else if(address.value.length<10)
				{
					add_err.innerHTML="Address is too short";
					address_flag=0;
				}
			else
				{
				add_err.innerHTML="";
				address_flag=1;
				}
		}
	
	else if(c=='city')
		{
			var city=document.getElementById("city");
			var city_err=document.getElementById("city_err");
			
			if(city.value.length==0)
				{
				city_err.innerHTML="City is required";
				city_flag=0;
				}
			else
				{
				city_err.innerHTML="";
				city_flag=1;
				}
		}
	
	else if(c=='state')
		{
			var state=document.getElementById("state")
			var state_err=document.getElementById("state_err");
			
			if(state.value.length==0)
				{
					state_err.innerHTML="State is required";
					state_flag=0;
				}
			else
				{
					state_err.innerHTML="";
					state_flag=1;
				}
		}
	//console.log("hey"+flag);
	
	if(ssn_flag==1 && email_flag==1 && name_flag==1 && age_flag==1 && city_flag==1 && state_flag==1 && address_flag==1 && password_flag==1)
		{
			document.getElementById("btn").disabled=false;
		}
	else
		{
			document.getElementById("btn").disabled=true;
		}
	
}
