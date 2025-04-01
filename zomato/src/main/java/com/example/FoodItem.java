package com.example;

public class FoodItem {
	private String foodName;
    private String category;
    private String categoriesId;
    private double price;
    private String restaurantName;
    private int id;
    private String description;
    private int restaurantId;
	
	
    public String getfoodName() {
		return foodName;
	}
	public void setfoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getcategory() {
		return category;
	}
	public void setcategory(String category) {
		this.category = category;
	}
	public double getprice() {
		return price;
	}
	public void setprice(double price) {
		this.price = price;
	}
	public String getrestaurantName() {
		return restaurantName;
	}
	public void setrestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getdescription() {
		return description;
	}
	public void setdescription(String description) {
		this.description = description;
	}
	public int getrestaurantId() {
		return restaurantId;
	}
	public void setrestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	
	public String getcategoriesId() {
		return categoriesId;
	}
	public void setcategoriesId(String categoriesId) {
		this.categoriesId = categoriesId;
	}
	
}