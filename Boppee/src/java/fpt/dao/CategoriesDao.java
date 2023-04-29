/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class CategoriesDao {
    public List<Category> displayAllCategories(){
        List<Category> list = new ArrayList<>();
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("Select * from Categories")){
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                list.add(new Category(rs.getInt("[category_id]"), rs.getString("[category_name]")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
