package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Product;

import javax.swing.text.html.Option;
import java.util.*;

public class ProductService{

    private final HashMap<String, Product> productHashMap = new HashMap<>();
    private static final List<Product> productList = Arrays.asList(
            new Product("img/products/Apple-iPhone-14-Pro-Deep-Purple.png", "iPhone 14 Pro", "Apple Inc.", 1000.00, 4.8),
            new Product("img/products/iphone13-midnight.png", "iPhone 13", "Apple Inc.", 729.99, 4.2),
            new Product("img/products/Google-Pixel-7-Pro.png", "Google Pixel 7", "Google", 1000.00, 4.4),
            new Product("img/products/Samsung-Galaxy-S23-Plus-Lavender.png", "Samsung Galaxy S23 Plus", "Samsung", 1000.00, 4.8),
            new Product("img/products/samsung-galaxy-s22.png", "Samsung Galaxy S22", "Samsung", 349.99, 3.8),
            new Product("img/products/La Brique 1.0.png", "La Brique 1.0", "Motorola", 10.00, 5.0),
            new Product("img/products/Lime 7- Pro.png", "Lime 7 - Pro", "Motorola", 30.00, 3.4),
            new Product("img/products/Doro-750-Consumer-Cellular-Phone.png", "Doro 750", "Doro", 35.00, 3.2),
            new Product("img/products/Apple-iPhone-11.png", "iPhone 11", "Apple Inc.", 900.00, 3.5),
            new Product("img/products/Iphone 12.png", "iPhone 12", "Apple Inc.", 950.00, 4.0),
            new Product("img/products/iphone13max.png", "iPhone 13 Pro Max", "Apple Inc.", 950.00, 4.0));


    public ProductService() {
        for (var product : ProductService.productList) {
            this.productHashMap.put(product.getId().toString(), product);
        }
    }
    public List<Product> getProducts() {
        return ProductService.productList;
    }

    public Optional<Product> find(String productId) {
        return Optional.ofNullable(this.productHashMap.get(productId));
    }
}
