/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class CartDao {

    public boolean insertCart(int customerId, int productId, int quantity) {
        try ( Connection conn = ConnectionManager.getConnection();  
                  PreparedStatement pst = conn.prepareCall("INSERT INTO Orders VALUES (?,?,?,?)")) {
            pst.setInt(1, customerId);
            pst.setInt(2, productId);
            pst.setInt(3, quantity);
            pst.setDate(4, Date.valueOf(LocalDate.now()));
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Object[]> getOrderBySellerAccountId(Integer sellerAccountId) {
        List<Object[]> orders = new ArrayList<>();
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(" select o.order_date, c.customer_name,c.phone_number , p.product_name, s.seller_account_id, o.quantity, o.quantity*p.price as 'total' from orders o join product p on o.product_id = p.product_id join seller s on s.seller_id = p.seller_id\n"
                + " join Customer c on c.customer_id = o.customer_id where  s.seller_account_id = ?")) {
            pst.setInt(1, sellerAccountId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                Object[] o = new Object[6];
                o[0] = rs.getDate("order_date");
                o[1] = rs.getString("customer_name");
                o[2] = rs.getString("phone_number");
                o[3] = rs.getString("product_name");
                o[4] = rs.getInt("quantity");
                o[5] = rs.getLong("total");
                orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

}
