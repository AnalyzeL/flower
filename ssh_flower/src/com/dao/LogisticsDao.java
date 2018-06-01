package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.LogisticsDao;
import com.entity.Logistics;
import com.entity.Manager;


/**
 * 物流dao实现  
 * 负责物流相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class LogisticsDao extends BaseDao{

	//根据id查找物流
	public Logistics getlogistics(int id) {
		return getSession().createQuery("from Logistics where id=:id", Logistics.class)
				.setParameter("id", id).uniqueResult();
	}
	
	

	//获取物流信息列表
	public List<Logistics> getLogisticss() {
		return getSession().createQuery("from Logistics", Logistics.class).list();
	}

	
}
