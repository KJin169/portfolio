package kr.co.ezen.dao;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.mapper.PayMapper;

@Repository
public class PayDAO {

	@Autowired
	PayMapper payMapper;

	//개월수별 insert 
	public void insert_1month(AcademyPayBean academyPayBean) {
		payMapper.insert_1month(academyPayBean);
	}
	public void insert_6month(AcademyPayBean academyPayBean) {
		payMapper.insert_6month(academyPayBean);
	}
	public void insert_1year(AcademyPayBean academyPayBean) {
		payMapper.insert_1year(academyPayBean);
	}

	//개월수별 update
	public void add_amonth(int a_memberNo, Timestamp a_payStart) {
		payMapper.add_amonth(a_memberNo, a_payStart);
	}

	public void add_halfyear(int a_memberNo, Timestamp a_paystart) {
		payMapper.add_halfyear(a_memberNo, a_paystart);
	}

	public void add_ayear(int a_memberNo, Timestamp a_paystart) {
		payMapper.add_ayear(a_memberNo, a_paystart);
	}
	
	//테이블에 이미 등록되어있는지 확인 => 중복 체크
	public int check_duplication(int a_memberNo) {
		return payMapper.check_duplication(a_memberNo);
	}
	
	//DB에서 마지막 결제일 조회
	public Timestamp check_latestpay(int a_memberNo) {
		return payMapper.check_latestpay(a_memberNo);
	}
	
	//a_payend가 마지막날짜인 DB정보의 시작일자 조회
	public Timestamp check_startday(int a_memberNo) {
		return payMapper.check_startday(a_memberNo);
	}
	

}