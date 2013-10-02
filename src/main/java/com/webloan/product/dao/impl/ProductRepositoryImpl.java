package com.webloan.product.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
import com.webloan.product.dao.ProductRepository;

public class ProductRepositoryImpl extends BaseJpaRepositoryImpl implements
		ProductRepository {
	
	public Page pagingProductByRecommend(int pageIndex, int pageSize,
			String recommendType) {
		StringBuilder jpql = new StringBuilder(" from ProductRecommend pr where 1=1 ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (recommendType != null && !"".equals(recommendType)) {
			jpql.append(" and pr.type=:recommendType ");
			params.put("type", recommendType);
		}
		
		jpql.append(" order by pr.id desc");
		
		String pageJpql = "select pr.product" + jpql;
		String countJpql = "select count(*)" + jpql;
		
		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}

}
