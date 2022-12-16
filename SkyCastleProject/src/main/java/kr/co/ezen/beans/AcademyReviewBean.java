package kr.co.ezen.beans;

import java.sql.Timestamp;

public class AcademyReviewBean {

	private int a_memberNo;
	private int r_no;
	private int r_writerNo;
	private String r_writerId;
	private String r_contents;
	private int r_score;
	private Timestamp r_writeTime;
	
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_writerNo() {
		return r_writerNo;
	}
	public void setR_writerNo(int r_writerNo) {
		this.r_writerNo = r_writerNo;
	}
	public String getR_writerId() {
		return r_writerId;
	}
	public void setR_writerId(String r_writerId) {
		this.r_writerId = r_writerId;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public Timestamp getR_writeTime() {
		return r_writeTime;
	}
	public void setR_writeTime(Timestamp r_writeTime) {
		this.r_writeTime = r_writeTime;
	}

}
