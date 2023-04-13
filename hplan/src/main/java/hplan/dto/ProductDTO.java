package hplan.dto;

import java.sql.Date;

public class ProductDTO {

	private int product_id; // 상품 아이디(시퀀스)
	private String p_name; // 상품 이름
	private int p_price; // 상품 가격
	private String p_info; //상품 설명
	private int p_stock; // 재고 수량
	private int p_sell; // 판매 수량
	private String pf_img; // 상품 이미지
	private Date p_enroll; // 상품 등록일
	private String cate_name; // 카테고리
	
	private String show; // default 'y' 
	
	private int sum ;
	
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public int getP_sell() {
		return p_sell;
	}
	public void setP_sell(int p_sell) {
		this.p_sell = p_sell;
	}
	public String getPf_img() {
		return pf_img;
	}
	public void setPf_img(String pf_img) {
		this.pf_img = pf_img;
	}
	public Date getP_enroll() {
		return p_enroll;
	}
	public void setP_enroll(Date p_enroll) {
		this.p_enroll = p_enroll;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", p_name=" + p_name + ", p_price=" + p_price + ", p_info="
				+ p_info + ", p_stock=" + p_stock + ", p_sell=" + p_sell + ", pf_img=" + pf_img + ", p_enroll="
				+ p_enroll + ", cate_name=" + cate_name + ", show=" + show + "]";
	}
	



	
	
}
