package cn.luojia.dao;

import java.util.Map;

import cn.luojia.domain.Factory;

public interface FactoryDao extends BaseDao<Factory> {
	public void updateState(Map map);		// 修改状态
}
