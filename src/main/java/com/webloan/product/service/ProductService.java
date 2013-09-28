package com.webloan.product.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.product.view.ProductQuery;

public interface ProductService {
	
	Page pagingProduct(ProductQuery pq);
	
	Product getProductById(String id);
	
	Page pagingProductRecommend(String type, int limit);
	
	List<Product> queryProductRecommend(String type, int limit);
	
}
