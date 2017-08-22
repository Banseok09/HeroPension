package reviewBBS;

public class PagingUtil {
	public static PagingBean setPagingInfo(PagingBean paging) {
		paging.setCountPerPage(10);
		paging.setBlockCount(10);
		
		paging.setStartNum(paging.getTotalCount()-(paging.getNowPage()-1) * (paging.getCountPerPage()));
		return paging;
	}
	
	public static PagingBean setPagingInfo(PagingBean paging, int countPerPage, int blockCount) {
		paging.setCountPerPage(countPerPage);
		paging.setBlockCount(blockCount);
		paging.setStartNum(paging.getTotalCount()-(paging.getNowPage()-1) * (paging.getCountPerPage()));
		return paging;
	}
}
