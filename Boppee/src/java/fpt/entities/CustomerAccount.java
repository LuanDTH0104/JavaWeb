/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.entities;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class CustomerAccount {
    private Integer customerAccountId;
    private String customerUsername;
    private String customerPassword;

    public CustomerAccount() {
    }

    public CustomerAccount(Integer customerAccountId, String customerUsername, String customerPassword) {
        this.customerAccountId = customerAccountId;
        this.customerUsername = customerUsername;
        this.customerPassword = customerPassword;
    }

    public CustomerAccount(String customerUsername, String customerPassword) {
        this.customerUsername = customerUsername;
        this.customerPassword = customerPassword;
    }
    
    

    public Integer getCustomerAccountId() {
        return customerAccountId;
    }

    public void setCustomerAccountId(Integer customerAccountId) {
        this.customerAccountId = customerAccountId;
    }

    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }
    
    
    
}
