package com.webloan.product.service;

import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.product.view.ProductQuery;

public interface ProductService {
	
	Page pagingProduct(ProductQuery pq);
	
	Product getProductById(Long productId);
	
	Page pagingProductRecommend(int pageIndex, int pageSize, String recommendType);
	
}
