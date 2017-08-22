package reviewBBS;

import java.util.List;

public interface IReviewBbsDao {
	public boolean writeBbs(ReviewBbsDto dto);
	List<ReviewBbsDto> getReviewBbsList(PagingBean paging);
	
}
