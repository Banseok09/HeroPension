package admin;

import java.io.Serializable;

public class enterpriseDto implements Serializable {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String wdate;
	private int auth;
	private int del;
	
	public enterpriseDto(String id, String pw, String name, String email, String phone, String wdate, int auth,
			int del) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.wdate = wdate;
		this.auth = auth;
		this.del = del;
	}

	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getName() {return name;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public String getWdate() {return wdate;}
	public int getAuth() {return auth;}
	public int getDel() {return del;}

	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	public void setName(String name) {this.name = name;}
	public void setEmail(String email) {this.email = email;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setWdate(String wdate) {this.wdate = wdate;}
	public void setAuth(int auth) {this.auth = auth;}
	public void setDel(int del) {this.del = del;}

	@Override
	public String toString() {
		return "enterpriseDto [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", wdate=" + wdate + ", auth=" + auth + ", del=" + del + "]";
	}	
	
	
	
	
	
}
