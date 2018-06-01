package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.LogisticsDao;
import com.entity.Logistics;
import com.entity.Manager;
import com.entity.Repertory;


/**
 * 库存dao实现  
 * 负责库存相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class RepertoryDao extends BaseDao{

	//根据id查找物流
	public List<Repertory> getRepertoryByFlowerID(int id) {
		return getSession().
				createSQLQuery("SELECT id,flowerID,offlinestoreId,SUM(num) num  FROM Repertory WHERE flowerID=:id GROUP BY offlinestoreId")
				.setParameter("id", id).addEntity(Repertory.class).list();
	}
	
	

	//获取物流信息列表
	public List<Repertory> getRepertory() {
		return getSession().createQuery("from Repertory", Repertory.class).list();
		
	}

	
}
