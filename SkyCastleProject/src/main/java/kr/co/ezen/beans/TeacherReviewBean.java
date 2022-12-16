package kr.co.ezen.beans;

import java.sql.Timestamp;

public class TeacherReviewBean {

	private int a_memberNo;
	private String t_name;
	private int t_reNo;
	private int t_reWriterNo;
	private String t_reWriterId;
	private String t_reContents;
	private int t_score;
	private Timestamp t_reWriteTime;
	
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
	public int getT_reNo() {
		return t_reNo;
	}
	public void setT_reNo(int t_reNo) {
		this.t_reNo = t_reNo;
	}
	public int getT_reWriterNo() {
		return t_reWriterNo;
	}
	public void setT_reWriterNo(int t_reWriterNo) {
		this.t_reWriterNo = t_reWriterNo;
	}
	public String getT_reWriterId() {
		return t_reWriterId;
	}
	public void setT_reWriterId(String t_reWriterId) {
		this.t_reWriterId = t_reWriterId;
	}
	public String getT_reContents() {
		return t_reContents;
	}
	public void setT_reContents(String t_reContents) {
		this.t_reContents = t_reContents;
	}
	public int getT_score() {
		return t_score;
	}
	public void setT_score(int t_score) {
		this.t_score = t_score;
	}
	public Timestamp getT_reWriteTime() {
		return t_reWriteTime;
	}
	public void setT_reWriteTime(Timestamp t_reWriteTime) {
		this.t_reWriteTime = t_reWriteTime;
	}

}
