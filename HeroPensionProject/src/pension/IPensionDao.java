package pension;

import java.util.List;

public interface IPensionDao {
	
	public List<PensionDto> getPensionList();
	public PensionDto getChoicePension(int seq_pen);
	public boolean addPension(PensionDto pen);
	public List<PensionDto> getMyPensionList(String id);
	public List<PensionDto> getMyPensionPagingList(PagingBean paging, String id);
	public List<PensionDto> getPensionList();
}
