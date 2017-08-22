package member;

public interface IMemberDao {

	public MemberDTO login(String id, String pw);
	public boolean addMember(MemberDTO dto);
	public boolean updateMem(String id,String pw, String name, String phone, String email);
	
}
