/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.entities;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class SellerAccount {
    private Integer sellerAccountId;
    private String sellerUsername;
    private String sellerPassword;

    public SellerAccount() {
    }

    public SellerAccount(Integer sellerAccountId, String sellerUsername, String sellerPassword) {
        this.sellerAccountId = sellerAccountId;
        this.sellerUsername = sellerUsername;
        this.sellerPassword = sellerPassword;
    }
    
    public SellerAccount(String sellerUsername, String sellerPassword) {
        this.sellerUsername = sellerUsername;
        this.sellerPassword = sellerPassword;
    }

    public Integer getSellerAccountId() {
        return sellerAccountId;
    }

    public void setSellerAccountId(Integer sellerAccountId) {
        this.sellerAccountId = sellerAccountId;
    }

    public String getSellerUsername() {
        return sellerUsername;
    }

    public void setSellerUsername(String sellerUsername) {
        this.sellerUsername = sellerUsername;
    }

    public String getSellerPassword() {
        return sellerPassword;
    }

    public void setSellerPassword(String sellerPassword) {
        this.sellerPassword = sellerPassword;
    }
    
    
}
