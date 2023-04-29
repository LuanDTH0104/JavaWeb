/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package fpt.query;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public interface Query {

    interface Seller_Account {

        String ADD_SELLER_ACCOUNT = "INSERT INTO Seller_account VALUES (?,?)";
        String USERNAME_DATA = "SELECT seller_username FROM Seller_account";
        String DATA = "SELECT * FROM Seller_account";
        String GET_SELLER_ACCOUNT_ID = "SELECT Seller_account_id FROM Seller_account WHERE seller_username = ?";
    }

    interface Customer_Account {

        String ADD_CUSTOMER_ACCOUNT = "INSERT INTO Customer_account VALUES (?,?)";
        String USERNAME_DATA = "SELECT customer_username FROM Customer_account";
        String DATA = "SELECT * FROM Customer_account";
        String GET_CUSTOMER_ACCOUNT_ID = "SELECT customer_account_id FROM Customer_account WHERE customer_username = ?";
    }

    interface Customer {

        String ADD_CUSTOMER = "INSERT INTO Customer VALUES (?,?,?,?,?)";
        String CUSTOMER_ACCOUNT_ID = "SELECT customer_account_id FROM Customer";
        String CUSTOMER_NAME_THROUGH_ID = "SELECT customer_name FROM Customer "
                + "WHERE customer_account_id = ?";
    }

    interface Seller {
        String ADD_SELLER = "INSERT INTO Seller VALUES (?,?,?,?,?,?)";
        String SELLER_ACCOUNT_ID = "SELECT seller_account_id FROM Seller";
        String SELLER_NAME_THROUGH_ID = "SELECT seller_name FROM Seller "
                + "WHERE seller _account_id = ?";
        String SELLER_ID = "SELECT seller_id FROM Seller WHERE seller_account_id = ?";
        String GET_PRODUCT_OF_SELLER = "SELECT * FROM Product WHERE seller_id = ?"; 
    }
    
    interface Product {
        String ADD_PRODUCT = "INSERT INTO Product VALUES (?,?,?,?,?,?)";
        String UPDATE_PRODUCT = "UPDATE Product SET [category_id] = ?, [product_name]=?,[price] = ?, [picture] = ?, [describe]= ? Where [product_id] = ?";
    }

}
