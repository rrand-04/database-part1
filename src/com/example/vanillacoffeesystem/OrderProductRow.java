package com.example.vanillacoffeesystem;

public class OrderProductRow {

    private final int productId;
    private final String productName;
    private final double price;

    public OrderProductRow(int productId, String productName, double price) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }
}
