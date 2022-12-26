package com.entity;

public class ProductDtls {

	private int productId;
	private String productName;
	private String makein;
	private String price;
	private String category;
	private String status;
	private String photoName;
	private String email;
	public ProductDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDtls(String productName, String makein, String price, String category, String status,
			String photoName, String email) {
		super();
		this.productName = productName;
		this.makein = makein;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getMakein() {
		return makein;
	}
	public void setMakein(String makein) {
		this.makein = makein;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ProductDtls [productId=" + productId + ", productName=" + productName + ", makein=" + makein
				+ ", price=" + price + ", category=" + category + ", status=" + status + ", photoName=" + photoName
				+ ", email=" + email + "]";
	}
	
	
	
}
