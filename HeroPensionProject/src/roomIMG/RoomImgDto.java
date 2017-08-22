package roomIMG;

public class RoomImgDto {
	
	private int seq_img_room;
	private int seq_room;
	private String img_name_room;
	private String img_src_room;
	
	
	
	public RoomImgDto() { }
	
	public RoomImgDto(int seq_img_room, int seq_room, String img_name_room, String img_src_room) {
		super();
		this.seq_img_room = seq_img_room;
		this.seq_room = seq_room;
		this.img_name_room = img_name_room;
		this.img_src_room = img_src_room;
	}



	public int getSeq_img_room() {
		return seq_img_room;
	}
	
	public void setSeq_img_room(int seq_img_room) {
		this.seq_img_room = seq_img_room;
	}

	public int getSeq_room() {
		return seq_room;
	}
	
	public void setSeq_room(int seq_room) {
		this.seq_room = seq_room;
	}

	public String getImg_name_room() {
		return img_name_room;
	}

	public void setImg_name_room(String img_name_room) {
		this.img_name_room = img_name_room;
	}

	public String getImg_src_room() {
		return img_src_room;
	}

	public void setImg_src_room(String img_src_room) {
		this.img_src_room = img_src_room;
	}



	@Override
	public String toString() {
		return "RoomImageDto [seq_img_room=" + seq_img_room + ", seq_room=" + seq_room + ", img_name_room="
				+ img_name_room + ", img_src_room=" + img_src_room + "]";
	}

}
