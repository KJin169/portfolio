package kr.co.ezen.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class AcademyMemberBean {

	//학원 기본 정보
	private int a_memberNo;
	
	
	private String a_id;
	
	
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,15}$")
	private String a_pw;
	
	
	private String a_name;
	
	private String a_CRN;
	
	private String a_location;
	
	
	private String a_locationDetail;
	
	private String a_tele;
	
	private Timestamp a_joinDate;
	private int a_classify;
	private String a_infoExpose;
	
	//학원 소개 정보
	
	
	private String a_introduce;
	private String a_mainImg;
	private String a_file;
	private String a_gradeMin;
	private String a_gradeMax;
	private String a_shuttle;
	private String a_openTime;
	private String a_closeTime;
	
	
	//upload
	private MultipartFile upload_file;
	private MultipartFile upload_file2;
	public MultipartFile getUpload_file2() {
		return upload_file2;
	}

	public void setUpload_file2(MultipartFile upload_file2) {
		this.upload_file2 = upload_file2;
	}
	private boolean academymemberlogin;
	
	public MultipartFile getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

	public AcademyMemberBean() {
		this.academymemberlogin = false;
	}

	public boolean isAcademymemberlogin() {
		return academymemberlogin;
	}
	public void setAcademymemberlogin(boolean academymemberlogin) {
		this.academymemberlogin = academymemberlogin;
	}
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pw() {
		return a_pw;
	}
	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_CRN() {
		return a_CRN;
	}
	public void setA_CRN(String a_CRN) {
		this.a_CRN = a_CRN;
	}
	public String getA_location() {
		return a_location;
	}
	public void setA_location(String a_location) {
		this.a_location = a_location;
	}
	public String getA_locationDetail() {
		return a_locationDetail;
	}
	public void setA_locationDetail(String a_locationDetail) {
		this.a_locationDetail = a_locationDetail;
	}
	public String getA_tele() {
		return a_tele;
	}
	public void setA_tele(String a_tele) {
		this.a_tele = a_tele;
	}
	public Timestamp getA_joinDate() {
		return a_joinDate;
	}
	public void setA_joinDate(Timestamp a_joinDate) {
		this.a_joinDate = a_joinDate;
	}
	public int getA_classify() {
		return a_classify;
	}
	public void setA_classify(int a_classify) {
		this.a_classify = a_classify;
	}
	public String getA_infoExpose() {
		return a_infoExpose;
	}
	public void setA_infoExpose(String a_infoExpose) {
		this.a_infoExpose = a_infoExpose;
	}
	public String getA_introduce() {
		return a_introduce;
	}
	public void setA_introduce(String a_introduce) {
		this.a_introduce = a_introduce;
	}
	public String getA_mainImg() {
		return a_mainImg;
	}
	public void setA_mainImg(String a_mainImg) {
		this.a_mainImg = a_mainImg;
	}
	public String getA_file() {
		return a_file;
	}
	public void setA_file(String a_file) {
		this.a_file = a_file;
	}
	public String getA_gradeMin() {
		return a_gradeMin;
	}
	public void setA_gradeMin(String a_gradeMin) {
		this.a_gradeMin = a_gradeMin;
	}
	public String getA_gradeMax() {
		return a_gradeMax;
	}
	public void setA_gradeMax(String a_gradeMax) {
		this.a_gradeMax = a_gradeMax;
	}
	public String getA_shuttle() {
		return a_shuttle;
	}
	public void setA_shuttle(String a_shuttle) {
		this.a_shuttle = a_shuttle;
	}
	public String getA_openTime() {
		return a_openTime;
	}
	public void setA_openTime(String a_openTime) {
		this.a_openTime = a_openTime;
	}
	public String getA_closeTime() {
		return a_closeTime;
	}
	public void setA_closeTime(String a_closeTime) {
		this.a_closeTime = a_closeTime;
	}
	


	
}
