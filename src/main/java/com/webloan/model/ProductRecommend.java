package com.webloan.model;

import java.io.Serializable;

public class ProductRecommend implements Serializable {

	private static final long serialVersionUID = 2422869190420627716L;
	
	private Long id;
	private String type;
	private Product product;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
