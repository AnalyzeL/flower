package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.OfflinestoreDao;
import com.entity.Offlinestore;


/**
 * 线下商店dao实现  
 * 负责线下商店相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class OfflinestoreDao extends BaseDao{

	//根据id查找物流
	public Offlinestore getOfflinestore(int id) {
		return getSession().createQuery("from Offlinestore where id=:id", Offlinestore.class)
				.setParameter("id", id).uniqueResult();
	}
	
	

	//获取物流信息列表
	public List<Offlinestore> getOfflinestore() {
		return getSession().createQuery("from Offlinestore", Offlinestore.class).list();
	}

	
}
