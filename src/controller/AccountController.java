package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Account;
import bean.Customer;
import service.AccountServiceImpl;
import service.CustomerServiceImpl;
import util.EmailUtility;

public class AccountController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String operation = request.getParameter("operation");
		if(operation.equals("create"))
		{
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("AccountRegistration.jsp").include(request, response);
		}
		else if(operation.equals("delete"))
		{
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("AccountDelete.jsp").include(request, response);
		}
		else if(operation.equals("status"))
		{
			request.setAttribute("operation", operation);
			AccountServiceImpl service = new AccountServiceImpl();
			ArrayList<Account> a = service.readAllAccount();
			request.setAttribute("account", a);
			request.getRequestDispatcher("AccountStatus.jsp").include(request, response);
		}
		else if(operation.equals("search"))
		{
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("AccountSearch.jsp").include(request, response);
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String operation = request.getParameter("operation");
		if(operation.equals("create"))
		{
			Date date = new Date();
			Timestamp ts = new Timestamp(date.getTime());
			
			long ws_cust_id = Long.parseLong(request.getParameter("customerid"));
			String ws_acct_type = request.getParameter("accountType");
			String ws_acct_status = "A";
			long ws_acct_balance = Long.parseLong(request.getParameter("amount"));
			Timestamp ws_acct_crdate = ts;
			
			
			Account a = new Account();
			a.setWs_cust_id(ws_cust_id);
			a.setWs_acct_type(ws_acct_type);
			a.setWs_acct_status(ws_acct_status);
			a.setWs_acct_balance(ws_acct_balance);
			a.setWs_acct_crdate(ws_acct_crdate);
			
			
			AccountServiceImpl service = new AccountServiceImpl();
			CustomerServiceImpl service1=new CustomerServiceImpl();
			int status = service.createAccount(a);
			System.out.println("hi"+status);
			if (status > 0) 
			{
				System.out.println("Insert successfull");
				
				Customer c = new Customer();
				c = service1.getCustomerByID(ws_cust_id);
				
				 String recipient = c.getWs_email_id();
			        String subject ="Thanks for creating Account";
			        String content = "YOur account created successfully";
			 
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
			        
			        
			        
				request.setAttribute("insertmsg", "Inserted Successfully");
				request.setAttribute("operation", "create");
				request.getRequestDispatcher("AccountRegistration.jsp").include(request, response);
			} 
			else 
			{
				System.out.println("Error occured while inserting data");
				request.setAttribute("insertError", "Invalid Fields !!");
				request.setAttribute("operation", "create");
				request.getRequestDispatcher("AccountRegistration.jsp").include(request, response);
			}
		}
		else if(operation.equals("delete"))
		{
			long ws_acct_id = Long.parseLong(request.getParameter("accountid")); 
			Account a = new Account();
			a.setWs_acct_id(ws_acct_id);
			
			AccountServiceImpl service = new AccountServiceImpl();
			int status = service.updateAccountStatus(a);
			if (status > 0) 
			{
				System.out.println("Delete successfull");
				response.sendRedirect("index.jsp");
			} 
			else 
			{
				System.out.println("Error occured while delete data");
				request.setAttribute("insertError", "Invalid Fields !!");
				request.setAttribute("operation", "delete");
				request.getRequestDispatcher("AccountDelete.jsp").include(request, response);
			}
		}
		else if(operation.equals("search"))
		{
			AccountServiceImpl service = new AccountServiceImpl();
			String searchBy = request.getParameter("search");
			ArrayList<Account> list = new ArrayList<Account>();
			if(searchBy.equals("cust_id"))
			{
				long custid = Long.parseLong(request.getParameter("custid"));
				Account a = new Account();
				a.setWs_cust_id(custid);
				list = service.readAllCustomerAccount(a);
				for(Account acc : list)
				{
					System.out.println(acc);
				}	
			}
			else if(searchBy.equals("acc_id"))
			{
				long accid = Long.parseLong(request.getParameter("accid"));
				Account a = new Account();
				a.setWs_acct_id(accid);
				Account acc = service.readAccount(a);
				System.out.println(acc);
				list.add(acc);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("AccountDisplay.jsp").include(request, response);
		}
	}

}
