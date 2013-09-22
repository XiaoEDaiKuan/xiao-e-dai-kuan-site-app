package com.webloan.product.service;

import java.util.List;

import com.webloan.model.Product;

public interface ProductService {

	List<Product> queryProductByUser(String loanUse, String loanAmt, String loanIssue);

	List<Product> queryProduct(String estate, String vehicle, String credit);
	
	Product getProductById(String id);
	
	List<Product> queryProductRecommend(String type, String vehicle, String credit);
	
	
}
