package com.cs137.javaservletwebapp.model;

import lombok.Getter;
import lombok.Setter;

import java.text.NumberFormat;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class Product {
    private UUID id = UUID.randomUUID();
    private String imageUrl;
    private String name;
    private String maker;
    private Double rawValue;
    private String price;
    private int reviews;
    private List<String> imageUrlGallery;

    private String description;

    public Product(String imageUrl, String name, String maker, Double rawValue, int reviews, List<String> imageUrlGallery, String description) {
        this.imageUrl = imageUrl;
        this.name = name;
        this.maker = maker;
        this.rawValue = rawValue;
        this.reviews = reviews;
        this.price = NumberFormat.getCurrencyInstance().format(this.rawValue);
        this.imageUrlGallery = imageUrlGallery;
        this.description = description;
    }

    public void setRawValue(Double rawValue) {
        this.rawValue = rawValue;
        this.setPrice(NumberFormat.getCurrencyInstance().format(this.rawValue));
    }
}
