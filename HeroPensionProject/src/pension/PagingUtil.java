package pension;

public class PagingUtil {
	public static PagingBean setPagingInfo(PagingBean paging, int CountPerPage, int Blockcount) {		
		paging.setCountPerPage(CountPerPage);
		paging.setBlockcount(Blockcount);		
		paging.setStartNum(paging.getTotalCount() - (paging.getNowPage()-1) * paging.getCountPerPage());
		
		return paging;
	}

}
