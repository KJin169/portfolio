package kr.co.ezen.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class SiteAcaAskBean {

    private int a_memberNo; 
	private String a_name; 
    private String a_tele;
    @Pattern(regexp = "^[ㄱ-ㅎㅏ-ㅢ가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,300}$")
    private String aa_title;  
    @Pattern(regexp = "^[ㄱ-ㅎㅏ-ㅢ가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,1500}$")
    private String aa_contents; 
    private Timestamp aa_time;
    private String aa_file; 

    private MultipartFile upload_file;
    private String a_id;
    
	
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_tele() {
		return a_tele;
	}
	public void setA_tele(String a_tele) {
		this.a_tele = a_tele;
	}
	public String getAa_title() {
		return aa_title;
	}
	public void setAa_title(String aa_title) {
		this.aa_title = aa_title;
	}
	public String getAa_contents() {
		return aa_contents;
	}
	public void setAa_contents(String aa_contents) {
		this.aa_contents = aa_contents;
	}
	public Timestamp getAa_time() {
		return aa_time;
	}
	public void setAa_time(Timestamp aa_time) {
		this.aa_time = aa_time;
	}
	public String getAa_file() {
		return aa_file;
	}
	public void setAa_file(String aa_file) {
		this.aa_file = aa_file;
	}

    public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
}
