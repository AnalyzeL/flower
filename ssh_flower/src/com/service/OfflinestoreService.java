package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.OfflinestoreDao;
import com.entity.Offlinestore;
import com.service.OfflinestoreService;

/**
 * 物流service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class OfflinestoreService{

	@Resource
	private  OfflinestoreDao offlinestoreDao;
	@Resource
	private Offlinestore offlinestore;

	
	//获取物流
	public Offlinestore getOfflinestore(int id) {
		return offlinestoreDao.getOfflinestore(id);
	}
	
	

	//获取物流信息列表
	public List<Offlinestore> getOfflinestores() {
		return offlinestoreDao.getOfflinestore();
	}

	//删除物流信息
	public void delete(int id) {
		offlinestore.setId(id);	
		offlinestoreDao.delete(offlinestore);
	}

	//更新物流信息
	public void update(Offlinestore offlinestore) {
		offlinestoreDao.update(offlinestore);
	}

	//添加物流信息
	public void add(Offlinestore offlinestore) {
		offlinestoreDao.save(offlinestore);
	}
 	
}
