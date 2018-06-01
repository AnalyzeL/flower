package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ManagerDao;
import com.entity.Manager;
import com.service.ManagerService;

/**
 * 掌柜service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class ManagerService{

	@Resource
	private ManagerDao managerDao;
	@Resource
	private Manager manager;

	
	//获取掌柜
	public Manager getManager(int id) {
		return managerDao.getManager(id);
	}
	
	//获取掌柜
	public Manager getManager(Manager manager){
		return managerDao.getManager(manager.getUsername(), manager.getPassword());
	}

	//获取掌柜信息列表
	public List<Manager> getManagers() {
		return managerDao.getManagers();
	}

	//删除掌柜信息
	public void delete(int id) {
		manager.setId(id);	//设置掌柜id
		managerDao.delete(manager);//根据id删除掌柜
	}

	//更新掌柜信息
	public void update(Manager manager) {
		managerDao.update(manager);
	}

	//添加掌柜信息
	public void add(Manager manager) {
		managerDao.save(manager);
	}

	//判断用户名是否存在
	public boolean isManager(Manager manager) {
		if (managerDao.getManager(manager.getUsername())!=null) {
			return true;
		}return false;
	}
	
}
