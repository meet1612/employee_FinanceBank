<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Finance Bank</title>
</head>
<style>
.div1{
width:50%;
border:1px solid black;
margin-left:350px;
margin-top:100px;

box-shadow: 5px 5px 5px 5px #888888;
}
td{
text-align:center;
}

input[type="submit"]{
	width:95%;
}
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<script type="text/javascript" src="account_delete.js"></script>

	<%
		String insertError = (String) request.getAttribute("insertError");
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<form action="AccountController?operation=<%=operation%>" method="post">

<div class="div1">
	
	<div class="container" >
              
  <table class="table">
    <thead>
      <tr>
				<th style="text-align:center">Search Options</th>
				<th></th>
			</tr>
    </thead>

	<tbody>
	<tr>
	<td><input type="number" id="acc_in" onblur="acc_check()" onkeyup="acc_check()" oninput="this.value = Math.abs(this.value)" name="accountid" placeholder="Enter Account Id" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" style="margin-left:25px" autofocus></td>
	<td><span id="acc_err" style="display:block;color:red;"></span></td> 
	</tr>
	<tr>
	<td colspan="2"><input type="submit" id="delete_btn" class="btn btn-dark" value="Delete Account" disabled></td>
	</tr>
	</tbody>
  </table>
  <h3 style="color: red;"><%=insertError == null ? "" : insertError %></h3>
</div>
</div>
		
</form>
</body>
</html>