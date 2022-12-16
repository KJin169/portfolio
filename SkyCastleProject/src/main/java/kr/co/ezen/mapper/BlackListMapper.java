package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.ServiceCenterBean;

public interface BlackListMapper {
	
		
	@Insert("insert into blacklistT(m_memberNo, a_memberNo, black_contents) "
			+ "values(#{m_memberNo}, #{a_memberNo}, #{black_contents})")
		void addBlContent(BlackListBean blWriteBean);		
	
		// 제목, 작성날짜, 조회수, 내용, 이미지 등을 추출하여 가져와야 합니다.	
	@Select("select m.m_memberNo, m.m_name, a.a_memberNo, a.a_name, b.black_contents, b.black_time "
			+ "from memberT m, academyMemberT a, blacklistT b "
			+ "where m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = b.a_memberNo "
			+ "order by b.black_time desc")
	List<BlackListBean> getBlList(RowBounds rowBounds); 
	
	//상세보기
	@Select("select m.m_memberNo, m.m_name, a.a_memberNo, a.a_name, b.black_contents, b.black_time "
			+ "from memberT m, academyMemberT a, blacklistT b "
			+ "where m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = b.a_memberNo "
			+ "and m.m_memberNo = #{m_memberNo} "
			+ "and a.a_memberNo = #{a_memberNo} ")
	BlackListBean getBlackInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo);	

	//삭제
	@Delete("delete from blacklistT "
			+ "where m_memberNo = #{m_memberNo} "
			+ "and a_memberNo = #{a_memberNo}")
	void delBlInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo);

	//수정 페이지
	@Select("select m.m_name, a.a_name, b.black_contents "
			+ "from memberT m, academyMemberT a, blacklistT b "
			+ "where m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = b.a_memberNo "
			+ "and b.m_memberNo = #{m_memberNo}" 
			+ "and b.a_memberNo = #{a_memberNo}" )
	BlackListBean getBlModifyPage(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo);
	
	//수정
	@Update("update blacklistT set black_contents = #{black_contents, jdbcType=VARCHAR} "
			+ "where m_memberNo = #{m_memberNo} "
			+ "and a_memberNo = #{a_memberNo}")
	void modifyBlInfo(BlackListBean blModifyBean);
	
	//검색 : 쿼리문 주의 확실하지 않음
	@Select("select m.m_memberNo, a.a_memberNo, m.m_name, a.a_name, b.black_contents, b.black_time "
			+ "from memberT m, academyMemberT a, blacklistT b "
			+ "where m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = b.a_memberNo "
			+ "and m.m_name like '%'||#{searchKeyword, jdbcType=VARCHAR}||'%' "
			+ "order by b.black_time desc ")
	List<BlackListBean> getBLSearchList(String searchKeyword);
			
	
	@Select("select count(*) from blacklistT")
	int getContentCnt();

	@Select("select count(*) from memberT m, academyMemberT a, blacklistT b "
			+ "where m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = b.a_memberNo "
			+ "and m_name like '%'||#{searchKeyword, jdbcType=VARCHAR}||'%'")
	int getContentCnt2(String searchKeyword);

	
	
}