package com.example.vanillacoffeesystem;

public class Product {

    private int productId;
    private String productName;
    private String productCategory;
    private double productPrice;
    private String productDescription;

    public Product(int productId, String productName, String productCategory, double productPrice, String productDescription) {
        this.productId = productId;
        this.productName = productName;
        this.productCategory = productCategory;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }
}