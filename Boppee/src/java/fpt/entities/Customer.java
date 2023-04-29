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
public class Customer {
    private Integer customerId;
    private Integer customerAccountId;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String customerGender;
    private Date dbo;

    public Customer() {
    }

    public Customer(Integer customerId, Integer customerAccountId, String customerName, String customerEmail, String customerPhone, String customerGender, Date dbo) {
        this.customerId = customerId;
        this.customerAccountId = customerAccountId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerGender = customerGender;
        this.dbo = dbo;
    }

    public Customer(Integer customerAccountId, String customerName, String customerEmail, String customerPhone, String customerGender, Date dbo) {
        this.customerAccountId = customerAccountId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerGender = customerGender;
        this.dbo = dbo;
    }

    

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getCustomerAccountId() {
        return customerAccountId;
    }

    public void setCustomerAccountId(Integer customerAccountId) {
        this.customerAccountId = customerAccountId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public Date getDbo() {
        return dbo;
    }

    public void setDbo(Date dbo) {
        this.dbo = dbo;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }
    
    
}
