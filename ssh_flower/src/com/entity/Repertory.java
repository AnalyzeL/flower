package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

/**
 * 顾客实体类
 * 与数据库相对应
 */
@Entity //hibernate模型
@Component //spring受管bean
public class Repertory {

	@Id
	@GeneratedValue //id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int id;
	private int num;
	private int offlinestoreId;
	private int flowerID;
	
	public int getFlowerID() {
		return flowerID;
	}
	public void setFlowerID(int flowerID) {
		this.flowerID = flowerID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOfflinestoreId() {
		return offlinestoreId;
	}
	public void setOfflinestoreId(int offlinestoreId) {
		this.offlinestoreId = offlinestoreId;
	}

	
	
}
