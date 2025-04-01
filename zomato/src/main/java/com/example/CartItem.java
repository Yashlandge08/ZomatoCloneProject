package com.example;

public class CartItem {
    private int cartId;
    private int foodId;
    private String foodName;
    private double price;
    private int quantity;
    private double total;

    public int getcartId() {
        return cartId;
    }

    public void setcartId(int cartId) {
        this.cartId = cartId;
    }

    public int getfoodId() {
        return foodId;
    }

    public void setfoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getfoodName() {
        return foodName;
    }

    public void setfoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getprice() {
        return price;
    }

    public void setprice(double price) {
        this.price = price;
    }

    public int getquantity() {
        return quantity;
    }

    public void setquantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double gettotal() {
        return total;
    }

    public void settotal(double total) {
        this.total = total;
    } 
    
}
