package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.FactoryDao;
import cn.luojia.domain.Factory;
import cn.luojia.pagination.Page;
import cn.luojia.service.FactoryService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月7日
 * @Description
 */
@Service
public class FactoryServiceImpl implements FactoryService {

	@Autowired
	FactoryDao factoryDao;
	
	@Override
	public List<Factory> findPage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Factory> find(Map paraMap) {
		return factoryDao.find(paraMap);
	}

	@Override
	public Factory get(Serializable id) {
		return factoryDao.get(id);
	}

	@Override
	public void insert(Factory factory) {
		// 设置UUID
		factory.setId(UUID.randomUUID().toString());
		factory.setState("1"); // 设置默认状态为启动
		factoryDao.insert(factory);
	}

	@Override
	public void update(Factory factory) {
		factoryDao.update(factory);
	}

	@Override
	public void deleteById(Serializable id) {
		factoryDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		factoryDao.delete(ids);
	}

	@Override
	public void start(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 1); // 1 为启用
		map.put("ids", ids);
		factoryDao.updateState(map);
	}

	@Override
	public void stop(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 0); // 0 为停用
		map.put("ids", ids);
		factoryDao.updateState(map);		
	}

}
