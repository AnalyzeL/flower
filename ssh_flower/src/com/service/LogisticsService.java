package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LogisticsDao;
import com.dao.ManagerDao;
import com.entity.Logistics;
import com.entity.Manager;
import com.service.LogisticsService;

/**
 * 物流service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class LogisticsService{

	@Resource
	private LogisticsDao logisticsDao;
	@Resource
	private Logistics logistics;

	
	//获取物流
	public Logistics getLogistics(int id) {
		return logisticsDao.getlogistics(id);
	}
	
	

	//获取物流信息列表
	public List<Logistics> getLogisticss() {
		return logisticsDao.getLogisticss();
	}

	//删除物流信息
	public void delete(int id) {
		logistics.setId(id);	
		logisticsDao.delete(logistics);
	}

	//更新物流信息
	public void update(Logistics logistics) {
		logisticsDao.update(logistics);
	}

	//添加物流信息
	public void add(Logistics logistics) {
		logisticsDao.save(logistics);
	}
 	
}
