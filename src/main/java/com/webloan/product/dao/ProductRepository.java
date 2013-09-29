package com.webloan.product.dao;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;

public interface ProductRepository extends BaseJpaRepository {
	
	Page pagingProductByRecommend(int pageIndex, int pageSize, String recommendType);
}
