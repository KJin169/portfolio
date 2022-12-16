package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.ServiceCenterBean;

public interface ServiceCenterMapper {
	
		
	@Insert("insert into noticeBoardT(nb_no, nb_title, nb_contents, nb_file)"
			+ "values(nb_sq.nextval, #{nb_title}, #{nb_contents}, #{nb_file, jdbcType=VARCHAR})"
			)
	void addNbContent(ServiceCenterBean nbWriteBean);
	
	// 제목, 작성날짜, 조회수 내림차순 정렬하여 출력 합니다.	
	@Select("select nb_no, nb_title, nb_writeTime, nb_viewCount "
			+ "from noticeBoardT "
			+ "order by nb_writeTime desc ")	
		List<ServiceCenterBean> getNbList(RowBounds rowBounds); 
		
		// 제목, 작성날짜, 조회수, 내용, 이미지 등을 추출하여 가져와야 합니다.	
	@Select("select nb_no, nb_title, nb_writeTime, nb_viewCount, nb_contents, nb_file "
			+ "from noticeBoardT "
			+ "where nb_no = #{nb_no} ")
		ServiceCenterBean getNbInfo(int nb_no);	

	//수정
	@Select("select nb_no, nb_title, nb_contents, nb_file "
			+ "from noticeBoardT where nb_no = #{nb_no}")
		ServiceCenterBean getNbModifyPage(int nb_no);
	
	@Update("update noticeBoardT set nb_title = #{nb_title}, nb_contents = #{nb_contents}, "
			+ "nb_file = #{nb_file, jdbcType=VARCHAR} "
			+ "where nb_no = #{nb_no}")
		void modifyNbInfo(ServiceCenterBean nbModifyBean);
	
	//삭제
	@Delete("delete from noticeBoardT where nb_no = #{nb_no}")
		void delNbInfo(int nb_no);
	
	@Update("update noticeBoardT set nb_viewCount = nb_viewCount + 1 "
			+ "where nb_no = #{nb_no}")
		void viewCountNbInfo(int nb_no);
	
	//검색 : 쿼리문 주의 확실하지 않음
	@Select("select nb_no, nb_title, nb_writeTime, nb_viewCount "
			+ "from noticeBoardT "
			+ "where nb_title like '%'||#{searchKeyword, jdbcType=VARCHAR}||'%' "
			+ "order by nb_writeTime desc ")
		List<ServiceCenterBean> getNbSearchList(String searchKeyword);
	
	//총 게시글 갯수
	@Select("select count(*) from noticeBoardT")
	int getListCnt(ServiceCenterBean nbSearchBean);
	
	@Select("select count(*) from noticeBoardT where nb_title like '%'||#{searchKeyword, jdbcType=VARCHAR}||'%'")
	int getSearchListCnt(ServiceCenterBean nbSearchBean);
	
	//페이징
	@Select("select count(*) from noticeBoardT")
	int getContentCnt();
	
	//검색 페이징
	@Select("select count(*) from noticeBoardT where nb_title like '%'||#{searchKeyword, jdbcType=VARCHAR}||'%' ")
	int getContentCnt2(String searchKeyword);
}
