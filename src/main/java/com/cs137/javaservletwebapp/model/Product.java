package com.cs137.javaservletwebapp.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Product {
    private String imageUrl;
    private String name;
    private String maker;
    private Double price;
    private Double reviews;
}
