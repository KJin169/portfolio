package kr.co.ezen.beans;

import java.sql.Timestamp;

public class AcademyPayBean {

	private Timestamp a_payStart;
	private Timestamp a_payEnd;
	private String a_memberNo;
	private String amount;
	
	
	
	public Timestamp getA_payStart() {
		return a_payStart;
	}
	public void setA_payStart(Timestamp a_payStart) {
		this.a_payStart = a_payStart;
	}
	public Timestamp getA_payEnd() {
		return a_payEnd;
	}
	public void setA_payEnd(Timestamp a_payEnd) {
		this.a_payEnd = a_payEnd;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(String a_memberNo) {
		this.a_memberNo = a_memberNo;
	}

	
	
}
