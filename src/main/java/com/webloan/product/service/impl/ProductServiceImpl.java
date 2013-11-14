package com.webloan.product.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
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

	public Page pagingAttachByRecType(int pageIndex, int pageSize, String recommendType) {
		return productRepository.pagingAttachByRecommend(pageIndex, pageSize, recommendType);
	}
	
	public Page pagingPurchasedProducts(int pageIndex, int pageSize, Long regionId) {
		return productRepository.pagingProductByRegion(pageIndex, pageSize, regionId);
	}
	
	public List<ProductAttach> queryPurchasedProducts(Long regionId) {
		return productRepository.queryAttachesByRegion(regionId);
	}
	
	public Page pagingQuickLoanProducts(int pageIndex, int pageSize, Integer paidDay) {
		List<Integer> paidDays = new ArrayList<Integer>();
		if (paidDay == null) {
			paidDays.addAll(Arrays.asList(1, 3, 5));
		} else {
			paidDays.add(paidDay);
		}
		return productRepository.pagingProductByPaidDays(pageIndex, pageSize, paidDays);
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
		
		List<String> loanUses = null;
		if (pq.getLoanUse() != null && !"".equals(pq.getLoanUse())) {
			loanUses = new ArrayList<String>();
			loanUses.add(pq.getLoanUse());
			if (!"0".equals(pq.getLoanUse())) {
				loanUses.add("0");
			}
		}
		
		Object[] vals = { 
			pq.getIdentity() == null ? null : "|" + pq.getIdentity() + "|", 
			loanUses, 
			loanAmt, 
			loanAmt, 
			pq.getLoanIssue(), 
			pq.getLoanIssue(), 
			pq.getEstate() == null ? null : "|" + pq.getEstate() + "|", 
			pq.getVehicle() == null ? null : "|" + pq.getVehicle() + "|", 
			pq.getCredit() == null ? null : "|" + pq.getCredit() + "|", 
			pq.getIssueType(), 
			pq.getGuarantyType(), 
			pq.getRepayType() 
		};
		
		String[] conds = { 
			LIKE, 
			IN, 
			LE, 
			GE, 
			LE, 
			GE, 
			LIKE, 
			LIKE, 
			LIKE, 
			EQ, 
			EQ, 
			EQ 
		};
		
		List<String> ordKeys = new ArrayList<String>();
		List<String> ordVals = new ArrayList<String>();
		
		if (loanUses != null && loanUses.size() > 1) {
			ordKeys.add("loanUse");
			ordVals.add(DESC);
		}
		
		ordKeys.add("product.orders");
		ordVals.add(ASC);
		
		ordKeys.add("product.id");
		ordVals.add(ASC);
		
//		if (pq.getOrderRate() != null) {
//			ordKeys.add("product.intrFormula");
//			ordVals.add("0".equals(pq.getOrderRate()) ? ASC : DESC);
//		}
//		if (pq.getOrderMonthly() != null) {
//			ordKeys.add("product.monthlyFormula");
//			ordVals.add("0".equals(pq.getOrderMonthly()) ? ASC : DESC);
//		}
		
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

		List<String> loanUses = null;
		if (pq.getLoanUse() != null && !"".equals(pq.getLoanUse())) {
			loanUses = new ArrayList<String>();
			loanUses.add(pq.getLoanUse());
			if (!"0".equals(pq.getLoanUse())) {
				loanUses.add("0");
			}
		}
		
		Object[] vals = { 
			pq.getIdentity() == null ? null : "|" + pq.getIdentity() + "|", 
			loanUses, 
			loanAmt, 
			loanAmt, 
			pq.getLoanIssue(), 
			pq.getLoanIssue(), 
			pq.getEstate() == null ? null : "|" + pq.getEstate() + "|", 
			pq.getVehicle() == null ? null : "|" + pq.getVehicle() + "|", 
			pq.getCredit() == null ? null : "|" + pq.getCredit() + "|", 
			pq.getProductId(), 
			pq.getIssueType(), 
			pq.getGuarantyType(), 
			pq.getRepayType() 
		};
		
		String[] conds = { 
			LIKE, 
			IN, 
			LE, 
			GE, 
			LE, 
			GE, 
			LIKE, 
			LIKE, 
			LIKE, 
			EQ, 
			EQ, 
			EQ, 
			EQ 
		};
		
		String[] orderKeys = { "product.orders", "product.id" };
		String[] orderVals = { ASC, ASC };
		
		return productRepository.queryList(ProductAttach.class, keys, vals, 
				conds, orderKeys, orderVals);
	}
	
	public Page pagingProductBtwnAmount(int pageIndex, int pageSize, 
			BigDecimal minAmt, BigDecimal maxAmt) {
		BigDecimal minLoanAmt = minAmt == null ? null : new BigDecimal(10000).multiply(minAmt);
		BigDecimal maxLoanAmt = maxAmt == null ? null : new BigDecimal(10000).multiply(maxAmt);
		return productRepository.pagingProductBtwnAmount(pageIndex, 
				pageSize, minLoanAmt, maxLoanAmt);
	}
}
