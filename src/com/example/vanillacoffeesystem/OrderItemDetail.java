package com.example.vanillacoffeesystem;

public class OrderItemDetail {

    private final String productName;
    private final int quantity;
    private final double price;

    public OrderItemDetail(String productName, int quantity, double price) {
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return String.format("%s  ×  %d   @  ₪ %.2f   =   ₪ %.2f",
                productName, quantity, price, price * quantity);
    }
}
