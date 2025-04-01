package com.example;

public class Food {
    private int foodId;
    private String foodName;
    private String description;
    private double price;

    
    public Food(int foodId, String foodName, String description, double price) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.description = description;
        this.price = price;
    }

    public int getFoodId() {
        return foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }
}

