package kr.co.ezen.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class SiteAskBean {
	
	private int sa_memberNo;
	@Pattern(regexp = "^\\d{2,3}\\d{3,4}\\d{4}$")
	private String sa_tele;
	private Timestamp sa_time;
	@Pattern(regexp = "^[ㄱ-ㅎㅏ-ㅢ가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,300}$")
	private String sa_title;
	@Pattern(regexp = "^[ㄱ-ㅎㅏ-ㅢ가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,500}$")
	private String sa_contents;
	private String sa_file;
	
	private MultipartFile upload_file;	 
	
	private int m_memberNo;
	public int getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(int m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	private String m_id;
	private String m_name;
	private String m_email;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getSa_memberNo() {
		return sa_memberNo;
	}
	public void setSa_memberNo(int sa_memberNo) {
		this.sa_memberNo = sa_memberNo;
	}
	public String getSa_tele() {
		return sa_tele;
	}
	public void setSa_tele(String sa_tele) {
		this.sa_tele = sa_tele;
	}
	public Timestamp getSa_time() {
		return sa_time;
	}
	public void setSa_time(Timestamp sa_time) {
		this.sa_time = sa_time;
	}
	public String getSa_title() {
		return sa_title;
	}
	public void setSa_title(String sa_title) {
		this.sa_title = sa_title;
	}
	public String getSa_contents() {
		return sa_contents;
	}
	public void setSa_contents(String sa_contents) {
		this.sa_contents = sa_contents;
	}
	public String getSa_file() {
		return sa_file;
	}
	public void setSa_file(String sa_file) {
		this.sa_file = sa_file;
	}
	
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	
}

