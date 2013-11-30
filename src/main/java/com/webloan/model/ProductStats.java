package com.webloan.model;

import java.io.Serializable;

public class ProductStats implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5082151512796779080L;

	private Long id;// id
	private Product product;
	private String productCode;// product_code
	private Long successCnt;// success_cnt
	private Long totalCnt;// total_cnt

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public Long getSuccessCnt() {
		return successCnt;
	}

	public void setSuccessCnt(Long successCnt) {
		this.successCnt = successCnt;
	}

	public Long getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(Long totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
