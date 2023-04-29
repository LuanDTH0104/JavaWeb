/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.entities;

import fpt.dao.ProductDao;



/**
 *
 * @author NGUYEN THANH LUAN
 */
public class Product {
    private Integer productId;
    private byte[]  productPhoto;
    private String photoPath;
    private String productName;
    private Long productPrice;
    private Integer categoryId;
    private String productDescribe;
    private Integer sellerId;

    public Product() {
    }

    public Product(Integer productId, String photoPath, String productName, Long productPrice) {
        this.productId = productId;
        this.photoPath = photoPath;
        this.productName = productName;
        this.productPrice = productPrice;
    }
    
    

    public Product(Integer productId, byte[] productPhoto, String productName, Long productPrice) {
        this.productId = productId;
        this.productPhoto = productPhoto;
        this.productName = productName;
        this.productPrice = productPrice;
        
    }

    public Product(Integer productId, byte[] productPhoto, 
            String productName, Long productPrice, Integer categoryId, String productDescribe, Integer sellerId) {
        this.productId = productId;
        this.productPhoto = productPhoto;
        this.productName = productName;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.productDescribe = productDescribe;
        this.sellerId = sellerId;
    }

    public Product(byte[] productPhoto, String productName, Long productPrice, 
            Integer categoryId, String productDescribe, Integer sellerId) {
        this.productPhoto = productPhoto;
        this.productName = productName;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.productDescribe = productDescribe;
        this.sellerId = sellerId;
    }

    public Product(Integer productId, Integer categoryId, String productName,Long productPrice, byte[] productPhoto, 
             Integer sellerId, String productDescribe) {
        this.productId = productId;
        this.productPhoto = productPhoto;
        this.productName = productName;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.productDescribe = productDescribe;
        this.sellerId = sellerId;
    }

    public String getPhotoPath() {
        ProductDao pd = new ProductDao();
        this.photoPath = pd.getProductPath(this);
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }
    
    

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public byte[] getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(byte[] productPhoto) {
        this.productPhoto = productPhoto;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Long productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductDescribe() {
        return productDescribe;
    }

    public void setProductDescribe(String productDescribe) {
        this.productDescribe = productDescribe;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }
    
    public StringBuffer convertMoneyFormat() {
        Long money = this.productPrice;
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
    
    
    
}
