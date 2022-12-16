package kr.co.ezen.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class AcademyTeacherBean {

	private int a_memberNo;
	
	
	@Pattern(regexp = "^[가-힣]{2,20}")
	private String t_name;
	
	@NotBlank
	private String t_subject;
	
	@Pattern(regexp = "^[가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,1000}$")
	private String t_contents;
	
	private String t_file;
	private String a_name;
	
	
	
	private MultipartFile upload_file;
	
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_subject() {
		return t_subject;
	}
	public void setT_subject(String t_subject) {
		this.t_subject = t_subject;
	}
	public String getT_contents() {
		return t_contents;
	}
	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}
	public String getT_file() {
		return t_file;
	}
	public void setT_file(String t_file) {
		this.t_file = t_file;
	}
	

}
