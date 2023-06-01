package service;

import model.Product;

import java.util.ArrayList;

public interface IProductService {
    ArrayList<Product> display();

    void add(Product product);

    void delete(Integer id);

    void update(Product product);

    ArrayList<Product> find(String name);
}
