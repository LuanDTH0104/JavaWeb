/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.Customer;
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
public class CustomerDao {

    public boolean addCustomerInfor(Customer c) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Customer.ADD_CUSTOMER)) {
            pst.setInt(1, c.getCustomerAccountId());
            pst.setString(2, c.getCustomerName());
            pst.setString(3, c.getCustomerPhone());
            pst.setString(4, c.getCustomerGender());
            pst.setDate(5, c.getDbo());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Customer findCustomerInfor(Integer customerAccountId){
        Customer customer = new Customer();
        try (Connection conn = ConnectionManager.getConnection(); 
                PreparedStatement pst = conn.prepareCall("Select * from customer where customer_account_id = ?")){
            pst.setInt(1, customerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) { 
                customer.setCustomerAccountId(rs.getInt("customer_account_id"));
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerGender(rs.getString("gender"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerPhone(rs.getString("phone_number"));
                customer.setDbo(rs.getDate("dob"));
            }
        } catch (Exception e) {
        }
        return customer;
    }

    public boolean isExisted(Integer customerID) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Customer.CUSTOMER_ACCOUNT_ID)) {
            ResultSet rs = pst.executeQuery();
            List<Integer> id = new ArrayList<>();
            while (rs.next()) {
                id.add(rs.getInt("customer_account_id"));
            }
            for (Integer i : id) {
                if (Integer.compare(i, customerID) == 0) {
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
    public String findCustomerName(Integer customerAccountId) {
        String result = null;
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall(Query.Customer.CUSTOMER_NAME_THROUGH_ID)) {
            pst.setInt(1, customerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                result = rs.getString("customer_name");
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    
    public String getCustomerNameByCustomerId(Integer customerId) {
        String result = null;
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall("Select * from customer where customer_id = ?")) {
            pst.setInt(1, customerId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                result = rs.getString("customer_name");
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public Object[] findAllCustomerInfor(Integer customerAccountId) {
        Object[] o = new Object[7];
        try ( Connection conn = ConnectionManager.getConnection();  
                    PreparedStatement pst = conn.prepareCall("Select * from customer c join customer_account ca on ca.customer_account_id = c.customer_account_id where c.customer_account_id = ? ")) {
            pst.setInt(1, customerAccountId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                o[0] = rs.getInt("customer_id");
                o[1] = rs.getString("customer_name");
                o[2] = rs.getString("phone_number");
                o[3] = rs.getString("gender");
                o[4] = rs.getDate("dob");
                o[5] = rs.getString("customer_username");
                o[6] = rs.getString("customer_password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return o;
    }
    
    public boolean updateSellerInfor(Customer c) {
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall("Update Customer Set customer_name = ?, phone_number = ?, gender = ?, dob = ? Where customer_account_id = ?")) {
            pst.setString(1, c.getCustomerName());
            pst.setString(2, c.getCustomerPhone());
            pst.setString(3, c.getCustomerGender());
            pst.setDate(4, c.getDbo());
            pst.setInt(5, c.getCustomerAccountId());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
