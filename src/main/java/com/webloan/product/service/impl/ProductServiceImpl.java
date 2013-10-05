package com.webloan.product.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.webloan.product.dao.ProductRepository;
import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.product.service.ProductService;
import com.webloan.product.view.ProductQuery;

import static com.webloan.common.Queriable.*;

public class ProductServiceImpl implements ProductService {
	
	public static final String GROUP_BUYING = "0";
	public static final String NON_GROUP_BUYING = "1";
	
	private ProductRepository productRepository;

	public ProductRepository getProductRepository() {
		return productRepository;
	}
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	public Product getProductById(Long productId) {
		return productRepository.load(Product.class, productId);
	}
	public ProductAttach getAttachByProductId(Long productId) {
		List<ProductAttach> attaches = productRepository.queryList(ProductAttach.class, 
				new String[]{ "product.id" }, new Object[]{ productId });
		return attaches != null && attaches.size() > 0 ? attaches.get(0) : null;
	}

	public Page pagingProductRecommend(int pageIndex, int pageSize, String recommendType) {
		return productRepository.pagingProductByRecommend(pageIndex, pageSize, recommendType);
	}
	
	public Page pagingPurchasedProducts(int pageIndex, int pageSize, Long regionId) {
		return productRepository.pagingProductByRegion(pageIndex, pageSize, regionId);
	}
	
	public List<Product> queryGroupBuyingProducts(Long regionId, String identity) {
		return productRepository.queryProducts(regionId, identity, GROUP_BUYING);
	}
	
	public Page pagingProduct(ProductQuery pq) {
		BigDecimal loanAmt = pq.getLoanAmt() == null ? null : new BigDecimal(10000).multiply(pq.getLoanAmt());
		
		String[] keys = { 
			"identity", 
			"loanUse", 
			"minLoanAmt", 
			"maxLoanAmt", 
			"minLoanIssue", 
			"maxLoanIssue", 
			"estate", 
			"vehicle", 
			"credit", 
			"product.issueType", 
			"product.guarantyType", 
			"product.repayType" 
		};
		
		Object[] vals = { 
			pq.getIdentity(), 
			pq.getLoanUse(), 
			loanAmt, 
			loanAmt, 
			pq.getLoanIssue(), 
			pq.getLoanIssue(), 
			pq.getEstate(), 
			pq.getVehicle(), 
			pq.getCredit(), 
			pq.getIssueType(), 
			pq.getGuarantyType(), 
			pq.getRepayType() 
		};
		
		String[] conds = { 
			LIKE, 
			EQ, 
			LE, 
			GE, 
			LE, 
			GE, 
			EQ, 
			EQ, 
			EQ, 
			EQ, 
			EQ, 
			EQ 
		};
		
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

	public List<ProductAttach> queryProductAttaches(ProductQuery pq) {
		BigDecimal loanAmt = pq.getLoanAmt() == null ? null : new BigDecimal(10000).multiply(pq.getLoanAmt());
		
		String[] keys = { 
			"identity", 
			"loanUse", 
			"minLoanAmt", 
			"maxLoanAmt", 
			"minLoanIssue", 
			"maxLoanIssue", 
			"estate", 
			"vehicle", 
			"credit", 
			"product.id", 
			"product.issueType", 
			"product.guarantyType", 
			"product.repayType" 
		};
		
		Object[] vals = { 
			pq.getIdentity(), 
			pq.getLoanUse(), 
			loanAmt, 
			loanAmt, 
			pq.getLoanIssue(), 
			pq.getLoanIssue(), 
			pq.getEstate(), 
			pq.getVehicle(), 
			pq.getCredit(), 
			pq.getProductId(), 
			pq.getIssueType(), 
			pq.getGuarantyType(), 
			pq.getRepayType() 
		};
		
		String[] conds = { 
			LIKE, 
			EQ, 
			LE, 
			GE, 
			LE, 
			GE, 
			EQ, 
			EQ, 
			EQ, 
			EQ, 
			EQ, 
			EQ, 
			EQ 
		};
		
		return productRepository.queryList(ProductAttach.class, keys, vals, conds);
	}
}
