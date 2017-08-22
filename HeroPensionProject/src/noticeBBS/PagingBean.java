package noticeBBS;

public class PagingBean {
	private int nowPage;		// 현재 페이지
	private int startNum;		// 현재 페이지의 첫번째 row넘버
	private int totalCount; 	// 게시판의 글의 총 개수
	private int countPerPage;	// 페이지당 보여줄 글의 개수
	private int blockCount; 	// 블록당 페이지의 개수
	
	public int getNowPage()      { return nowPage;      }
	public int getStartNum()     { return startNum;     }
	public int getTotalCount()   { return totalCount;   }
	public int getCountPerPage() { return countPerPage; }
	public int getBlockCount()   { return blockCount;   }
	
	public void setNowPage(int nowPage)           { this.nowPage = nowPage;           }
	public void setStartNum(int startNum)         { this.startNum = startNum;         }
	public void setTotalCount(int totalCount)     { this.totalCount = totalCount;     }
	public void setCountPerPage(int countPerPage) { this.countPerPage = countPerPage; }
	public void setBlockCount(int blockCount)     { this.blockCount = blockCount;     }
}

