package com.webloan.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3780785877548682394L;
	
	   private Long id;//ID
       private Product product;//product_id;
	   private Cust       cust;//cust_id
	   private String     applyName ; //贷款申请人称呼
	   private String     applyTelephone;//贷款申请人联系电话
	   private BigDecimal applyAmt;//申请金额
	   private BigDecimal approvAmt;//批准金额
	   private String     custRegion;//申请人所处地区
	   private String     status="0";//订单状态,0-等待预审,1-等待审批,2-等待签约,3-等待放款,4-申贷成功,5-完结,6-审核未通过,7-订单失效,8-已取消
	   private Timestamp  orderTime;//订单时间
	   private String     approvOper;//审核人
	   private Timestamp  approvTime;//审核时间
	   private String     approvRemark;//审核意见
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cust getCust() {
		return cust;
	}
	public void setCust(Cust cust) {
		this.cust = cust;
	}
	public String getApplyName() {
		return applyName;
	}
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	public String getApplyTelephone() {
		return applyTelephone;
	}
	public void setApplyTelephone(String applyTelephone) {
		this.applyTelephone = applyTelephone;
	}
	public BigDecimal getApplyAmt() {
		return applyAmt;
	}
	public void setApplyAmt(BigDecimal applyAmt) {
		this.applyAmt = applyAmt;
	}
	public BigDecimal getApprovAmt() {
		return approvAmt;
	}
	public void setApprovAmt(BigDecimal approvAmt) {
		this.approvAmt = approvAmt;
	}
	public String getCustRegion() {
		return custRegion;
	}
	public void setCustRegion(String custRegion) {
		this.custRegion = custRegion;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public String getApprovOper() {
		return approvOper;
	}
	public void setApprovOper(String approvOper) {
		this.approvOper = approvOper;
	}
	public Timestamp getApprovTime() {
		return approvTime;
	}
	public void setApprovTime(Timestamp approvTime) {
		this.approvTime = approvTime;
	}
	public String getApprovRemark() {
		return approvRemark;
	}
	public void setApprovRemark(String approvRemark) {
		this.approvRemark = approvRemark;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
