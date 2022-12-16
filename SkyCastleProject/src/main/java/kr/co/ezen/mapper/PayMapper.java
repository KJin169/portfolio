package kr.co.ezen.mapper;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.AcademyPayBean;

public interface PayMapper {
	
	//1, 6, 12개월 insert 
	@Insert("insert into academyPayT(a_memberNo, a_payStart, a_payEnd) values(#{a_memberNo}, #{a_payStart}, add_months(#{a_payStart}, 1)) ")
	void insert_1month(AcademyPayBean academyPayBean);
	
	@Insert("insert into academyPayT(a_memberNo, a_payStart, a_payEnd) values(#{a_memberNo}, #{a_payStart}, add_months(#{a_payStart}, 6)) ")
	void insert_6month(AcademyPayBean academyPayBean);
	
	@Insert("insert into academyPayT(a_memberNo, a_payStart, a_payEnd) values(#{a_memberNo}, #{a_payStart}, add_months(#{a_payStart}, 12)) ")
	void insert_1year(AcademyPayBean academyPayBean);

	//1, 6, 12개월 추가(update)
	@Update("update academyPayT set a_payEnd = add_months(a_payEnd, 1) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_amonth(@Param("a_memberNo") int a_memberNo, @Param("a_payStart")Timestamp a_payStart);

	@Update("update academyPayT set a_payEnd = add_months(a_payEnd, 6) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_halfyear(@Param("a_memberNo") int a_memberNo, @Param("a_payStart")Timestamp a_payStart);
	
	@Update("update academyPayT set a_payEnd = add_months(a_payEnd, 12) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_ayear(@Param("a_memberNo") int a_memberNo, @Param("a_payStart")Timestamp a_payStart);

	//DB에 이미 정보가 있는지 체크(중복검사)
	@Select("select count(*) from academyPayT where a_memberNo = #{a_memberNo}")
	int check_duplication(int a_memberNo);
	
	//a_memberNo로 마지막 결제일 조회
	@Select("select max(a_payEnd) from academyPayT where a_memberNo = #{a_memberNo}")
	Timestamp check_latestpay(int a_memberNo);
	
	//a_payend가 마지막날짜인 DB정보의 시작일자 조회
	@Select("select a_paystart from academyPayT where a_payend = (select max(a_payEnd) from academyPayT where a_memberNo = #{a_memberNo})")
	Timestamp check_startday(int a_memberNo);


}
 