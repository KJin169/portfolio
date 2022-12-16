package kr.co.ezen.mapper;


import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;

public interface SiteAskMapper {
	
		
	@Insert("insert into siteAskT(sa_memberNo, sa_tele, sa_title, sa_contents, sa_file )"
			+ "values(#{sa_memberNo}, #{sa_tele}, #{sa_title}, #{sa_contents}, #{sa_file, jdbcType=VARCHAR})"
			)
	void addSaContent(SiteAskBean saWriteBean);
	
	// 문의글 목록
	@Select("select sa_memberNo, sa_title, sa_time "
			+ "from siteAskT "
			+ "order by sa_time desc")	
		List<SiteAskBean> getSaList(RowBounds rowBounds); 
	
	//문의글 개수
	@Select("select count(*) from siteAskT")
	int getSaListCnt(SiteAskBean saBean);
		
	// 문의글 상세보기
	@Select("select m_id, m_name, sa_tele, m_email, sa_time, sa_title, sa_contents, sa_file "
			+ "from siteAskT, memberT "
			+ "where sa_memberNo = m_memberNo "
			+ "and sa_time = #{sa_time}")
	SiteAskBean getSaInfo(Timestamp sa_time);	
	
	//페이징
	@Select("select count(*) from siteAskT")
	int getSaContentCnt();
}
