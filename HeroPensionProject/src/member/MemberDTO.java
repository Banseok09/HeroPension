package member;

import java.io.Serializable;

public class MemberDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private int auth;
	private int del;
	
	
	public MemberDTO(String id, String pw, String name, String email, String phone, int auth, int del) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
		this.del = del;
	}


	public String getId() {	return id;}
	public String getPw() {	return pw;}
	public String getName() {return name;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public int getAuth() {return auth;}
	public int getDel() {return del;}
	
	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	public void setName(String name) {this.name = name;}
	public void setEmail(String email) {this.email = email;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setAuth(int auth) {this.auth = auth;}
	public void setDel(int del) {this.del = del;}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", auth=" + auth + ", del=" + del + "]";
	}
	
	
	
	
	
}
