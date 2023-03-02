package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Product;
import com.cs137.javaservletwebapp.utils.DBSource;
import com.cs137.javaservletwebapp.utils.PreparedStatementWrapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ProductService {
    public List<Product> getProducts() {
        String sql = "SELECT * FROM Product;";
        List<Product> products = new ArrayList<>();
        try (
                Connection connection = DBSource.getDataSource().getConnection();
                PreparedStatementWrapper stat = new PreparedStatementWrapper(connection, sql) {
                    @Override
                    protected void prepareStatement(Object... params) throws SQLException {
                        // nothing
                    }
                };
                ResultSet response = stat.executeQuery();
        ) {
            // this will only run if the response has something
            while (response.next()) {
                products.add(new Product(
                        response.getInt("prodID"),
                        response.getString("imageURL"),
                        response.getString("name"),
                        response.getString("maker"),
                        response.getDouble("price"),
                        response.getInt("review"),
                        Collections.singletonList(response.getString("imageURL")),
                        response.getString("description")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Optional<Product> find(int productId) {
        String sql = "SELECT * FROM Product WHERE prodID = ?;";
        Product ret = null;
        try (
                Connection connection = DBSource.getDataSource().getConnection();
                PreparedStatementWrapper stat = new PreparedStatementWrapper(connection, sql, productId) {
                    @Override
                    protected void prepareStatement(Object... params) throws SQLException {
                        stat.setInt(1, (Integer) params[0]);
                    }
                };
                ResultSet response = stat.executeQuery();
        ) {
            // this will only run if the response has something
            if (response.next()) {
                ret = new Product(
                        response.getInt("prodID"),
                        response.getString("imageURL"),
                        response.getString("name"),
                        response.getString("maker"),
                        response.getDouble("price"),
                        response.getInt("review"),
                        Collections.singletonList(response.getString("imageURL")),
                        response.getString("description")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.ofNullable(ret);
    }

    public boolean writePurchase(int productId) {
        String sql = "INSERT INTO ProductOrder (prodID) VALUES (?)";
        boolean ret = false;
        try (
                Connection connection = DBSource.getDataSource().getConnection();
                PreparedStatementWrapper stat = new PreparedStatementWrapper(connection, sql, productId) {
                    @Override
                    protected void prepareStatement(Object... params) throws SQLException {
                        stat.setInt(1, (Integer) params[0]);
                    }
                };
        ) {
            if (stat.executeUpdate() != 0) {ret = true;}
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public List<Product> getLastNPurchases(int num) {
        String sql = """
                        SELECT Product.* FROM Product JOIN ProductOrder ON Product.prodID = ProductOrder.prodID
                        ORDER BY purchase_date DESC LIMIT ?;
                """;
        List<Product> products = new ArrayList<>();
        try (
                Connection connection = DBSource.getDataSource().getConnection();
                PreparedStatementWrapper stat = new PreparedStatementWrapper(connection, sql, num) {
                    @Override
                    protected void prepareStatement(Object... params) throws SQLException {
                        stat.setInt(1, (Integer) params[0]);
                    }
                };
                ResultSet response = stat.executeQuery();
        ) {
            // this will only run if the response has something
            while (response.next()) {
                products.add(new Product(
                        response.getInt("prodID"),
                        response.getString("imageURL"),
                        response.getString("name"),
                        response.getString("maker"),
                        response.getDouble("price"),
                        response.getInt("review"),
                        Collections.singletonList(response.getString("imageURL")),
                        response.getString("description")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
