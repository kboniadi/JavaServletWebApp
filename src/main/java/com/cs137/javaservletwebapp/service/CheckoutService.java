package com.cs137.javaservletwebapp.service;
import com.cs137.javaservletwebapp.model.Product;
import com.cs137.javaservletwebapp.utils.DBSource;
import com.cs137.javaservletwebapp.utils.PreparedStatementWrapper;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CheckoutService {
    public List<Product> getCheckout() {
        List<Product> checkout = new ArrayList<>();
        return checkout;
    }

}
