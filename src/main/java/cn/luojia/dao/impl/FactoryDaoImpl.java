package cn.luojia.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.FactoryDao;
import cn.luojia.domain.Factory;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月7日
 * @Description 厂家持久层
 */
@Repository
public class FactoryDaoImpl extends BaseDaoImpl<Factory> implements FactoryDao {

	public FactoryDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.FactoryMapper");
	}

	@Override
	public void updateState(Map map) {
		super.getSqlSession().update(super.getNs() + ".updateState", map);
	}
}
