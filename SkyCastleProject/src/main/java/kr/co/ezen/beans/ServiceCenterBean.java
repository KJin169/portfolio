package kr.co.ezen.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class ServiceCenterBean{

	private int nb_no;
	
	@Pattern(regexp = "^[가-힣0-9a-zA-Z#?!@$%^&*-.,~ ]{1,3000}$")
	private String nb_title;
	
	@NotBlank
	private String nb_contents;
	
	private Timestamp nb_writeTime;
	private Timestamp nb_modifyTime;
	private String nb_file;
	private String nb_viewCount;

	
	//DB에 없음
	private String nb_writer;
	private MultipartFile upload_file;
	private String searchKeyword;
		
	public int getNb_no() {
		return nb_no;
	}
	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}
	public String getNb_title() {
		return nb_title;
	}
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}
	public String getNb_contents() {
		return nb_contents;
	}
	public void setNb_contents(String nb_contents) {
		this.nb_contents = nb_contents;
	}
	public Timestamp getNb_writeTime() {
		return nb_writeTime;
	}
	public void setNb_writeTime(Timestamp nb_writeTime) {
		this.nb_writeTime = nb_writeTime;
	}
	public Timestamp getNb_modifyTime() {
		return nb_modifyTime;
	}
	public void setNb_modifyTime(Timestamp nb_modifyTime) {
		this.nb_modifyTime = nb_modifyTime;
	}
	public String getNb_file() {
		return nb_file;
	}
	public void setNb_file(String nb_file) {
		this.nb_file = nb_file;
	}
	public String getNb_viewCount() {
		return nb_viewCount;
	}
	public void setNb_lookCount(String nb_viewCount) {
		this.nb_viewCount = nb_viewCount;
	}
	public String getNb_writer() {
		return nb_writer;
	}
	public void setNb_writer(String nb_writer) {
		this.nb_writer = nb_writer;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
}