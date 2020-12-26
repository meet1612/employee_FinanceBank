package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;
import service.CustomerServiceImpl;
import util.EmailUtility;

public class CustomerController extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		//System.out.println("in get method : operation : "+operation);
		if(operation.equals("create"))
		{
			//System.out.println("in equals method....");
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("RegistrationCustomer.jsp").include(request, response);
		}
		else if(operation.equals("update"))
		{
			//System.out.println("in equals method....");
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("SearchCustomerOption.jsp").include(request, response);
		}
		else if(operation.equals("delete"))
		{
			//System.out.println("in equals method....");
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("SearchCustomerOption.jsp").include(request, response);
		}
		else if(operation.equals("search"))
		{
			System.out.println("in equals method...."+operation);
			request.setAttribute("operation", operation);
//			request.getRequestDispatcher("SearchCustomerOption.jsp").include(request, response);
			RequestDispatcher rd=request.getRequestDispatcher("SearchCustomerOption.jsp");  
	        rd.forward(request, response);  
		}
		else if(operation.equals("status"))
		{
			System.out.println("in equals method...."+operation);
			request.setAttribute("operation", operation);
			CustomerServiceImpl service = new CustomerServiceImpl();
			ArrayList<Customer> c = service.readAllcustomer();
			request.setAttribute("customer", c);
	        request.getRequestDispatcher("CustomerStatus.jsp").include(request, response);
		}
	}
	
	
	 private String host;
	    private String port;
	    private String user;
	    private String pass;
	 
	    public void init() {
	        // reads SMTP server setting from web.xml file
	        ServletContext context = getServletContext();
	        host = context.getInitParameter("host");
	        port = context.getInitParameter("port");
	        user = context.getInitParameter("user");
	        pass = context.getInitParameter("pass");
	    }
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		System.out.println("in post method : operation : "+operation);
		
		if(operation.equals("create"))
		{
			long ssn = Long.parseLong(request.getParameter("ssn"));
			//long customerid = Long.parseLong(request.getParameter("customerid"));
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int age = Integer.parseInt(request.getParameter("age"));

			System.out.println("ssn : " + ssn);
			//System.out.println("custid : " + customerid);
			System.out.println("name : " + name);
			System.out.println("email"+ email);
			System.out.println("password"+ password);
			System.out.println("address : " + address);
			System.out.println("city : " + city);
			System.out.println("state : " + state);
			System.out.println("age : " + age);

			Customer c = new Customer();
			c.setWs_ssn(ssn);
			//c.setWs_cust_id(customerid);
			c.setWs_email_id(email);
			c.setWs_password(password);
			c.setWs_name(name);
			c.setWs_adrs(address);
			c.setWs_age(age);
			c.setWs_city(city);
			c.setWs_state(state);
			c.setWs_status('A');


		

			CustomerServiceImpl service = new CustomerServiceImpl();
			int status = service.createCustomer(c);

			if (status > 0) {
				
				 String recipient = c.getWs_email_id();
			        String subject ="Thanks for joining with finance bank";
			        String content = "Customer Created successfully";
			 
			        String resultMessage = "";
			 
			        try {
			            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
			                    content);
			            resultMessage = "The e-mail was sent successfully";
			        } catch (Exception ex) {
			            ex.printStackTrace();
			            resultMessage = "There were an error: " + ex.getMessage();
			        } finally {
			           System.out.println("hello"+resultMessage);
			        }

				
				System.out.println("Insert successfull");
				//response.sendRedirect("index.jsp");
				request.setAttribute("insertmsg","Inserted Successfully");
				request.setAttribute("operation", "create");
				request.getRequestDispatcher("RegistrationCustomer.jsp").include(request, response);
			} else {
				System.out.println("Error occured while inserting data");
				request.setAttribute("insertError", "Invalid Fields !!");
				request.setAttribute("operation", "create");
				request.getRequestDispatcher("RegistrationCustomer.jsp").include(request, response);
			}
		}
		else if(operation.equals("search") || operation.equals("update") || operation.equals("delete"))
		{
			CustomerServiceImpl service = new CustomerServiceImpl();
			String searchBy = request.getParameter("search");
			System.out.println("SearchBy : "+searchBy);
			System.out.println("search vadu if : "+operation);
			
			Customer c = new Customer();
			if(searchBy.equals("ssn"))
			{
				long ssn = Long.parseLong(request.getParameter("ssn"));
				c = service.getCustomerBySSN(ssn);
			}
			else if(searchBy.equals("custid"))
			{
				long custid = Long.parseLong(request.getParameter("custid"));
				c = service.getCustomerByID(custid);
			}
			request.setAttribute("customerBean", c);
			
			
			if(operation.equals("search"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("DisplayCustomer.jsp");  
				rd.forward(request, response);
			}
			else if(operation.equals("delete"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("DeleteCustomer.jsp");  
				rd.forward(request, response);
			}
			else if(operation.equals("update"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("UpdateCustomer.jsp");  
				rd.forward(request, response);
			}
		}
		else if(operation.equals("deletecustomer"))
		{
			CustomerServiceImpl service = new CustomerServiceImpl();
			long custid = Long.parseLong(request.getParameter("customerid"));
			System.out.println("Deleting customer with cust id : "+custid);
			
			int status = service.deleteCustomer(custid);
			if(status>0)
			{
				System.out.println("Delete successfull");
				response.sendRedirect("index.jsp");
			}
			else {
				System.out.println("Error occured while deleting data");
				request.setAttribute("deleteError", "Unable to Delete !!");
				request.getRequestDispatcher("DeleteCustomer.jsp").include(request, response);
			}
		}
		else if(operation.equals("updatecustomer"))
		{
			CustomerServiceImpl service = new CustomerServiceImpl();
			long ssn = Long.parseLong(request.getParameter("ssn"));
			long customerid = Long.parseLong(request.getParameter("customerid"));
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int age = Integer.parseInt(request.getParameter("age"));

			System.out.println("updating customer with cust id : "+customerid);

			Customer c = new Customer();
			c.setWs_ssn(ssn);
			c.setWs_cust_id(customerid);
			c.setWs_email_id(email);
			c.setWs_password(password);
			
			c.setWs_name(name);
			c.setWs_adrs(address);
			c.setWs_city(city);
			c.setWs_state(state);
			c.setWs_age(age);
			
			
			
			int status = service.updateCustomer(c);
			if(status>0)
			{
				System.out.println("Update successfull");
				request.setAttribute("updatemsg", "Updated Successfully!");
				request.setAttribute("customerBean", c);
				request.getRequestDispatcher("UpdateCustomer.jsp").include(request, response);
			}
			else {
				System.out.println("Error occured while updating data");
				request.setAttribute("updateError", "Unable to Update !!");
				request.setAttribute("customerBean", c);
				request.getRequestDispatcher("UpdateCustomer.jsp").include(request, response);
			}
		}
		

		

	}

}
