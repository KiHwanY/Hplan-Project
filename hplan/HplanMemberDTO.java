package hplan;

public class HplanMemberDTO {
	
	String userid;
	String passwd;
	String name;
	
	
	public HplanMemberDTO() {}


	public HplanMemberDTO(String userid, String passwd, String name) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
	}


	@Override
	public String toString() {
		return "HplanMemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + "]";
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	
}
