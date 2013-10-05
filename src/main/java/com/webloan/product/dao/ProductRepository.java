package com.webloan.product.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;
import com.webloan.model.Product;

public interface ProductRepository extends BaseJpaRepository {
	
	Page pagingProductByRecommend(int pageIndex, int pageSize, String recommendType);
	
	Page pagingProductByRegion(int pageIndex, int pageSize, Long regionId);
	
	List<Product> queryProducts(Long regionId, String identity, String groupBuying);
}
