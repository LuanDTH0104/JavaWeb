/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.entities;

import java.sql.Date;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class Order {
    private Integer customerId;
    private Integer productId;
    private Integer quantity;
    private Date orderDate;

    public Order() {
    }

    public Order(Integer customerId, Integer productId, Integer quantity, Date orderDate) {
        this.customerId = customerId;
        this.productId = productId;
        this.quantity = quantity;
        this.orderDate = orderDate;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    
    
    
}
