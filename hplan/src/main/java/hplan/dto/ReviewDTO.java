package hplan.dto;

import java.sql.Date;

public class ReviewDTO {

	private int comment_num; //댓글 일련번호
	private int product_id; 
	private String writer; 
	private String content; 
	private Date reg_date;
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "ReviewDTO [comment_num=" + comment_num + ", product_id=" + product_id + ", writer=" + writer
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
}
