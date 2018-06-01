package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.ManagerDao;
import com.entity.Manager;


/**
 * 掌柜dao实现  
 * 负责掌柜相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class ManagerDao extends BaseDao{

	//根据id查找用户
	public Manager getManager(int id) {
		return getSession().createQuery("from Manager where id=:id", Manager.class)
				.setParameter("id", id).uniqueResult();
	}
	
	//根据用户名和密码查找用户
	public Manager getManager(String username, String password){
		return getSession().createQuery("from Manager where username=:username and password=:password", Manager.class)
			.setParameter("username", username).setParameter("password", password).uniqueResult();
	}

	//获取掌柜信息列表
	public List<Manager> getManagers() {
		return getSession().createQuery("from Manager", Manager.class).list();
	}

	//用户名是否存在
	public Object getManager(String username) {
		return getSession().createQuery("from Manager where username=:username", Manager.class)
				.setParameter("username", username).uniqueResult();
	}

	
}
