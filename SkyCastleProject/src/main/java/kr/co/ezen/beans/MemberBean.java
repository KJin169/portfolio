package kr.co.ezen.beans;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberBean {
	private int m_classify;
	private int m_memberNo;
	
	private String m_id;
	
	
	@Pattern(regexp = "^[0-9a-zA-Z#?!@$%^&*-]{8,15}$")
	private String m_pw;
	
	private String m_pw2;
	
	
	@Pattern(regexp = "^[가-힣]{2,20}$")
	private String m_name;
	
	private String m_birth;
	private int m_gender;
	
	@Pattern(regexp = "^\\d{2,3}\\d{3,4}\\d{4}$")
	private String m_tele;
	
	private Timestamp m_joinDate;
	private String m_recommend;
	
	@Pattern(regexp = "^[0-9a-zA-Z]*@[0-9a-zA-Z]*.[a-zA-Z]{2,3}$")
	private String m_email;
	
	private String m_confirm;
	
	private boolean memberlogin;
	
	
	
	private boolean userlogin;
	
	private String searchKeyword;
	
	//생성자 주입 단, 한번만 실행
	public MemberBean() {
		
		this.userlogin = false;
	}
	
	
	public String getM_pw2() {
		return m_pw2;
	}

	public void setM_pw2(String m_pw2) {
		this.m_pw2 = m_pw2;
	}

	public boolean isMemberlogin() {
		return memberlogin;
	}
	public void setMemberlogin(boolean memberlogin) {
		this.memberlogin = memberlogin;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_classify() {
		return m_classify;
	}
	public void setM_classify(int m_classify) {
		this.m_classify = m_classify;
	}
	public int getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(int m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_gender() {
		return m_gender;
	}
	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_tele() {
		return m_tele;
	}
	public void setM_tele(String m_tele) {
		this.m_tele = m_tele;
	}
	public Timestamp getM_joinDate() {
		return m_joinDate;
	}
	public void setM_joinDate(Timestamp m_joinDate) {
		this.m_joinDate = m_joinDate;
	}
	public String getM_recommend() {
		return m_recommend;
	}
	public void setM_recommend(String m_recommend) {
		this.m_recommend = m_recommend;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_confirm() {
		return m_confirm;
	}
	public void setM_confirm(String m_confirm) {
		this.m_confirm = m_confirm;
	}
	public boolean isUserlogin() {
		return userlogin;
	}
	public void setUserlogin(boolean userlogin) {
		this.userlogin = userlogin;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
}
