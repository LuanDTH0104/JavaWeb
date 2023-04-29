/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.SellerAccount;
import fpt.query.Query;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class SellerAccountDao {
    public boolean addSellerAccount(SellerAccount seller){
        try (Connection conn = ConnectionManager.getConnection();
        PreparedStatement pst = conn.prepareStatement(Query.Seller_Account.ADD_SELLER_ACCOUNT)){
            pst.setString(1, seller.getSellerUsername());
            pst.setString(2, seller.getSellerPassword());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean existedUsername(String username){
        try (Connection conn = ConnectionManager.getConnection(); 
                PreparedStatement pst = conn.prepareCall(Query.Seller_Account.USERNAME_DATA)){
            List<String> existedUsername = new ArrayList<>();
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
               existedUsername.add(rs.getString("seller_username"));
            }
            for (String e : existedUsername) {
                if(username.equals(e))
                    return true;
            }
            
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean unmatchedPassword(SellerAccount account) {
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall(Query.Seller_Account.DATA)) {
            List<SellerAccount> sellerAccounts = new ArrayList<>();
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                sellerAccounts.add(new SellerAccount(rs.getString("seller_username"),
                        rs.getString("seller_password")));
            }
            for (SellerAccount s : sellerAccounts) {
                if (account.getSellerUsername().equals(s.getSellerUsername())
                        && !account.getSellerPassword().equals(s.getSellerPassword())) {
                    return true;
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public Integer findIdOfSeller(String username){
        Integer result = null;
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall(Query.Seller_Account.GET_SELLER_ACCOUNT_ID)){
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt("seller_account_id");
                return result;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public boolean updatePassword(String newPassword, Integer sellerAccountId){
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("Update Seller_account Set [seller_password] = ? Where [seller_account_id] = ?")){
                pst.setString(1, newPassword);
                pst.setInt(2, sellerAccountId);
                return pst.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }
}
