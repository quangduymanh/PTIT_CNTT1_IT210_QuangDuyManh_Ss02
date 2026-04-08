package org.example.java_it210_ss02.model;
import java.util.Date;

public class Order {
    private String code;
    private String productName;
    private double total;
    private Date orderDate;

    public Order(String code, String productName, double total, Date orderDate) {
        this.code = code;
        this.productName = productName;
        this.total = total;
        this.orderDate = orderDate;
    }

    public String getCode() { return code; }
    public String getProductName() { return productName; }
    public double getTotal() { return total; }
    public Date getOrderDate() { return orderDate; }
}