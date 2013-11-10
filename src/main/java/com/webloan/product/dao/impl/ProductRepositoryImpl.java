package com.webloan.product.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.product.dao.ProductRepository;

public class ProductRepositoryImpl extends BaseJpaRepositoryImpl implements
		ProductRepository {
	
	public Page pagingProductByRecommend(int pageIndex, int pageSize,
			String recommendType) {
		StringBuilder jpql = new StringBuilder(" from ProductRecommend pr where 1=1 ")
				.append(" and pr.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");
		
		if (recommendType != null && !"".equals(recommendType)) {
			jpql.append(" and pr.type=:recommendType ");
			params.put("recommendType", recommendType);
		}
		
		jpql.append(" order by pr.product.orders asc, pr.id desc");
		
		String pageJpql = "select distinct pr.product" + jpql;
		String countJpql = "select count(distinct pr.product)" + jpql;
		
		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public Page pagingAttachByRecommend(int pageIndex, int pageSize,
			String recommendType) {
		StringBuilder jpql = new StringBuilder(" from ProductAttach a, ProductRecommend pr ")
				.append(" where a.product.id=pr.product.id and pr.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");
		
		if (recommendType != null && !"".equals(recommendType)) {
			jpql.append(" and pr.type=:recommendType ");
			params.put("recommendType", recommendType);
		}

		jpql.append(" order by a.product.orders asc ");
		
		String pageJpql = "select distinct a " + jpql;
		String countJpql = "select count(distinct a)" + jpql;
		
		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public Page pagingProductByRegion(int pageIndex, int pageSize, Long regionId) {
		StringBuilder jpql = new StringBuilder(" from ProductAttach a, Order o ")
				.append(" where a.product.id=o.product.id and a.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");
		
		if (regionId != null) {
			jpql.append(" and o.region.id=:regionId ");
			params.put("regionId", regionId);
		}
		
		jpql.append(" order by a.product.orders asc ");
		
		String pageJpql = "select a " + jpql;
		String countJpql = "select count(*) " + jpql;

		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public List<ProductAttach> queryAttachesByRegion(Long regionId) {
		StringBuilder jpql = new StringBuilder("select a from ProductAttach a, Order o ")
				.append(" where a.product.id=o.product.id and a.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");
		
		if (regionId != null) {
			jpql.append(" and o.region.id=:regionId ");
			params.put("regionId", regionId);
		}
		
		jpql.append(" order by a.product.orders asc ");

		return queryListResult(ProductAttach.class, jpql.toString(), params);
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
		
		jpql.append(" order by p.orders asc ");
		
		return queryListResult(Product.class, jpql.toString(), params);
	}
	
	public Page pagingProductByPaidDays(int pageIndex, int pageSize, List<Integer> paidDays) {
		StringBuilder jpql = new StringBuilder(" from ProductAttach a where 1=1 ")
				.append(" and a.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");

		if (paidDays != null && !paidDays.isEmpty()) {
			jpql.append(" and a.product.paidDays in (:paidDays) ");
			params.put("paidDays", paidDays);
		}
		
		jpql.append(" order by a.product.orders asc ");

		String pageJpql = "select a " + jpql;
		String countJpql = "select count(*) " + jpql;

		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	public Page pagingProductBtwnAmount(int pageIndex, int pageSize, 
			BigDecimal minLoanAmt, BigDecimal maxLoanAmt) {
		StringBuilder jpql = new StringBuilder(" from ProductAttach a where 1=1 ")
				.append(" and a.product.groupBuying=:groupBuying ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("groupBuying", "1");

		if (minLoanAmt != null && maxLoanAmt != null) {
			jpql.append(" and (a.minLoanAmt between :minLoanAmt and :maxLoanAmt")
				.append(" or a.maxLoanAmt between :minLoanAmt and :maxLoanAmt) ");
			params.put("minLoanAmt", minLoanAmt);
			params.put("maxLoanAmt", maxLoanAmt);
		}
		else if (minLoanAmt != null) {
			jpql.append(" and a.minLoanAmt <= :minLoanAmt and a.maxLoanAmt >= :minLoanAmt ");
			params.put("minLoanAmt", minLoanAmt);
		}
		else if (maxLoanAmt != null) {
			jpql.append(" and a.minLoanAmt <= :maxLoanAmt and a.maxLoanAmt >= :maxLoanAmt ");
			params.put("maxLoanAmt", maxLoanAmt);
		}
		
		jpql.append(" order by a.product.orders asc, a.product.id asc ");
		
		System.out.println(jpql);
		System.out.println(params);
		
		String pageJpql = "select a " + jpql;
		String countJpql = "select count(*) " + jpql;

		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
}
