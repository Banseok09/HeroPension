package pensionIMG;

public class PensionImgDto {
	
	private int seq_img_pen;
	private int seq_pen;
	private String img_name_pen;
	private String img_src_pen;
	
	
	
	public PensionImgDto() { }

	public PensionImgDto(int seq_img_pen, int seq_pen, String img_name_pen, String img_src_pen) {
		super();
		this.seq_img_pen = seq_img_pen;
		this.seq_pen = seq_pen;
		this.img_name_pen = img_name_pen;
		this.img_src_pen = img_src_pen;
	}

	
	public int getSeq_img_pen() {
		return seq_img_pen;
	}

	public void setSeq_img_pen(int seq_img_pen) {
		this.seq_img_pen = seq_img_pen;
	}

	public int getSeq_pen() {
		return seq_pen;
	}

	public void setSeq_pen(int seq_pen) {
		this.seq_pen = seq_pen;
	}

	public String getImg_name_pen() {
		return img_name_pen;
	}

	public void setImg_name_pen(String img_name_pen) {
		this.img_name_pen = img_name_pen;
	}

	public String getImg_src_pen() {
		return img_src_pen;
	}

	public void setImg_src_pen(String img_src_pen) {
		this.img_src_pen = img_src_pen;
	}

	
	@Override
	public String toString() {
		return "PensionImgDto [seq_img_pen=" + seq_img_pen + ", seq_pen=" + seq_pen + ", img_name_pen=" + img_name_pen
				+ ", img_src_pen=" + img_src_pen + "]";
	}	
	
}
