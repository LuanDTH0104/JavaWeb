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
import java.util.HashMap;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class Analysis {

    public HashMap<Date, Integer> getTotalOrderIn7days() {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall("select top(7) order_date, count(order_date) as 'Number of order' from orders "
                + "group by order_date "
                + "order by order_date desc")) {
            HashMap<Date, Integer> getTotal = new HashMap<>();
//            pst.setInt(1, 2);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                getTotal.put(rs.getDate(1), rs.getInt(2));
            }
            return getTotal;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public HashMap<Date, Integer> getTotalIncomeIn7days() {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall("select top(7) order_date, sum(quantity*price) as 'Income'\n"
                + "from orders o inner join  Product p on o.product_id = p.product_id\n"
//                + "where seller_id = ?"
                + "group by order_date \n"
                + "order by order_date desc")) {
            HashMap<Date, Integer> getTotal = new HashMap<>();
//            pst.setInt(1, 2);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                getTotal.put(rs.getDate(1), rs.getInt(2));
            }
            return getTotal;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public HashMap<Date, Integer> getAverageIncomeIn7days() {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall("select top(7) order_date, sum(quantity*price) / count(order_date) as 'Avarage Income'\n"
                + "from orders o inner join  Product p on o.product_id = p.product_id\n"
//                +"where seller_id = ?"
                + "group by order_date \n"
                + "order by order_date desc")) {
            HashMap<Date, Integer> getTotal = new HashMap<>();
//            pst.setInt(1, 2);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                getTotal.put(rs.getDate(1), rs.getInt(2));
            }
            return getTotal;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
