package com.webloan.product.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Product;

public interface ProductRepository extends BaseJpaRepository {
	
	List<Product> queryProductByUser(String loanUse, BigDecimal loanAmt,
			Integer loanIssue);

	List<Product> queryProduct(String estate, String vehicle, String credit);
}
