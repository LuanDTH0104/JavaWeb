/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.Product;
import fpt.entities.Seller;
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
public class SellerDao {

    public boolean addSellerInfor(Seller s) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Seller.ADD_SELLER)) {
            pst.setInt(1, s.getSellerAccountId());
            pst.setString(2, s.getSellerName());
            pst.setString(3, s.getStoreName());
            pst.setString(4, s.getPhoneNumber());
            pst.setString(5, s.getGender());
            pst.setDate(6, s.getDob());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateSellerInfor(Seller s) {
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall("Update Seller Set seller_name = ?, store_name = ? , phone_number = ?, gender = ?, dob = ? Where seller_account_id = ?")) {
            pst.setString(1, s.getSellerName());
            pst.setString(2, s.getStoreName());
            pst.setString(3, s.getPhoneNumber());
            pst.setString(4, s.getGender());
            pst.setDate(5, s.getDob());
            pst.setInt(6, s.getSellerAccountId());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isExisted(Integer sellerId) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Seller.SELLER_ACCOUNT_ID)) {
            ResultSet rs = pst.executeQuery();
            List<Integer> id = new ArrayList<>();
            while (rs.next()) {
                id.add(rs.getInt("seller_account_id"));
            }
            for (Integer i : id) {
                if (Integer.compare(i, sellerId) == 0) {
                    return true;
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    /**
     * @author duong thanh luan
     * @param customerAccountId
     * @return customer name
     */
    public String findSellerName(Integer sellerAccountId) {
        String result = null;
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Seller.SELLER_NAME_THROUGH_ID)) {
            pst.setInt(1, sellerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                result = rs.getString("seller_name");
            }
        } catch (Exception e) {
        }
        return result;
    }

    public Integer findIdOfSeller(Integer sellerAccountId) {
        Integer sellerId = null;
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Seller.SELLER_ID)) {
            pst.setInt(1, sellerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                sellerId = rs.getInt("seller_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sellerId;
    }

    public List<Product> getProductofSeller(Integer sellerId) {
        List<Product> list = new ArrayList<>();
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Seller.GET_PRODUCT_OF_SELLER)) {
            pst.setInt(1, sellerId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getLong("price"), rs.getBytes("picture"), rs.getInt("seller_id"), rs.getString("describe")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Object[] findSellerInfor(Integer sellerAccountId) {
        Object[] o = new Object[8];
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall("Select * from seller s join seller_account sa on sa.seller_account_id = s.seller_account_id where s.seller_account_id = ? ")) {
            pst.setInt(1, sellerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                o[0] = rs.getInt("seller_id");
                o[1] = rs.getString("seller_name");
                o[2] = rs.getString("store_name");
                o[3] = rs.getString("phone_number");
                o[4] = rs.getString("gender");
                o[5] = rs.getDate("dob");
                o[6] = rs.getString("seller_username");
                o[7] = rs.getString("seller_password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return o;
    }

}
