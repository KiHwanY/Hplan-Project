package hplan.dto;

public class CartDTO {

	private int cart_id; 
	private String user_id; // member 테이블
	private int product_id;  // cart
	private int amount;
	private int money; // 계산 용도 테이블 x 
	private String p_name;
	private String pf_img; // 상품 이미지
	private String color; // 제품 색상
	private String p_size; // 제품 사이즈
	private int p_price; // 상품 가격
	private String cate_name; // 카테고리
	
	
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getPf_img() {
		return pf_img;
	}
	public void setPf_img(String pf_img) {
		this.pf_img = pf_img;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", user_id=" + user_id + ", product_id=" + product_id + ", amount="
				+ amount + ", money=" + money + ", p_name=" + p_name + ", pf_img=" + pf_img + ", color=" + color
				+ ", p_size=" + p_size + ", p_price=" + p_price + ", cate_name=" + cate_name + "]";
	}

	
	
	
}
