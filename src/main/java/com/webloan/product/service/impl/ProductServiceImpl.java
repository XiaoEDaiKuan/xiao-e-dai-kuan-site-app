package com.webloan.product.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.mapping.Array;

import com.webloan.product.dao.ProductRepository;
import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.product.service.ProductService;
import com.webloan.product.view.ProductQuery;

import static com.webloan.common.Queriable.*;

public class ProductServiceImpl implements ProductService {
	
	private ProductRepository productRepository;

	public ProductRepository getProductRepository() {
		return productRepository;
	}
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	public List<Product> queryProduct(String estate, String vehicle,
			String credit) {
		return productRepository.queryProduct(estate, vehicle, credit);
	}

	public Product getProductById(String id) {
		return productRepository.load(Product.class, Long.valueOf(id));
	}

	public List<Product>  queryProductByUser(String loanUse, String loanAmt,
			String loanIssue) {
		BigDecimal amt = loanAmt == null ? null : new BigDecimal(loanAmt);
		Integer issue = loanIssue == null ? null : Integer.valueOf(loanIssue);
		return productRepository.queryProductByUser(loanUse, amt, issue);
	}

	public Page pagingProductRecommend(String type, int limit) {
		return null;
	}

	public List<Product> queryProductRecommend(String type, int limit) {
		return null;
	}
	
	public Page pagingProduct(ProductQuery pq) {
		String[] keys = { "identity", "loanUse", "minLoanAmt", "maxLoanAmt", "estate", "vehicle", "credit", "product.issueType", "product.guarantyType", "product.repayType" };
		Object[] vals = { pq.getIdentity(), pq.getLoanUse(), pq.getLoanAmt(), pq.getLoanAmt(), pq.getEstate(), pq.getVehicle(), pq.getCredit(), pq.getIssueType(), pq.getGuarantyType(), pq.getRepayType() };
		String[] conds = { LIKE, EQ, GE, LE, EQ, EQ, EQ, EQ, EQ, EQ };
		
		List<String> ordKeys = new ArrayList<String>();
		List<String> ordVals = new ArrayList<String>();
		
		if (pq.getOrderRate() != null) {
			ordKeys.add("product.intrFormula");
			ordVals.add("0".equals(pq.getOrderRate()) ? ASC : DESC);
		}
		if (pq.getOrderMonthly() != null) {
			ordKeys.add("product.monthlyFormula");
			ordVals.add("0".equals(pq.getOrderMonthly()) ? ASC : DESC);
		}
		
		String[] orderKeys = new String[ordKeys.size()];
		String[] orderVals = new String[ordVals.size()];

		ordKeys.toArray(orderKeys);
		ordVals.toArray(orderVals);
		
		return productRepository.queryPage(pq.getPageIndex(), pq.getPageSize(), 
				ProductAttach.class, keys, vals, conds, orderKeys, orderVals);
	}

}
