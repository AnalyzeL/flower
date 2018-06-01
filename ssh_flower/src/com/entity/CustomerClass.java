package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

/**
 * 顾客分类实体类
 * 与数据库相对应
 */
@Entity //hibernate模型
@Component //spring受管bean
public class CustomerClass {
	@Id
	@GeneratedValue //id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int userclassId;
	private String userclassname;
	private int userinfomax;
	private int userinfomin;
	
	public int getUserclassId() {
		return userclassId;
	}
	public void setUserclassId(int userclassId) {
		this.userclassId = userclassId;
	}
	public String getUserclassname() {
		return userclassname;
	}
	public void setUserclassname(String userclassname) {
		this.userclassname = userclassname;
	}
	public int getUserinfomax() {
		return userinfomax;
	}
	public void setUserinfomax(int userinfomax) {
		this.userinfomax = userinfomax;
	}
	public int getUserinfomin() {
		return userinfomin;
	}
	public void setUserinfomin(int userinfomin) {
		this.userinfomin = userinfomin;
	}
	
}
