package com.webloan.product.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;
import com.webloan.model.Product;

public interface ProductRepository extends BaseJpaRepository {
	
	Page pagingProductByRecommend(int pageIndex, int pageSize, String recommendType);
	
	Page pagingAttachByRecommend(int pageIndex, int pageSize, String recommendType);
	
	Page pagingProductByRegion(int pageIndex, int pageSize, Long regionId);
	
	Page pagingProductByPaidDays(int pageIndex, int pageSize, List<Integer> paidDays);
	
	List<Product> queryProducts(Long regionId, String identity, String groupBuying);
	
	Page pagingProductBtwnAmount(int pageIndex, int pageSize, 
			BigDecimal minLoanAmt, BigDecimal maxLoanAmt);
}
