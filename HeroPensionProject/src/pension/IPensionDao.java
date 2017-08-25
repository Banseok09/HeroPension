package pension;

import java.util.List;

public interface IPensionDao {
	public PensionDto getChoicePension(int seq_pen);
	public List<PensionDto> getPensionList();	
}
