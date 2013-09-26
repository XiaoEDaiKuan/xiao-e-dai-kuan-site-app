package com.webloan.product.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.product.dao.ProductRepository;
import com.webloan.model.Product;
import com.webloan.product.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	private ProductRepository productRepository;

	public ProductRepository getProductRepository() {
		return productRepository;
	}
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	public List<Product> queryProduct(String estate, String vehicle,
			String credit) {
		return productRepository.queryProduct(estate, vehicle, credit);
	}

	public Product getProductById(String id) {
		return productRepository.load(Product.class, Long.valueOf(id));
	}

	public List<Product>  queryProductByUser(String loanUse, String loanAmt,
			String loanIssue) {
		BigDecimal amt = loanAmt == null ? null : new BigDecimal(loanAmt);
		Integer issue = loanIssue == null ? null : Integer.valueOf(loanIssue);
		return productRepository.queryProductByUser(loanUse, amt, issue);
	}

	public List<Product> queryProductRecommend(String type, String vehicle,
			String credit) {
		return null;
	}

}