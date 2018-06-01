package com.dao;

import java.util.List;






import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.FlowerDao;
import com.entity.Category;
import com.entity.Flower;


/**
 * 鲜花dao实现  
 * 负责鲜花相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class FlowerDao extends BaseDao{

	//获取类目信息
	public List<Category> getCategorys() {
		return getSession().createQuery("from Category", Category.class).list();
	}

	//获取首页展示的鲜花信息
	public List<Flower> getHotFlowers(int i) {
		return getSession().createQuery("from Flower where hot=1 order by id desc", Flower.class)
				.setFirstResult(0).setMaxResults(i).list();
	}

	//获取某类目下的鲜花信息
	public List<Flower> getFlowers(int category_id) {
		return getSession().createQuery("from Flower where category_id=:category_id order by id desc", Flower.class)
				.setParameter("category_id", category_id).list();
	}

	//根据id获取鲜花信息
	public Flower getFlower(int flowerid) {
		return getSession().createQuery("from Flower where id=:flowerid", Flower.class)
				.setParameter("flowerid", flowerid).uniqueResult();
	}
	//根据id获取鲜花信息
	public Category getCategory(int id) {
		return getSession().createQuery("from Category where id=:id", Category.class)
					.setParameter("id", id).uniqueResult();
	}
	
	//根据名称获取鲜花信息
	public Flower getFlower(String goodsName) {
		return getSession().createQuery("from Flower where name=:goodsName", Flower.class)
				.setParameter("goodsName", goodsName).uniqueResult();
	}

	//获取鲜花信息列表
	public List<Flower> getFlowers() {
		return getSession().createQuery("from Flower order by id desc", Flower.class).list();
	}

}
