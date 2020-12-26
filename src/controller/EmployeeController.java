package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Employee;
import service.EmployeeServiceImpl;

public class EmployeeController  extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	// Login functionality
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ws_username = request.getParameter("username");
		String ws_password = request.getParameter("password");
		Date date = new Date();
		Timestamp ws_timestamp = new Timestamp(date.getTime());
		
		Employee e = new Employee();
		e.setWs_username(ws_username);
		e.setWs_password(ws_password);
		e.setWs_timestamp(ws_timestamp);
		
		EmployeeServiceImpl service = new EmployeeServiceImpl();
		boolean status = service.check(e); 
		if(status)
		{
			HttpSession session = request.getSession();
			session.setAttribute("login", true);
			session.setAttribute("username", e.getWs_username());
//			session.setAttribute("password", l.getWs_password());
			session.setAttribute("timestamp", e.getWs_timestamp());
//			response.sendRedirect("AccountController?operation=create");
			response.sendRedirect("index.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("loginError", "Invalid Credentials !!");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	        rd.forward(request, response); 
		}
	}


}
