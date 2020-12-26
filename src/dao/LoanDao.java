package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Account;
import bean.Loan;
import util.DbConnection;

public class LoanDao {
	
	public static ArrayList<Loan> readAllLoan() {
		ArrayList<Loan> loan = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from loan");
			while (rs.next()) {
				Loan l = new Loan();
				l.setLoan_id(rs.getInt(1));
				l.setAcc_id(rs.getInt(2));
				l.setLoan_amt(rs.getLong(3));
				l.setStatus(rs.getInt(4));
				l.setEmi(rs.getFloat(5));
				l.setMonths(rs.getInt(6));
				loan.add(l);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return loan;
	}
	
	
	public static Loan readLoan(Loan l) {
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from loan where loan_id = ?");
			ps.setLong(1, l.getLoan_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				l.setLoan_id(rs.getInt(1));
				l.setAcc_id(rs.getInt(2));
				l.setLoan_amt(rs.getLong(3));
				l.setStatus(rs.getInt(4));
				l.setEmi(rs.getFloat(5));
				l.setMonths(rs.getInt(6));
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}
	
	public static int updateLoanStatus(Loan l) {
		int status = 0;
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update loan set status = ? where loan_id = ?");
			ps.setInt(1, l.getStatus());
			ps.setInt(2, l.getLoan_id());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

}
