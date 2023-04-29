
import fpt.dao.ProductDao;
import fpt.entities.Product;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class ma {
    public static void main(String[] args) {
        ProductDao pd = new ProductDao();
        List<Product> list = pd.SearchProductsByName("m");
        list = pd.sortLowToHigh(list);
        System.out.println(list);
    }
}
