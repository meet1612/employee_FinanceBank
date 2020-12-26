package service;

import bean.Employee;
import dao.EmployeeDao;

public class EmployeeServiceImpl implements EmployeeService {
	
	@Override
	public boolean check(Employee e) 
	{
		return EmployeeDao.check(e);
	}

}
