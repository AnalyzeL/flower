package com.entity;

import javax.persistence.Entity;

import org.springframework.stereotype.Component;


@Component //spring受管bean
public class CustomerAll {
	private Customer customer;
	private int consumption;
	private String userclassname;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getConsumption() {
		return consumption;
	}
	public void setConsumption(int consumption) {
		this.consumption = consumption;
	}
	public String getUserclassname() {
		return userclassname;
	}
	public void setUserclassname(String userclassname) {
		this.userclassname = userclassname;
	}
	
}
