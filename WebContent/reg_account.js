var cust_flag=0;


function myfunc1(c)
{
	console.log(c);
	
	if(c=='c')
	{
	//console.log("in myfunc1");
	
	var s1=document.getElementById("cust1");
	var s1_er=document.getElementById("cust_err");
	
	if(s1.value.length==0)
		{
			s1_er.innerHTML="Customer Id is required";
			cust_flag=0;
		}
	
	if(s1.value.length!=9)
		{
			s1_er.innerHTML="Customer Id must be 9 digit number";
			//document.getElementById("btn").disabled=true;
			cust_flag=0;
		}
	
	else
		{
		s1_er.innerHTML="";
		cust_flag=1;
		//document.getElementById("btn").disabled=false;
		}
	}
}
