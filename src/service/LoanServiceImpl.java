package service;

import java.util.ArrayList;

import bean.Loan;

import dao.LoanDao;

public class LoanServiceImpl implements LoanService {

	@Override
	public ArrayList<Loan> readAllLoan() {
		return LoanDao.readAllLoan();
		
	}

	@Override
	public Loan readLoan(Loan l) {
		return LoanDao.readLoan(l);
	}

	@Override
	public int updateLoanStatus(Loan l) {
		return LoanDao.updateLoanStatus(l);
	}
	

}
