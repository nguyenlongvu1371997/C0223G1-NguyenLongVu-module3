package repository;

import model.Product;

import java.util.ArrayList;

public interface IProductRepository {
    void add(Product product);

    ArrayList<Product> display();

    void delete(Integer id);

    void update(Product product);
}
