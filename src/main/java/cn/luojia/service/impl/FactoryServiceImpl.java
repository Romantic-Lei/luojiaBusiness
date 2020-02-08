package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Factory factory) {
		factoryDao.insert(factory);
	}

	@Override
	public void update(Factory factory) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		
	}

}
