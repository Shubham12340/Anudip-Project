package com.mycart.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int categoryId;
	
	private String categoryTitle;
	
	private String categoryDescription; 
	
	//we use OneToMany mapping because single category can have multiple products for e.g. Category Laptop can have wide variety of different laptops    
	//it is used for one to many mapping as a one category can have many products using @OneTomany
	//By using @OneToMany we map Category class and Product class i.e one Category can have many products
	//we are saying in bracket that this mapped to a "category" column present in a Product table
	@OneToMany(mappedBy="category")
	private List<Product> products= new ArrayList<Product>();
	//product list will create seperate table 
	
	public Category() {
		super();
	}

	//Parametrized Constructor
	public Category(int categoryId, String categoryTitle, String categoryDescription) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
	}

	//Constructor without categoryId cause it is autoincremented 
	public Category(String categoryTitle, String categoryDescription) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
	}

	
	//constructor with products list
	public Category( String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription="
				+ categoryDescription + "]";
	}
	
}
