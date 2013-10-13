package com.webloan.product.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.product.view.ProductQuery;

public interface ProductService {
	
	Page pagingProduct(ProductQuery pq);
	
	Page pagingProductBtwnAmount(ProductQuery pq);
	
	List<ProductAttach> queryProductAttaches(ProductQuery pq);
	
	Product getProductById(Long productId);
	
	ProductAttach getAttachByProductId(Long productId);
	
	Page pagingProductRecommend(int pageIndex, int pageSize, String recommendType);
	
	Page pagingAttachByRecType(int pageIndex, int pageSize, String recommendType);
	
	Page pagingPurchasedProducts(int pageIndex, int pageSize, Long regionId);
	
	Page pagingQuickLoanProducts(int pageIndex, int pageSize, Integer paidDays);
	
	List<Product> queryGroupBuyingProducts(Long regionId, String identity);
}
