package com.example.vanillacoffeesystem;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;

import java.sql.*;

public class OrderController {

    @FXML private TextField orderIdField;
    @FXML private TextField orderDateField;
    @FXML private TextField orderStatusField;
    @FXML private TextField totalPriceField;
    @FXML private TextField customerIdField;
    @FXML private TextField branchIdField;

    @FXML private TableView<OrderRecord> orderTable;
    @FXML private TableColumn<OrderRecord, Integer> orderIdColumn;
    @FXML private TableColumn<OrderRecord, String> orderDateColumn;
    @FXML private TableColumn<OrderRecord, String> orderStatusColumn;
    @FXML private TableColumn<OrderRecord, Double> totalPriceColumn;
    @FXML private TableColumn<OrderRecord, String> customerNameColumn;
    @FXML private TableColumn<OrderRecord, String> branchNameColumn;

    private final ObservableList<OrderRecord> orderList = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        orderIdColumn.setCellValueFactory(new PropertyValueFactory<>("orderId"));
        orderDateColumn.setCellValueFactory(new PropertyValueFactory<>("orderDate"));
        orderStatusColumn.setCellValueFactory(new PropertyValueFactory<>("orderStatus"));
        totalPriceColumn.setCellValueFactory(new PropertyValueFactory<>("totalPrice"));
        customerNameColumn.setCellValueFactory(new PropertyValueFactory<>("customerName"));
        branchNameColumn.setCellValueFactory(new PropertyValueFactory<>("branchName"));

        loadOrders();
    }

    public void loadOrders() {
        orderList.clear();

        String sql = """
                SELECT o.order_id, o.order_date, o.order_status, o.total_price,
                       c.customer_name, b.branch_name
                FROM Orders o
                JOIN Customers c ON o.customer_id = c.customer_id
                JOIN Branches b ON o.branch_id = b.branch_id
                """;

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                orderList.add(new OrderRecord(
                        rs.getInt("order_id"),
                        rs.getString("order_date"),
                        rs.getString("order_status"),
                        rs.getDouble("total_price"),
                        rs.getString("customer_name"),
                        rs.getString("branch_name")
                ));
            }

            orderTable.setItems(orderList);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void addOrder() {
        String sql = "INSERT INTO Orders (order_date, order_status, total_price, customer_id, branch_id) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, orderDateField.getText());
            ps.setString(2, orderStatusField.getText());
            ps.setDouble(3, Double.parseDouble(totalPriceField.getText()));
            ps.setInt(4, Integer.parseInt(customerIdField.getText()));
            ps.setInt(5, Integer.parseInt(branchIdField.getText()));

            ps.executeUpdate();

            clearFields();
            loadOrders();

            System.out.println("Order Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void updateOrder() {
        String sql = "UPDATE Orders SET order_date=?, order_status=?, total_price=?, customer_id=?, branch_id=? WHERE order_id=?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, orderDateField.getText());
            ps.setString(2, orderStatusField.getText());
            ps.setDouble(3, Double.parseDouble(totalPriceField.getText()));
            ps.setInt(4, Integer.parseInt(customerIdField.getText()));
            ps.setInt(5, Integer.parseInt(branchIdField.getText()));
            ps.setInt(6, Integer.parseInt(orderIdField.getText()));

            ps.executeUpdate();

            clearFields();
            loadOrders();

            System.out.println("Order Updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void deleteOrder() {
        try {
            Connection con = DBConnection.getConnection();

            int orderId = Integer.parseInt(orderIdField.getText());

            PreparedStatement ps1 = con.prepareStatement("DELETE FROM Payment WHERE order_id=?");
            ps1.setInt(1, orderId);
            ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement("DELETE FROM Employee_Order WHERE order_id=?");
            ps2.setInt(1, orderId);
            ps2.executeUpdate();

            PreparedStatement ps3 = con.prepareStatement("DELETE FROM Order_Items WHERE order_id=?");
            ps3.setInt(1, orderId);
            ps3.executeUpdate();

            PreparedStatement ps4 = con.prepareStatement("DELETE FROM Orders WHERE order_id=?");
            ps4.setInt(1, orderId);
            ps4.executeUpdate();

            clearFields();
            loadOrders();

            System.out.println("Order Deleted");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void clearFields() {
        orderIdField.clear();
        orderDateField.clear();
        orderStatusField.clear();
        totalPriceField.clear();
        customerIdField.clear();
        branchIdField.clear();
    }
}