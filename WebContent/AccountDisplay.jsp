<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<title>Display Account</title>
<style>
table 
	{
  		border-collapse: collapse;
  		margin-left:auto;
  		margin-right:auto;
	}
	table, td, tr 
	{
	  border: 1px solid black;
	}

@media
	  only screen 
    and (max-width: 760px), (min-device-width: 768px) 
    and (max-device-width: 1024px)  {

		/* Force table to not be like tables anymore */
		table, thead, tbody, th, td, tr {
			display: block;
		}

		/* Hide table headers (but not display: none;, for accessibility) */
		thead tr {
			position: absolute;
			top: -9999px;
			left: -9999px;
		}
		.table td, .table th {
    padding: 1.50rem 0 0.75rem 1.00rem;
    }

    tr {
      margin: 0 0 1rem 0;
    }
      
    tr:nth-child(odd) {
      background: #ccc;
    }
    
		td {
			/* Behave  like a "row" */
			border: none;
			border-bottom: 1px solid #eee;
			position: relative;
			padding-left: 50%;
		}

		td:before {
			/* Now like a table header */
			position: absolute;
			/* Top/left values mimic padding */
			top: 0;
			left: 6px;
			width: 45%;
			padding-right: 10px;
			white-space: nowrap;
		}

		td:nth-of-type(1):before { content: "Customer ID"; }
		td:nth-of-type(2):before { content: "Account ID"; }
		td:nth-of-type(3):before { content: "Account Type"; }
		td:nth-of-type(4):before { content: "Account Status"; }
		td:nth-of-type(5):before { content: "Account Balance"; }
		td:nth-of-type(6):before { content: "Account Creation Date"; }
	}

</style>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	



<table class="table" role="table" style="width:90%">
  	<thead class="thead-dark" role="rowgroup">
	    <tr role="row">
	      <th scope="col" role="columnheader">Customer ID</th>
	      <th scope="col" role="columnheader">Account ID</th>
	      <th scope="col" role="columnheader">Account Type</th>
	      <th scope="col" role="columnheader">Account Status</th>
	      <th scope="col" role="columnheader">Account Balance</th>
	      <th scope="col" role="columnheader">Account Creation Date</th>
	    </tr>
	  </thead>
	   
	   <tbody role="rowgroup">
	
	
	<c:forEach var="account" items="${list }">
		<tr role='row'>
		<td role='cell'>${account.ws_cust_id }</td>
		<td role='cell'>${account.ws_acct_id }</td>
		
		
		<td role='cell'>
				<c:set var = "status" scope = "session" value = "${account.ws_acct_type } "/>
				<c:set var = "statusA" scope = "session" value = "S"/>
				<c:set var = "statusI" scope = "session" value = "C"/>
				
					<c:if test="${fn:substring(statusA,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Saving"></c:out>
					</c:if>
				
					<c:if test="${fn:substring(statusI,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Current"></c:out>
					</c:if>
				
				</td>
		
		
		
		
		<td role='cell'>
				<c:set var = "status" scope = "session" value = "${account.ws_acct_status } "/>
				<c:set var = "statusA" scope = "session" value = "A"/>
				<c:set var = "statusI" scope = "session" value = "I"/>
				
					<c:if test="${fn:substring(statusA,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Active"></c:out>
					</c:if>
				
					<c:if test="${fn:substring(statusI,0,1) == fn:substring(status, 0,1)}">
					 <c:out value="Inactive"></c:out>
					</c:if>
				
				</td>
				
		<td role='cell'>${account.ws_acct_balance }</td>
		<td role='cell'>${account.ws_acct_crdate }</td>
		
		
		
		
		
		
		</tr>
	</c:forEach>
		
	</tbody>
	</table>
	<br><br>
</body>
</html>