package service;

import model.Product;
import repository.ProductRepository;

import java.util.ArrayList;

public class ProductService implements IProductService {
    ProductRepository productRepository = new ProductRepository();

    @Override
    public ArrayList<Product> display() {
        return productRepository.display();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void delete(Integer id) {
        productRepository.delete(id);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }
}
