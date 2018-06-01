package com.entity;

import java.util.List;

public class Navigation {
	private int id;
	private String name;
	List<Flower> flowers;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Flower> getFlowers() {
		return flowers;
	}
	public void setFlowers(List<Flower> flowers) {
		this.flowers = flowers;
	}
}
