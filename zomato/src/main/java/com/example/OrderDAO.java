package com.example;

import com.example.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/restaurant_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";

        public List<CartItem> getCartItemsByCustomerId(int customerId) throws SQLException {
        String query = "SELECT ci.id, ci.food_id, ci.quantity, fi.foodName, fi.price " +
                       "FROM cart_items ci JOIN food_items fi ON ci.food_id = fi.id " +
                       "WHERE ci.customers_id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, customerId);
            try (ResultSet rs = pstmt.executeQuery()) {
                List<CartItem> cartItems = new ArrayList<>();
                while (rs.next()) {
                    CartItem item = new CartItem();
                    item.setcartId(rs.getInt("id"));
                    item.setfoodId(rs.getInt("food_id"));
                    item.setfoodName(rs.getString("foodName"));
                    item.setprice(rs.getDouble("price"));
                    item.setquantity(rs.getInt("quantity"));
                    cartItems.add(item);
                }
                return cartItems;
            }
        }
    }

    public int insertOrder(int customerId, double totalAmount, Connection conn) throws SQLException {
        String query = "INSERT INTO orders (customers_id, total_amount, order_date, delivery_status) " +
                       "VALUES (?, ?, NOW(), 'Pending')";
        try (PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setInt(1, customerId);
            pstmt.setDouble(2, totalAmount);
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                } else {
                    throw new SQLException("Failed to retrieve order ID.");
                }
            }
        }
    }

    public void insertOrderItems(int orderId, List<CartItem> cartItems, Connection conn) throws SQLException {
        String query = "INSERT INTO order_items (order_id, food_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            for (CartItem item : cartItems) {
                pstmt.setInt(1, orderId);
                pstmt.setInt(2, item.getfoodId());
                pstmt.setInt(3, item.getquantity());
                pstmt.setDouble(4, item.getprice());
                pstmt.addBatch();
            }
            pstmt.executeBatch();
        }
    }

    public void clearCart(int customerId, Connection conn) throws SQLException {
        String query = "DELETE FROM cart_items WHERE customers_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, customerId);
            pstmt.executeUpdate();
        }
    }
}
