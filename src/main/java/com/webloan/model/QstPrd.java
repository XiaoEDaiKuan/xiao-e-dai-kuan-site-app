package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;

import com.webloan.util.DateUtils;

public class QstPrd implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8870106744912353656L;
	private Long questionId;// 问题id
	private Long prdId;// 产品id
	private String prdName;// 产品名称
	private String subject;// 问题的主题
	private Timestamp askTime;// 提问时间
	private String status;// 问题状态
	private Region region;// 提问人所属地区
	private String kindOne;// 问题分类1
	private String kindTwo;// 问题分类2
	private String askedBy;// 提问人姓名
	private Long custID;//
	private String tag;// 问题标签
	private String detail;// 提问内容的详细描述'
	private String email;// 提问人邮箱
	private String telephone;// 提问人联系电话
	
    

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

	public QstPrd(Long questionId, Long prdId, String prdName, String subject,
			String status,Object askTime,String detail,Region region) {
		super();
		this.prdId = prdId;
		this.prdName = prdName;
		this.questionId = questionId;
		this.status = status;
		this.subject = subject;
		this.askTime=DateUtils.stringToTimestamp(askTime.toString());
		this.detail=detail;
		this.region=region;
		
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public Long getPrdId() {
		return prdId;
	}

	public void setPrdId(Long prdId) {
		this.prdId = prdId;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Timestamp getAskTime() {
		return askTime;
	}

	public void setAskTime(Timestamp askTime) {
		this.askTime = askTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
