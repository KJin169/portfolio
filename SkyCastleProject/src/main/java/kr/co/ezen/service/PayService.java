package kr.co.ezen.service;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.dao.PayDAO;

@Service
public class PayService {

	@Autowired
	PayDAO payDAO;

	// 개월수별 insert
	public void insert_1month(AcademyPayBean academyPayBean) {
		payDAO.insert_1month(academyPayBean);
	}

	public void insert_6month(AcademyPayBean academyPayBean) {
		payDAO.insert_6month(academyPayBean);
	}

	public void insert_1year(AcademyPayBean academyPayBean) {
		payDAO.insert_1year(academyPayBean);
	}

	// 개월수별 update
	public void add_amonth(int a_memberNo, Timestamp a_paystart) {
		payDAO.add_amonth(a_memberNo, a_paystart);
	}

	public void add_halfyear(int a_memberNo, Timestamp a_paystart) {
		payDAO.add_halfyear(a_memberNo, a_paystart);
	}

	public void add_ayear(int a_memberNo, Timestamp a_paystart) {
		payDAO.add_ayear(a_memberNo, a_paystart);
	}

	// 테이블 a_memberNo 중복검사
	public int check_duplication(HttpServletResponse response, int iano) throws Exception {

		response.setContentType("text/html;charset=utf-8");

		int cd = payDAO.check_duplication(iano);
		PrintWriter out = response.getWriter();

		// a_memberNo로 테이블 중복조회
		if (cd == 0) {
			out.print("등록되지 않은 아이디입니다. 멤버십 가입을 환영합니다.");
			out.close();

		} else {
			out.print("항상 이용해주셔서 감사합니다.");
			out.close();
		}
		return cd;
	}

	// DB table에서 마지막 결제일 조회

	public Timestamp check_latestpay(int a_memberNo) {
		Timestamp payend = payDAO.check_latestpay(a_memberNo);
		System.out.println("//TEST// payend: " + payend);
		return payend;
	}

	// a_payend가 마지막날짜인 DB정보의 시작일자 조회
	public Timestamp check_startday(int a_memberNo) {
		Timestamp paystart = payDAO.check_startday(a_memberNo);
		System.out.println("//TEST// paystart: " + paystart);
		return paystart;
	}

}
