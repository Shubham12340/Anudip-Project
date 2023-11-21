package com.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pId;
	
	private String pName;
	
	@Column(length=3000)
	private String pDesc;
	
	private String pPhoto;
	
	private int pPrice;
	
	private int pDiscout;
	
	private int pQuantity;
	
	//we use ManyToOne mapping because multiple products can have same category for e.g different types laptops maps to single Category i.e Laptops   
	//ManyToOne mapping will create single column category;
	@ManyToOne
	private Category category;
	
	public Product() {
		super();
	}

	//parametrized Constructor
	public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscout, int pQuantity,
			Category category) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscout = pDiscout;
		this.pQuantity = pQuantity;
		this.category = category;
	}
	
	
	
	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscout() {
		return pDiscout;
	}

	public void setpDiscout(int pDiscout) {
		this.pDiscout = pDiscout;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}

	public Category getCategory() {
		return category;
	}
	
	//this method needs object of type Category to set it
	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", pDiscout=" + pDiscout + ", pQuantity=" + pQuantity + ", category=" + category + "]";
	}
	
	
	//calculate price after dicount
	public int getPriceAfterApplyingDiscount(){
		//we are using 100.0 because we are dividing with 100 and we will get 0.12354 and after type casting it will get multiplied by 0 i.e. 0.1234 * product_price and the result will 0
		//0 only and the result will be 0,hence to avoid this we used 100.0
		
		//if we get discount as 220.5 then we will get 200 using type casting
		int d= (int) ((this.getpDiscout()/100.0) * this.getpPrice());
		
		return this.getpPrice()-d;
	}

}
