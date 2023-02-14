package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Product;

import java.util.Arrays;
import java.util.List;

public class ProductService {

    public List<Product> getProducts() {
        return Arrays.asList(
                new Product("img/products/Apple-iPhone-14-Pro-Deep-Purple.png", "iPhone 14 Pro", "Apple Inc.", 1000.00, 4.8),
                new Product("img/products/Google-Pixel-7-Pro.png", "Google Pixel 7", "Google", 1000.00, 4.4),
                new Product("img/products/Samsung-Galaxy-S23-Plus-Lavender.png", "Samsung Galaxy S23 Plus", "Samsung", 1000.00, 4.8),
                new Product("img/products/La Brique 1.0.png", "La Brique 1.0", "Motorola", 10.00, 5.0),
                new Product("img/products/Lime 7- Pro.png", "Lime 7 - Pro", "Motorola", 30.00, 3.4),
                new Product("img/products/Doro-750-Consumer-Cellular-Phone.png", "Doro 750", "Doro", 35.00, 3.2));
    }
}
