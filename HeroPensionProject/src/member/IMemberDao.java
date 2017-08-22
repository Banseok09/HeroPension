package member;

public interface IMemberDao {

	public MemberDTO login(String id, String pw);
	public boolean addMember(MemberDTO dto);
	
}
