package service;

import java.util.ArrayList;


import bean.Loan;

public interface LoanService {

	public ArrayList<Loan> readAllLoan();
	public Loan readLoan(Loan l);
	public int updateLoanStatus(Loan l);
}
