<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Finance Bank</title>
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
	width:100%;
}
</style>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script type="text/javascript" src="SearchCustomer.js"></script>
	<%
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	
<form action="CustomerController?operation=<%=operation %>" method="post">

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
	<td><input type="radio" id="ssn_rb" onchange="onRadioChange()" name="search" value="ssn" checked="checked"> Search by SSN </td>
	<td><input type="number" oninput="this.value = Math.abs(this.value)" id="ssn_in" onblur="ssn_check()" onkeyup="ssn_check()" class="form-control" placeholder="SSN" name="ssn"  aria-describedby="basic-addon1"></td>
	<td><span id="ssn_err" style="display:block;color:red;"></span></td>
	</tr>
	<tr>
	<td><input type="radio" id="id_rb" onchange="onRadioChange()" name="search" value="custid"> Search by ID </td>
	<td><input type="number" oninput="this.value = Math.abs(this.value)" id="id_in" onblur="id_check()" onkeyup="id_check()"  name="custid" class="form-control" placeholder="Customer Id"  aria-describedby="basic-addon1" disabled></td>
	<td><span id="id_err" style="display:block;color:red;"></span></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" id="search_btn" class="btn btn-dark" value="Search" disabled></td>
	</tr>
	</tbody>
  </table>
</div>
</div>
</form>

</body>
</html>