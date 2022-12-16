package kr.co.ezen.beans;

import javax.validation.constraints.Pattern;

public class FaqBoardBean {
	private int fb_no;
	@Pattern(regexp = "^[가-힣0-9a-zA-Z.,#?!@$%^&*-~ ]{1,900}$")
	private String fb_contentsQ;
	@Pattern(regexp = "^[가-힣0-9a-zA-Z.,#?!@$%^&*-~ ]{1,900}$")
	private String fb_contentsA;
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_contentsQ() {
		return fb_contentsQ;
	}
	public void setFb_contentsQ(String fb_contentsQ) {
		this.fb_contentsQ = fb_contentsQ;
	}
	public String getFb_contentsA() {
		return fb_contentsA;
	}
	public void setFb_contentsA(String fb_contentsA) {
		this.fb_contentsA = fb_contentsA;
	}
	
}
