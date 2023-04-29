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
public class Seller {
    private Integer sellerId;
    private Integer sellerAccountId;
    private String sellerName;
    private String storeName;
    private String phoneNumber;
    private String gender; 
    private Date dob;

    public Seller(Integer sellerAccountId, 
            String sellerName, String storeName, 
            String phoneNumber, String gender, 
            Date dob) {
        this.sellerAccountId = sellerAccountId;
        this.sellerName = sellerName;
        this.storeName = storeName;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.dob = dob;
    }
    
    public Seller() {
    }



    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public Integer getSellerAccountId() {
        return sellerAccountId;
    }

    public void setSellerAccountId(Integer sellerAccountId) {
        this.sellerAccountId = sellerAccountId;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    
    
}
