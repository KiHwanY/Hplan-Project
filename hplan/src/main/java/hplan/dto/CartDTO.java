package hplan.dto;

public class CartDTO {

	private int cart_id; 
	private String user_id;
	private int product_id; 
	private int p_stock; 
	private int amount;
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
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", user_id=" + user_id + ", product_id=" + product_id + ", p_stock="
				+ p_stock + ", amount=" + amount + "]";
	}
	
	
	
}
