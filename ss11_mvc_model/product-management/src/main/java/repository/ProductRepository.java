package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static ArrayList<Product> list = new ArrayList<>();

    static {
        list.add(new Product(1, "máy giặt", "toshiba", 250));
        list.add(new Product(2, "tivi", "samsung", 450));
        list.add(new Product(3, "tủ lạnh", "hãng nào đó", 200));
        list.add(new Product(4, "máy giặt", "abc", 270));
        list.add(new Product(5, "điều hòa", "sharp", 250));
        list.add(new Product(6, "máy hút bụi", "meomeo", 300));
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public ArrayList<Product> display() {
        return list;
    }

    @Override
    public void delete(Integer id) {
        for (Product p : list) {
            if (p.getId() == id) {
                list.remove(p);
                return;
            }
        }
    }

    @Override
    public void update(Product product) {
        for (Product p : list) {
            if (p.getId() == product.getId()) {
                p.setName(product.getName());
                p.setBrand(product.getBrand());
                p.setPrice(product.getPrice());
                return;
            }
        }
    }

    @Override
    public ArrayList<Product> find(String name) {
        ArrayList<Product> list1 = new ArrayList<>();
        for (Product p : list) {
            if (p.getName().equals(name)) {
                list1.add(p);
            }
        }
        return list1;
    }


}
