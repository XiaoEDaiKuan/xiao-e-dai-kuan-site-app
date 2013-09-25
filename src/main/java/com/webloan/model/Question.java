package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5748791803533177763L;
	
	 private Long id;//主键
	 private Region  region;//提问人所属地区
	 private String  kindOne;//问题分类1
	 private String  kindTwo;//问题分类2
	 private String  askedBy;//提问人姓名
	 private Long     custID;//
	 private Timestamp askTime;//提问时间
	 private String   tag;//问题标签
	 private String   detail;//提问内容的详细描述'
	 private String   email;//提问人邮箱
	 private String   telephone;//提问人联系电话
	 private String   status;//问题状态
	 private Long     productID;//贷款产品ID
	 private String   subject;//主题
     private List<Answer> answers;//
     
	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public String getKindOne() {
		return kindOne;
	}
	public void setKindOne(String kindOne) {
		this.kindOne = kindOne;
	}
	public String getKindTwo() {
		return kindTwo;
	}
	public void setKindTwo(String kindTwo) {
		this.kindTwo = kindTwo;
	}
	public String getAskedBy() {
		return askedBy;
	}
	public void setAskedBy(String askedBy) {
		this.askedBy = askedBy;
	}
	public Long getCustID() {
		return custID;
	}
	public void setCustID(Long custID) {
		this.custID = custID;
	}
	public Timestamp getAskTime() {
		return askTime;
	}
	public void setAskTime(Timestamp askTime) {
		this.askTime = askTime;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getProductID() {
		return productID;
	}
	public void setProductID(Long productID) {
		this.productID = productID;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	
}
