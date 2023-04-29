/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.CustomerAccount;
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
public class CustomerAccountDao {

    public boolean addCustomerAccount(CustomerAccount customer) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareStatement(Query.Customer_Account.ADD_CUSTOMER_ACCOUNT)) {
            pst.setString(1, customer.getCustomerUsername());
            pst.setString(2, customer.getCustomerPassword());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean existedUsername(String username) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Customer_Account.USERNAME_DATA)) {
            List<String> existedUsername = new ArrayList<>();
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                existedUsername.add(rs.getString("customer_username"));
            }
            for (String e : existedUsername) {
                if (username.equals(e)) {
                    return true;
                }
            }

        } catch (Exception e) {
        }
        return false;
    }

    public boolean unmatchedPassword(CustomerAccount account) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Customer_Account.DATA)) {
            List<CustomerAccount> customerAccounts = new ArrayList<>();
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                customerAccounts.add(new CustomerAccount(rs.getString("customer_username"),
                        rs.getString("customer_password")));
            }
            for (CustomerAccount c : customerAccounts) {
                if (account.getCustomerUsername().equals(c.getCustomerUsername())
                        && !account.getCustomerPassword().equals(c.getCustomerPassword())) {
                    return true;
                }
            }

        } catch (Exception e) {
        }
        return false;
    }

    public Integer findIdOfCustomer(String username) {
        Integer result = null;
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Customer_Account.GET_CUSTOMER_ACCOUNT_ID)) {
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                result = rs.getInt("customer_account_id");
                return result;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updatePassword(String newPassword, Integer customerAccountId) {
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall("Update Customer_account Set [Customer_password] = ? Where [customer_account_id] = ?")) {
            pst.setString(1, newPassword);
            pst.setInt(2, customerAccountId);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }

}
