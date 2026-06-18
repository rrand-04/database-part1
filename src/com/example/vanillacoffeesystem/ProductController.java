package com.example.vanillacoffeesystem;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.cell.PropertyValueFactory;

import java.sql.*;

public class ProductController {

    @FXML private TextField nameField;
    @FXML private TextField categoryField;
    @FXML private TextField priceField;
    @FXML private TextField descriptionField;

    @FXML private TableView<Product> tableView;
    @FXML private TableColumn<Product, Integer> idColumn;
    @FXML private TableColumn<Product, String> nameColumn;
    @FXML private TableColumn<Product, String> categoryColumn;
    @FXML private TableColumn<Product, Double> priceColumn;
    @FXML private TableColumn<Product, String> descriptionColumn;
    @FXML private TextField idField;
    private ObservableList<Product> productList = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        idColumn.setCellValueFactory(new PropertyValueFactory<>("productId"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        categoryColumn.setCellValueFactory(new PropertyValueFactory<>("productCategory"));
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("productPrice"));
        descriptionColumn.setCellValueFactory(new PropertyValueFactory<>("productDescription"));

        loadProducts();
    }

    public void loadProducts() {
        productList.clear();

        String sql = "SELECT * FROM Product";

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                productList.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_category"),
                        rs.getDouble("product_price"),
                        rs.getString("product_description")
                ));
            }

            tableView.setItems(productList);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void addProduct() {
        String sql = "INSERT INTO Product (product_name, product_category, product_price, product_description) VALUES (?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, nameField.getText());
            ps.setString(2, categoryField.getText());
            ps.setDouble(3, Double.parseDouble(priceField.getText()));
            ps.setString(4, descriptionField.getText());

            ps.executeUpdate();

            nameField.clear();
            categoryField.clear();
            priceField.clear();
            descriptionField.clear();

            loadProducts();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

@FXML
public void updateProduct() {

    Product selectedProduct = tableView.getSelectionModel().getSelectedItem();

    if (selectedProduct == null) {
        System.out.println("Select a product first");
        return;
    }

    String sql = "UPDATE Product SET product_name=?, product_category=?, product_price=?, product_description=? WHERE product_id=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, nameField.getText());
        ps.setString(2, categoryField.getText());
        ps.setDouble(3, Double.parseDouble(priceField.getText()));
        ps.setString(4, descriptionField.getText());

        ps.setInt(5, Integer.parseInt(idField.getText()));

        ps.executeUpdate();

        loadProducts();

        System.out.println("Product Updated");

    } catch (Exception e) {
        e.printStackTrace();
    }
}
@FXML
public void deleteProduct() {

    Product selectedProduct = tableView.getSelectionModel().getSelectedItem();

    if (selectedProduct == null) {
        System.out.println("Select a product first");
        return;
    }

    String sql = "DELETE FROM Product WHERE product_id=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(idField.getText()));

        ps.executeUpdate();

        loadProducts();

        System.out.println("Product Deleted");

    } catch (Exception e) {
        e.printStackTrace();
    }
}
}