package com.cs137.javaservletwebapp.model;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;

@AllArgsConstructor
public class Cart {
    private HashMap<Integer, Product> productHashMap;
    private double totalCost;

    public Cart() {
        this.productHashMap = new HashMap<>();
        this.totalCost = 0;
    }
    public void addProduct(Product prod) {
        this.productHashMap.put(prod.getId(), prod);
        this.totalCost += prod.getRawValue();
    }

    public Product removeProduct(Integer prodId) {
        if (!this.productHashMap.containsKey(prodId)) {
            return null;
        }
        var prod = this.productHashMap.remove(prodId);
        this.totalCost -= prod.getRawValue();
        return prod;
    }

    public void removeAllProducts() {
        this.productHashMap.clear();
        this.totalCost = 0;
    }
    public List<Product> getProducts() {
        return this.productHashMap.values().stream().toList();
    }

    public boolean isEmpty() {
        return this.productHashMap.isEmpty();
    }

    public int size() {
        return this.productHashMap.size();
    }

    public Double getRawTotal() {
        return this.totalCost;
    }

    public String getFormattedTotal() {
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        return formatter.format(this.totalCost);
    }
}
