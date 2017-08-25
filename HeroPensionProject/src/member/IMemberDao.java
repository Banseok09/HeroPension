package member;

import java.util.List;

public interface IMemberDao {

	public MemberDTO login(String id, String pw);
	public boolean addMember(MemberDTO dto);
	public boolean updateMem(String id,String pw, String name, String phone, String email);
	public boolean idCheck(String id);
	public boolean emailCheck(String email);
	public boolean phoneCheck(String phone);
	public List<MemberDTO> getMemberList();
	boolean req_answer(String id, int auth);	
	
}
