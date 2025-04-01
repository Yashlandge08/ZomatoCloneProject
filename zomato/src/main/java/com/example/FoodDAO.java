package com.example;

import java.sql.*;

public class FoodDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/food_ordering_db"; 
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "123456"; 

    public static Food getFoodById(int foodId) {
        Food food = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT food_name, description, price FROM foods WHERE food_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, foodId);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String foodName = rs.getString("food_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return food;
    }
}







