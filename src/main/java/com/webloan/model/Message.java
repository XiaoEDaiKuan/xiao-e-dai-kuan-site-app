package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6942426420042388473L;

	private Long id;// 主键
	private Cust   cust;//cust_id
	private String fromPerson;// 发信人
	private String toPerson;// 收信人
	private String subject;// 标题
	private String content;// 站内消息内容
	private Timestamp sendTime;// 发送时间
	private String Status;// 状态

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Cust getCust() {
		return cust;
	}

	public void setCust(Cust cust) {
		this.cust = cust;
	}

	public String getFromPerson() {
		return fromPerson;
	}

	public void setFromPerson(String fromPerson) {
		this.fromPerson = fromPerson;
	}

	public String getToPerson() {
		return toPerson;
	}

	public void setToPerson(String toPerson) {
		this.toPerson = toPerson;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getSendTime() {
		return sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
