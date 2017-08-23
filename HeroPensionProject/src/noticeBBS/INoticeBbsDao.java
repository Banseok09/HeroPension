package noticeBBS;

import java.util.List;

public interface INoticeBbsDao {
	public boolean writeBbs(NoticeBbsDto dto);
	public List<NoticeBbsDto> getBbsList(PagingBean paging);
	public NoticeBbsDto getBbs(int seq);
	public void addReadcount(int seq);
	public boolean updateBbs(NoticeBbsDto bbs, int seq);
	public boolean deleteBbs(int seq);
	
}