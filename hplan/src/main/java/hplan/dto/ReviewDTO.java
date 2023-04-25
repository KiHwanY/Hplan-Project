package hplan.dto;

import java.sql.Date;

public class ReviewDTO {
	private int review_num; //상품 후기 게시물 번호
	private String user_id; //작성자
	private int product_id; //상품 번호
	private String subject; //제목
	private String passwd; //수정/삭제 비번
	private Date reg_date; //작성일자
	private int readcount; //조회수
	private int ref; //게시물그룹
	private int re_step; //게시물그룹의 순번
	private int re_level;
	private String content; //본문
	private String ip; //작성자 ip
	private String filename;
	private int filesize;
	private int down;
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	@Override
	public String toString() {
		return "ReviewDTO [review_num=" + review_num + ", user_id=" + user_id + ", product_id=" + product_id
				+ ", subject=" + subject + ", passwd=" + passwd + ", reg_date=" + reg_date + ", readcount=" + readcount
				+ ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level + ", content=" + content + ", ip="
				+ ip + ", filename=" + filename + ", filesize=" + filesize + ", down=" + down + "]";
	}
	
	
}
