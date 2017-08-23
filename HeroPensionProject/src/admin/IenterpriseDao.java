package admin;

import java.util.List;


public interface IenterpriseDao {
		
	public boolean addEnterprise(enterpriseDto dto);
	public boolean idCheck(String id);
	public boolean emailCheck(String email);
	public boolean phoneCheck(String phone);
	public List<enterpriseDto> requestList();
	public boolean req_answer(String id, int auth);
}
