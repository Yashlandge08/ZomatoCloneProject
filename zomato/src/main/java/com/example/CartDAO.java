package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private static Connection connection;

    public CartDAO() throws SQLException {
        connection = DBConnection.getConnection(); 
    }

    public List<CartItem> getCartItemsByCustomerId(int customerId) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart_items WHERE customers_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setcartId(rs.getInt("id"));
                item.setfoodId(rs.getInt("food_id"));
                item.setfoodName(rs.getString("foodName"));
                item.setprice(rs.getDouble("price"));
                item.setquantity(rs.getInt("quantity"));
                cartItems.add(item);
            }
        }
        return cartItems;
    }

    public static void clearCartByCustomerId(int customerId) throws SQLException {
        String query = "DELETE FROM cart_items WHERE customers_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            stmt.executeUpdate();
        }
    }

    public boolean deleteCartItem(int cartItemId) throws SQLException {
        String query = "DELETE FROM cart_items WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, cartItemId);
            return stmt.executeUpdate() > 0;
        }
    }
}
