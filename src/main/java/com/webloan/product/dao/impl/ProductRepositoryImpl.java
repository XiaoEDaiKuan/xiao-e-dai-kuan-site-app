package com.webloan.product.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.product.dao.ProductRepository;

public class ProductRepositoryImpl extends BaseJpaRepositoryImpl implements
		ProductRepository {
	
	public Page pagingProductByRecommend(int pageIndex, int pageSize,
			String recommendType) {
		StringBuilder jpql = new StringBuilder(" from ProductRecommend pr where 1=1 ");
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (recommendType != null && !"".equals(recommendType)) {
			jpql.append(" and pr.type=:recommendType ");
			params.put("recommendType", recommendType);
		}
		
		jpql.append(" order by pr.id desc");
		
		String pageJpql = "select distinct pr.product" + jpql;
		String countJpql = "select count(distinct pr.product)" + jpql;
		
		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public Page pagingProductByRegion(int pageIndex, int pageSize, Long regionId) {
		StringBuilder jpql = new StringBuilder(" from Order o where 1=1 ");
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (regionId != null) {
			jpql.append(" and o.region.id=:regionId ");
			params.put("regionId", regionId);
		}
		
		String pageJpql = "select distinct o.product" + jpql;
		String countJpql = "select count(distinct o.product)" + jpql;

		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public List<Product> queryProducts(Long regionId, String identity, String groupBuying) {
		StringBuilder jpql = new StringBuilder("select distinct p from Product p, ")
				.append(" ProductAttach a, in(p.regions) r where a.product.id=p.id ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (regionId != null) {
			jpql.append(" and r.id=:regionId ");
			params.put("regionId", regionId);
		}
		if (identity != null && !"".equals(identity)) {
			jpql.append(" and a.identity=:identity ");
			params.put("identity", identity);
		}
		if (groupBuying != null && !"".equals(groupBuying)) {
			jpql.append(" and p.groupBuying=:groupBuying ");
			params.put("groupBuying", groupBuying);
		}
		
		TypedQuery<Product> query = entityManager.createQuery(jpql.toString(), Product.class);
		for (Map.Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		
		return query.getResultList();
	}

}
