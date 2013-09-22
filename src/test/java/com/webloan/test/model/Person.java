package com.webloan.test.model;

import java.io.Serializable;

public class Person implements Serializable {

	private static final long serialVersionUID = 8782304097081057618L;
	
	private Long id;
	private String name;
	private Integer age;
	private String address;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "Person[id=" + id + ", name=" + name + "]";
	}
}
