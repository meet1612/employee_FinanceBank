<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,bean.Customer"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Finance Bank</title>
<style>
.des_table{
	display:block;
	width:100%;
}
.mob_table{
	display:none;
}
@media screen and (max-width: 600px) {
 .des_table{
    display:none;
  }
 
  
  .mob_table{
  	display:block;
  }
}
</style>



</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<form action="CustomerController?operation=deletecustomer" class="des_table" method="post">

		<table class="table">
		<thead>
			<th>SSN</th>
			<th>Customer Id</th>
			<th>Email  Id</th>
			<th>Name</th>
			<th>Address </th>
			<th>City</th>
			<th>State</th>
			<th>Age</th>
			<th>Status</th>
		</thead>
			<tr>
				<td>${customerBean.ws_ssn}</td>
				<td>${customerBean.ws_cust_id}</td>
				<td>${customerBean.ws_email_id}</td>
				<td>${customerBean.ws_name}</td>
				<td>${customerBean.ws_adrs}</td>
				<td>${customerBean.ws_city}</td>
				<td>${customerBean.ws_state}</td>
				<td>${customerBean.ws_age}</td>
				<td>${customerBean.ws_status}</td>
			</tr>
			
			<tr>
			<%
			Customer c=(Customer)request.getAttribute("customerBean");
			if(c.getWs_status()=='I')
			{
			%>
				<td colspan="9" style="text-align:center;"><input type="submit" class="btn btn-danger" disabled id="del" value="Delete"></td>
			<%
			}
			else{
			%>
				<td colspan="9" style="text-align:center;"><input type="submit" class="btn btn-danger" id="del" value="Delete"></td>
			<%
			}
			%>
			</tr>
			<tr>
				<td colspan="9">${deleteError}</td>
			</tr>
		</table>
		<input type="hidden" name="ssn" value="${customerBean.ws_ssn}" readonly>
				<input type="hidden"  name="customerid" value="${customerBean.ws_cust_id}" readonly>
			<input type="hidden" name="email" value="${customerBean.ws_email_id}" readonly>
				<input type="hidden" name="name" value="${customerBean.ws_name}" readonly>
				<input type="hidden" name="address" value="${customerBean.ws_adrs}" readonly>
				<input type="hidden" name="city" value="${customerBean.ws_city}" readonly>
				<input type="hidden" name="state" value="${customerBean.ws_state}" readonly>
				<input type="hidden" name="age" value="${customerBean.ws_age}" readonly>
				<input type="hidden" name="status" value="${customerBean.ws_status}" readonly>
		</form>
		<form action="CustomerController?operation=deletecustomer" class="mob_table" method="post">
		<table class="table">
		<tr>
			<th>SSN</th>
			<td>${customerBean.ws_ssn}</td>
		</tr>
		<tr>
			<th>Customer Id</th>
			<td>${customerBean.ws_cust_id}</td>
		</tr>
		<tr>
			<th>Email  Id</th>
			<td>${customerBean.ws_email_id}</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>${customerBean.ws_name}</td>
		</tr>
		<tr>
			<th>Address </th>
			<td>${customerBean.ws_adrs}</td>
		</tr>
		<tr>
			<th>City</th>
			<td>${customerBean.ws_city}</td>
		</tr>
		<tr>
			<th>State</th>
			<td>${customerBean.ws_state}</td>
		</tr>
		<tr>
			<th>Age</th>
			<td>${customerBean.ws_age}</td>
		</tr>
		<tr>
			<th>Status</th>
			<td>
				<c:set var = "status" scope = "session" value = "${customerBean.ws_status} "/>
				<c:set var = "statusA" scope = "session" value = "A"/>
				<c:set var = "statusI" scope = "session" value = "I"/>
				
					<c:if test="${fn:substring(statusA,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Active"></c:out>
					</c:if>
				
					<c:if test="${fn:substring(statusI,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Inactive"></c:out>
					</c:if>
				
				</td>
		</tr>
		<tr>
		</tr>
		<tr>
				<%
			Customer c1=(Customer)request.getAttribute("customerBean");
			if(c1.getWs_status()=='I')
			{
			%>
				<td colspan="1" style="text-align:center;"><input type="submit" class="btn btn-danger" disabled id="del" value="Delete"></td>
			<%
			}
			else{
			%>
				<td colspan="1" style="text-align:center;"><input type="submit" class="btn btn-danger" id="del" value="Delete"></td>
			<%
			}
			%>
			<td colspan="1">${deleteError}</td>
		</tr>
		
		</table>
		<input type="hidden" name="ssn" value="${customerBean.ws_ssn}" readonly>
				<input type="hidden"  name="customerid" value="${customerBean.ws_cust_id}" readonly>
			<input type="hidden" name="email" value="${customerBean.ws_email_id}" readonly>
				<input type="hidden" name="name" value="${customerBean.ws_name}" readonly>
				<input type="hidden" name="address" value="${customerBean.ws_adrs}" readonly>
				<input type="hidden" name="city" value="${customerBean.ws_city}" readonly>
				<input type="hidden" name="state" value="${customerBean.ws_state}" readonly>
				<input type="hidden" name="age" value="${customerBean.ws_age}" readonly>
				<input type="hidden" name="status" value="${customerBean.ws_status}" readonly>
		</form>
	<br>
	<br>


</body>
</html>