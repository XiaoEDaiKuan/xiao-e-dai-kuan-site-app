package com.webloan.product.view;

import java.math.BigDecimal;

import com.webloan.model.Product;
import com.webloan.model.ProductAttach;


public class ProductView {
	
	private Product product;
	private ProductAttach attach;
	
	private int numOrders = 0;
	private int sucOrders = 0;
	
	private BigDecimal interest;
	private BigDecimal monthlyPay;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ProductAttach getAttach() {
		return attach;
	}
	public void setAttach(ProductAttach attach) {
		this.attach = attach;
	}
	public int getNumOrders() {
		return numOrders;
	}
	public void setNumOrders(int numOrders) {
		this.numOrders = numOrders;
	}
	public int getSucOrders() {
		return sucOrders;
	}
	public void setSucOrders(int sucOrders) {
		this.sucOrders = sucOrders;
	}
	public BigDecimal getInterest() {
		return interest;
	}
	public void setInterest(BigDecimal interest) {
		this.interest = interest;
	}
	public BigDecimal getMonthlyPay() {
		return monthlyPay;
	}
	public void setMonthlyPay(BigDecimal monthlyPay) {
		this.monthlyPay = monthlyPay;
	}
}