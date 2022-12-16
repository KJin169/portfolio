package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.FaqBoardBean;

public interface FaqMapper {

	@Select("select * from FAQboardT "
			+ "order by fb_no")
	List<FaqBoardBean> getFaqList(FaqBoardBean fbListBean);
	
	//입력
	@Insert("insert into FAQboardT (fb_no, fb_contentsQ, fb_contentsA)"
			+ "values(fb_sq.nextval, #{fb_contentsQ}, #{fb_contentsA})")
	void fbWrite(FaqBoardBean fbWriteBean);
	
	//수정 페이지
	@Select("select * from FAQboardT where fb_no = #{fb_no}")
	FaqBoardBean getFbModifyPage(int fb_no);
	
	//수정
	@Update("update FAQboardT set fb_contentsQ = #{fb_contentsQ}, fb_contentsA = #{fb_contentsA} "
			+ "where fb_no = #{fb_no}")
	void fbModify(FaqBoardBean fbModifyBean);
	
	
	//삭제
	@Delete("delete from FAQboardT where fb_no = #{fb_no}")
	void fbDelete(int fb_no);
}
