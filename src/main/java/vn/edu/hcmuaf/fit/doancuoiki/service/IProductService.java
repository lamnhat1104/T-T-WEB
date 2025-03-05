package vn.edu.hcmuaf.fit.doancuoiki.service;

import vn.edu.hcmuaf.fit.doancuoiki.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
}
