<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Finance Bank</title>
<style>
body {
    font-family: "Helvetica Neue", Helvetica, Arial;
}

.container {
    width: 406px;
    max-width: 406px;
    margin: 0 auto;
}

#signup {
    padding: 0px 25px 25px;
    background: #fff;
    box-shadow: 
        0px 0px 0px 5px rgba( 255,255,255,0.4 ), 
        0px 4px 20px rgba( 0,0,0,0.33 );
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    display: table;
    position: static;
}

#signup .header {
    margin-bottom: 20px;
}

#signup .header h3 {
    color: #333333;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

#signup .header p {
    color: #8f8f8f;
    font-size: 14px;
    font-weight: 300;
}

#signup .sep {
    height: 1px;
    background: #e8e8e8;
    width: 406px;
    margin: 0px -25px;
}

#signup .inputs {
    margin-top: 25px;
}

#signup .inputs label {
    color: #8f8f8f;
    font-size: 12px;
    font-weight: 300;
    letter-spacing: 1px;
    margin-bottom: 7px;
    display: block;
}

input::-webkit-input-placeholder {
    color:    #b5b5b5;
}

input:-moz-placeholder {
    color:    #b5b5b5;
}

#signup .inputs input[type=email], input[type=password], input[type=text], input[type=number] {
    background: #f5f5f5;
    font-size: 0.8rem;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    padding: 13px 10px;
    width: 330px;
    margin-bottom: 20px;
    box-shadow: inset 0px 2px 3px rgba( 0,0,0,0.1 );
    clear: both;
}

#signup .inputs input[type=email]:focus, input[type=password]:focus, input[type=text]:focus, input[type=number]:focus {
    background: #fff;
    box-shadow: 0px 0px 0px 3px #fff38e, inset 0px 2px 3px rgba( 0,0,0,0.2 ), 0px 5px 5px rgba( 0,0,0,0.15 );
    outline: none;   
}


#signup .inputs label.terms {
    float: left;
    font-size: 14px;
    font-style: italic;
}

#signup .inputs #submit {
    width: 95%;
    margin-top: 20px;
    padding: 15px 0;
    color: #fff;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    text-align: center;
    text-decoration: none;
        background: -moz-linear-gradient(
        top,
        #0C090A 0%,
        #a4b0cb);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#0C090A),
        to(#2C3539));
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    border: 1px solid #737b8d;
    -moz-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    -webkit-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    text-shadow:
        0px 1px 3px rgba(000,000,000,0.3),
        0px 0px 0px rgba(255,255,255,0);
    display: table;
    position: static;
    clear: both;
}

#signup .inputs #submit:hover {
    background: -moz-linear-gradient(
        top,
        #0C090A 0%,
        #0C090A);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#0C090A),
        to(#0C090A));
}




</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<%

String updateError = (String) request.getAttribute("updateError");
String updatemsg = (String) request.getAttribute("updatemsg");
%>
<%@include file="HeaderFooter.jsp" %><br>
<%@include file="Session.jsp" %>
<!-- <h1>Update Customer</h1>  -->

<div class="container">

<form id="signup" action="CustomerController?operation=updatecustomer" method="post">

<div class="header">
        
            <h3>Update Customer</h3>
            
</div>
        
        <div class="sep"></div>
        <div class="inputs">
        
			
				<label for="exampleInputEmail1">SSN</label>
				<input type="text" name="ssn" value="${customerBean.ws_ssn}" readonly placeholder="Enter SSN" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
				
				<label for="exampleInputEmail1">Customer Id</label>
			  	<input type="text" name="customerid" value="${customerBean.ws_cust_id}" readonly placeholder="Enter Customer Id" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
			
			
				<label for="exampleInputEmail1">Email id</label>
				<input type="email" name="email" value="${customerBean.ws_email_id}" readonly placeholder="Enter email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
				
			
				<label for="exampleInputEmail1">Password</label>
				<input type="text" name="password" value="${customerBean.ws_password}"  placeholder="Enter Password" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
				
			
				<label for="exampleInputEmail1">Name</label>
				<input type="text" name="name" value="${customerBean.ws_name}"  placeholder="Enter name" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
				
			
				<label for="exampleInputEmail1">Address </label>
				<input type="text" name="address" value="${customerBean.ws_adrs}"  placeholder="Enter address" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
			
			
				<label for="exampleInputEmail1">City </label>
				<input type="text" name="city" value="${customerBean.ws_city}"  placeholder="Enter City" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
			
				<label for="exampleInputEmail1">State </label>
				<input type="text" name="state" value="${customerBean.ws_state}"  placeholder="Enter State" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
			
				<label for="exampleInputEmail1">Age </label>
				<input type="text" name="age" value="${customerBean.ws_age}"  placeholder="Enter Age" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			
			
			
			
		
		<input type="submit" id="submit" value="Update" class="btn btn-primary">
		
				<h3 style="color: red;"><%=updateError == null ? "" : updateError %></h3>
			<h3 style="color: green;"><%=updatemsg == null ? "" : updatemsg %></h3>
		
		
		</div>

	</form>
	</div>
	<br>
	<br>


</body>
</html>