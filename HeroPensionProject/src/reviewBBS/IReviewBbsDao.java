package reviewBBS;

import java.util.List;

public interface IReviewBbsDao {
	public boolean writeBbs(ReviewBbsDto dto);
	public List<ReviewBbsDto> getBbsList(PagingBean paging);
	public ReviewBbsDto getBbs(int seq);
	public void addReadcount(int seq);
	public boolean updateBbs(ReviewBbsDto bbs, int seq);
	public boolean deleteBbs(int seq);
	
}
