package com.webloan.product.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.product.view.ProductQuery;

public interface ProductService {
	
	Page pagingProduct(ProductQuery pq);
	
	List<ProductAttach> queryProductAttaches(ProductQuery pq);
	
	Product getProductById(Long productId);
	
	ProductAttach getAttachByProductId(Long productId);
	
	Page pagingProductRecommend(int pageIndex, int pageSize, String recommendType);
	
}
