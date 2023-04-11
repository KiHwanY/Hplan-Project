package hplan.dto;

import java.util.Date;

public class AdminDTO {

	private int manager_num;
	
	private String manager_id;
	private String manager_pwd;
	private String manager_name; 
	private String manager_email;
	private String manager_phone; 
	private Date join_date;
	public int getManager_num() {
		return manager_num;
	}
	public void setManager_num(int manager_num) {
		this.manager_num = manager_num;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pwd() {
		return manager_pwd;
	}
	public void setManager_pwd(String manager_pwd) {
		this.manager_pwd = manager_pwd;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "AdminDTO [manager_num=" + manager_num + ", manager_id=" + manager_id + ", manager_pwd=" + manager_pwd
				+ ", manager_name=" + manager_name + ", manager_email=" + manager_email + ", manager_phone="
				+ manager_phone + ", join_date=" + join_date + "]";
	}
	public AdminDTO() {
	
	}
	
	
}
