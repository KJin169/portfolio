package kr.co.ezen.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberChildBean {

	private int m_memberNo;
	
	
	@Pattern(regexp = "^[가-힣]{2,20}")
	private String c_name;
	
	private String c_grade;
	
	private String c_gender;
	
	private	String c_level;
	
	public int getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(int m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_grade() {
		return c_grade;
	}
	public void setC_grade(String c_grade) {
		this.c_grade = c_grade;
	}
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public String getC_level() {
		return c_level;
	}
	public void setC_level(String c_level) {
		this.c_level = c_level;
	}
	
	
	
}
