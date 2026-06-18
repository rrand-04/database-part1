package com.example.vanillacoffeesystem;

public class OrderRecord {
    private int orderId;
    private String orderDate;
    private String orderStatus;
    private double totalPrice;
    private String customerName;
    private String branchName;

    public OrderRecord(int orderId, String orderDate, String orderStatus, double totalPrice, String customerName, String branchName) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.totalPrice = totalPrice;
        this.customerName = customerName;
        this.branchName = branchName;
    }

    public int getOrderId() { return orderId; }
    public String getOrderDate() { return orderDate; }
    public String getOrderStatus() { return orderStatus; }
    public double getTotalPrice() { return totalPrice; }
    public String getCustomerName() { return customerName; }
    public String getBranchName() { return branchName; }
}