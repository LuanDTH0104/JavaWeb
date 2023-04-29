/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class CommentDao {
    private CustomerDao cd = new CustomerDao();
    
    public List<Object[]> getCommentsByProductId(Integer proId){
        List<Object[]> list = new ArrayList<>();
        Object[] o = new Object[3];
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("SELECT customer_id, content FROM Comment WHERE product_id = ?")){
            pst.setInt(1, proId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                o[0] = cd.getCustomerNameByCustomerId(rs.getInt(1));
                o[1] = rs.getString(2);
                o[2] = rs.getInt(1);
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean insertComment(Integer proId, Integer cusId, String content){
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("INSERT INTO Comment VALUES (?,?,?)")){
            pst.setInt(1, cusId);
            pst.setInt(2, proId);
            pst.setString(3, content);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateComment(Integer proId, Integer cusId, String content){
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("UDDATE Comment SET content = ? WHERE customer_id = ?, cusId = ?")){
            pst.setString(1, content);
            pst.setInt(2, cusId);
            pst.setInt(3, proId);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteComment(Integer proId, Integer cusId){
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("DELETE FROM Comment WHERE customer_id = ? AND product_id = ?")){
            pst.setInt(1, cusId);
            pst.setInt(2, proId);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
