package pensionIMG;

import java.util.List;

public interface IPensionImgDao {
	
	public List<PensionImgDto> getPensionImg(int seq_pen);
	public PensionImgDto getPensionMainImg(int seq_pen);
}
