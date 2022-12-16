package kr.co.ezen.mapper;


import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.beans.SiteAcaAskBean;

public interface SiteAcaAskMapper {
	
		
	@Insert("insert into siteAcaAskT(a_memberNo, a_name, aa_title, aa_contents, aa_file) "
			+ "VALUES(#{a_memberNo}, #{a_name}, #{aa_title}, #{aa_contents}, #{aa_file, jdbcType=VARCHAR})"
			)
	void addAaContent(SiteAcaAskBean aaWriteBean);
	
	//문의글 목록
	@Select("select a1.a_memberNo, a1.a_name, a2.aa_title, a2.aa_time "
			+ "from siteAcaAskT a2, AcademyMemberT a1 "
			+ "where a2.a_memberNo = a1.a_memberNo "
			+ "order by a2.aa_time desc")	
		List<SiteAcaAskBean> getAaList(RowBounds rowBounds); 
	
	//문의글 개수
	@Select("select count(*) from siteAcaAskT")
	int getAacaListCnt(SiteAcaAskBean siteAcaAskBean);
	
	// 문의글 상세보기
	@Select("select a1.a_id, a1.a_name, a1.a_tele, "
			+ "a2.aa_time, a2.aa_title, a2.aa_contents, a2.aa_file "
			+ "from siteAcaAskT a2, AcademyMemberT a1 "
			+ "where a2.a_memberNo = a1.a_memberNo "
			+ "and a2.aa_time = #{aa_time} ")
	SiteAcaAskBean getAaInfo(Timestamp aa_time);
		
	//페이징
	@Select("select count(*) from siteAcaAskT")
	int getAacaContentCnt();

	
}