package kr.co.ezen.beans;


public class PageCountBean {

	private int min; //최소페이지번호
	private int max; //최대페이지번호
	private int prevPage; //이전 버튼의 페이지 번호
	private int nextPage; //다음 버튼의 페이지 번호
	private int pageCnt;  //전체 페이지 갯수
	private int currentPage; //현재 페이지 번호
	
	
	//검색
	private int keyword;
	
	public int getKeyword() {
		return keyword;
	}

	public void setKeyword(int keyword) {
		this.keyword = keyword;
	}
	
	//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
	public PageCountBean(int contentCnt, int currentPage, int contentPageCnt, int pagButtonCnt) {
		
    // 현재 페이지번호
	this.currentPage = currentPage;
	
	
	//전체 페이지 개수
	pageCnt = contentCnt / contentPageCnt;
	
	if(contentCnt % contentPageCnt > 0) {
		pageCnt++;
		}	
	
	min = ((currentPage -1) / contentPageCnt) * contentPageCnt + 1;
	max = min + pagButtonCnt - 1;
	
	if(max > pageCnt) {
		max = pageCnt;
	}
	
	prevPage = min - 1;
	nextPage = max + 1;
	
	if(nextPage > pageCnt) {
		nextPage = pageCnt;
		}	
	}
		

	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	
	
	
}
