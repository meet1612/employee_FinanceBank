<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Users List</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    
    .footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #000;
   color: orange;
   text-align: center;
}

@media screen and (max-width: 600px) {
.dropdown-menu{
background-color:grey;
color: white;
}
a{
color:white !important
}
}
    </style>
</head>
<body>



	<!--<div class="navbar">
		<center><h1 style="color: orange">DMM Bank</h1></center>
  		<a href="index.jsp">Home</a>
  		<div class="dropdown">
    		<button class="dropbtn">Customer Management <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="CustomerController?operation=create">Create Customer</a>
      			<a href="CustomerController?operation=update">Update Customer</a>
      			<a href="CustomerController?operation=delete">Delete Customer</a>
      			<a href="CustomerController?operation=search">Customer Search</a>
    		</div>
  		</div> 
  		<div class="dropdown">
    		<button class="dropbtn">Account Management <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="AccountController?operation=create">Create Account</a>
      			<a href="AccountController?operation=delete">Delete Account</a>
      			<a href="AccountController?operation=search">Account Search</a>
    		</div>
  		</div> 
  		<div class="dropdown">
    		<button class="dropbtn">Status Details <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="CustomerController?operation=status">Customer Status</a>
      			<a href="AccountController?operation=status">Account Status</a>
    		</div>
  		</div> 
  	</div>
	<div class="footer">
  		<p>Copyright @2020 DMM Bank. All rights are reserved.</p>
	</div>-->
	
	
	<nav  class="navbar navbar-expand-lg navbar-light bg-dark">
	
  <a class="navbar-brand" style="color: orange" href="index.jsp">Finance Bank</a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="index.jsp" style="color:white">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" style="color:white" aria-haspopup="true" aria-expanded="false">
         Customer Management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item"  href="CustomerController?operation=create">Create Customer</a>
          <a class="dropdown-item" href="CustomerController?operation=update">Update Customer</a>
          <a class="dropdown-item" href="CustomerController?operation=delete">Delete Customer</a>
           <a class="dropdown-item" href="CustomerController?operation=search">Customer Search</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color:white" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Account Management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item"  href="AccountController?operation=create">Create Account</a>
          <a class="dropdown-item" href="AccountController?operation=delete">Delete Account</a>
          <a class="dropdown-item" href="AccountController?operation=search">Account Search</a>
        </div>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color:white" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Status Details
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="CustomerController?operation=status"">Customer Status</a>
          <a class="dropdown-item" href="AccountController?operation=status">Account Status</a>
          
        </div>
      </li>
      
     
    
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color:white" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       Transaction Management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         <a class="dropdown-item" href="TransactionController?operation=deposit">Deposit Money</a>
      			<a class="dropdown-item" href="TransactionController?operation=withdraw">Withdraw Money</a>
      			<a class="dropdown-item" href="TransactionController?operation=transfer">Transfer Money</a>
        </div>
      </li>
      
          <li class="nav-item">
        <a class="nav-link" href="LoanController?operation=loan" style="color:white">Loan Management</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="TransactionController?operation=statement" style="color:white">Account Statement</a>
      </li>
    
        
        
       
          
             <li class="nav-item">
        <a class="nav-link" href="EmployeeController"  style="color:white">Logout</a>
      </li>
      
    </ul>
  </div>
</nav> 


<div class="footer">
  		<p>Copyright @2020 Finance Bank. All rights are reserved.</p>
	</div>
	
	
</body>
</html>