package com.webloan.product.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.product.dao.ProductRepository;
import com.webloan.model.Product;

public class ProductRepositoryImpl extends BaseJpaRepositoryImpl implements
		ProductRepository {

	public List<Product> queryProduct(String estate, String vehicle,
			String credit) {
		StringBuilder jpql = new StringBuilder("select pa.product from ")
				.append(" ProductAttach pa where 1=1 ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (estate != null && !"".equals(estate)) {
			jpql.append(" and pa.estate=:estate ");
			params.put("estate", estate);
		}
		if (vehicle != null && !"".equals(vehicle)) {
			jpql.append(" and pa.vehicle=:vehicle ");
			params.put("vehicle", vehicle);
		}
		if (credit != null && !"".equals(credit)) {
			jpql.append(" and pa.credit=:credit ");
			params.put("credit", credit);
		}
		
		TypedQuery<Product> query = entityManager.createQuery(jpql.toString(), Product.class);

		for (Map.Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		
		return query.getResultList();
	}

	public List<Product> queryProductByUser(String loanUse, BigDecimal loanAmt,
			Integer loanIssue) {

		StringBuilder jpql = new StringBuilder("select pa.product from ")
				.append(" ProductAttach pa where 1=1 ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (loanUse != null && !"".equals(loanUse)) {
			jpql.append(" and pa.loanUse=:loanUse ");
			params.put("loanUse", loanUse);
		}
		if (loanAmt != null) {
			jpql.append(" and pa.minLoanAmt<=:loanAmt and pa.maxLoanAmt>=:loanAmt ");
			params.put("loanAmt", loanAmt);
		}
		if (loanIssue != null) {
			jpql.append(" and pa.minLoanIssue<=:loanIssue and pa.maxLoanIssue>=:loanIssue ");
			params.put("loanIssue", loanIssue);
		}
		
		TypedQuery<Product> query = entityManager.createQuery(jpql.toString(), Product.class);

		for (Map.Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		
		return query.getResultList();
	}

}
