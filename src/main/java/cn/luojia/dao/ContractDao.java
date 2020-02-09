package cn.luojia.dao;

import java.util.Map;

import cn.luojia.domain.Contract;

public interface ContractDao extends BaseDao<Contract> {
	public void updateState(Map map);		// 修改状态
}
