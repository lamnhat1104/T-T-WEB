package vn.edu.hcmuaf.fit.doancuoiki.service;

import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;

import java.util.List;

public class ProductService2 {
    static ProductDao productDao = new ProductDao();

//    public List<Product> getAll() {
//        return productDao.getAllProducts();
//    }

    public Product getDetail(String in){
        try{
            int id = Integer.parseInt(in);
            return productDao.getProductById(id);
        } catch (NumberFormatException e) {
            return null;
        }

    }
}
