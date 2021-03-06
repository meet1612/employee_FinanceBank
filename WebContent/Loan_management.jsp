<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,bean.Loan"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Finance Bank</title>
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

		td:nth-of-type(1):before { content: "Account Id"; }
		td:nth-of-type(2):before { content: "Loan Amount"; }
		td:nth-of-type(3):before { content: "Status"; }
		td:nth-of-type(4):before { content: "EMi"; }
		td:nth-of-type(5):before { content: "Duration(in Months)"; }
		
		td:nth-of-type(6):before { content: "Action"; }
	}
	
</style>
<script type="text/javascript" src="loanManagement.js"></script>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	
	
	<table class="table" role="table" style="width:90%">
  <thead class="thead-dark" role="rowgroup">
    <tr role="row">
      <th scope="col" role="columnheader">Account Id</th>
      <th scope="col" role="columnheader">Loan Amount</th>
      <th scope="col" role="columnheader">Status</th>
      <th scope="col" role="columnheader">EMI</th>
      <th scope="col" role="columnheader">Duration(in months)</th>
      <th scope="col" role="columnheader">Action</th>
    </tr>
  </thead>
  <tbody role="rowgroup">
    
      <%
		ArrayList<Loan> l = (ArrayList)request.getAttribute("loan");
		for(Loan t:l)
		{
			out.println("<tr role='row' id = "+t.getLoan_id()+">");
			
			out.print("<td role='cell'>"+t.getAcc_id()+"</td>");
			out.print("<td role='cell'>"+t.getLoan_amt()+"</td>");
			if(t.getStatus()==0)
			{
				out.print("<td role='cell'>Requested</td>");
			}
			else if(t.getStatus()==1)
			{
				out.print("<td role='cell'>Waiting for doc check</td>");
			}
			else if(t.getStatus()==2)
			{
				out.print("<td role='cell'>Waiting for acceptance</td>");
			}
			else if(t.getStatus()==3)
			{
				out.print("<td role='cell'>Approved</td>");
			}
			else if(t.getStatus()==4)
			{
				out.print("<td role='cell'>Rejected</td>");
			}
			else
			{
				out.print("<td role='cell'>Invalid</td>");
			}
			out.print("<td role='cell'>"+t.getEmi()+"</td>");
			out.print("<td role='cell'>"+t.getMonths()+"</td>");
	if(t.getStatus()==4)
	{
		out.println("<td>No Action Required</td>");
	}
	else
	{
			out.println("<td role='cell'><a href='LoanController?operation=loanStatus&loan_id="+t.getLoan_id()+"'> Details </a></td>");
	}
			out.println("</tr>");
		}
	%>
  </tbody>
</table>

<br>
<br>
	
</body>
</html>