package com.hospital.dao;

import java.util.List;

import com.hospital.model.Product;

public interface ProductDAO {

	boolean addProduct(Product product);
	boolean deleteProduct(int productId);
	boolean updateProduct(Product product);
	List<Product> getAllProducts(int start,int total);
	List<Product> getAllProducts();
	Product searchProduct(int productId);
	boolean updateQuantityAfterOrder(int pid,int new_quantity);
}
