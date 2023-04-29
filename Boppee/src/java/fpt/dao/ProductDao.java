/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.dao;

import fpt.db.ConnectionManager;
import fpt.entities.Product;
import fpt.query.Query;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.imageio.ImageIO;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class ProductDao {
    
    public List<Product> getAllProducts(){
        List<Product> list = new ArrayList<>();
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("select * from product")){
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                list.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("product_name")
                        , rs.getLong("price"), rs.getBytes("picture"), rs.getInt("seller_id"), rs.getString("describe")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    /**
     *
     * @param p
     * @return
     */
    public boolean addProductInfor(Product p) {
        try ( Connection conn = ConnectionManager.getConnection();  
                PreparedStatement pst = conn.prepareCall(Query.Product.ADD_PRODUCT)) {
            pst.setInt(1, p.getCategoryId());
            pst.setString(2, p.getProductName());
            pst.setLong(3, p.getProductPrice());
            pst.setBytes(4, p.getProductPhoto());
            pst.setInt(5, p.getSellerId());
            pst.setString(6, p.getProductDescribe());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * @name updateProductInfor
     * @param p
     * @return
     */
    public boolean updateProductInfor(Product p) {
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(Query.Product.UPDATE_PRODUCT)) {
            pst.setInt(1, p.getCategoryId());
            pst.setString(2, p.getProductName());
            pst.setLong(3, p.getProductPrice());
            pst.setBytes(4, p.getProductPhoto());
            pst.setString(5, p.getProductDescribe());
            pst.setInt(6, p.getProductId());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * @name convertToPicture
     * @param p
     * @return
     */
    public String convertToPicture(Product p) {
        //System.out.println("Hello");
        String result = "";
        try {
            byte[] byteArray = p.getProductPhoto();
            ByteArrayInputStream bis = new ByteArrayInputStream(byteArray);
            BufferedImage image = ImageIO.read(bis);
            File output = new File("D:\\PRJ301\\Neatbean Project\\Boppee\\web\\product\\" + p.getSellerId() + "_img_" + p.getProductId() + ".png");
            if (ImageIO.write(image, "png", output)) {
                result = output.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     *
     * @param photo
     * @param proId
     * @return
     */
    public String convertToPicture(byte[] photo, Integer proId) {
        //System.out.println("Hello");
        String result = "";
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(photo);
            BufferedImage image = ImageIO.read(bis);
            File output = new File("D:\\PRJ301\\Neatbean Project\\Boppee\\web\\temp\\" + "img_" + proId + ".png");
            if (ImageIO.write(image, "png", output)) {
                String path = "temp\\" + "img_" + proId + ".png";
                result = path;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * @name displayProduct
     * @param p
     * @return
     */
    public String getProductPath(Product p) {
        return "product\\" + p.getSellerId() + "_img_" + p.getProductId() + ".png";
    }

    /**
     *
     * @param id
     * @return
     */
    public Object[] getProductByProductId(Integer id) {
        Object[] p = new Object[8];
        String sql = "Select * from Product p join Categories c on p.category_id = c.category_id where product_id = ?";
        try ( Connection conn = ConnectionManager.getConnection();  PreparedStatement pst = conn.prepareCall(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p[0] = convertToPicture(rs.getBytes("picture"), id);
                p[1] = rs.getString("product_name");
                p[2] = rs.getLong("price");
                p[3] = rs.getString("describe");
                p[4] = rs.getInt("category_id");
                p[5] = rs.getString("category_name");
                p[6] = id;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public StringBuffer convertMoneyFormat(Long money) {
        StringBuffer number = new StringBuffer();
        String price = money.toString();
        int count = 0;
        int j = 1;
        int time = price.length() / 3;
        for (int i = price.length() - 1; i >= 0; i--) {
            number.append(price.charAt(i));
            count++;
            if (price.length() % 3 == 0) {
                if (count == 3 && j <= time - 1) {
                    number.append(".");
                    count = 0;
                    j++;
                }

            } else {
                if (count == 3) {
                    number.append(".");
                    count = 0;
                }
            }

        }
        return number.reverse();
    }
    
    public List<Product> SearchProductsByName(String name){
        List<Product> list = new ArrayList<>();
        String search = "%"+name+"%";
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("select * from product where product_name like ?")){
            pst.setString(1, search);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                list.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("product_name")
                        , rs.getLong("price"), rs.getBytes("picture"), rs.getInt("seller_id"), rs.getString("describe")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> sortLowToHigh(List<Product> products){
        Collections.sort(products, (Product o1, Product o2) -> {
            if(o1.getProductPrice() > o2.getProductPrice()){
                return 1;
            } else if (o1.getProductPrice().equals(o2.getProductPrice())){
                return 0;
            } else {
                return -1;
            }
        });
        return products;
    }
    
    public List<Product> sortHighToLow(List<Product> products){
        Collections.sort(products, (Product o1, Product o2) -> {
            if(o1.getProductPrice() > o2.getProductPrice()){
                return -1;
            } else if (o1.getProductPrice().equals(o2.getProductPrice())){
                return 0;
            } else {
                return 1;
            }
        });
        return products;
    }
    
    public List<Product> sortAToZ(List<Product> products){
        Collections.sort(products, (Product o1, Product o2) -> {
            return -o1.getProductName().charAt(0)+o2.getProductName().charAt(0);
        });
        return products;
    }
    
    
    public List<Product> searchByPrice(int min, int max){
        List<Product> list = new ArrayList<>();
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("select * from product where price >= ? and price <= ?")){
            pst.setInt(1, min);
            pst.setInt(2, max);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                list.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("product_name")
                        , rs.getLong("price"), rs.getBytes("picture"), rs.getInt("seller_id"), rs.getString("describe")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public List<Product> SearchProductsByCategory(Integer cateId){
        List<Product> list = new ArrayList<>();
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement pst = conn.prepareCall("select * from product where category_id = ?")){
            pst.setInt(1, cateId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {                
                list.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("product_name")
                        , rs.getLong("price"), rs.getBytes("picture"), rs.getInt("seller_id"), rs.getString("describe")));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
