package cn.luojia.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ContractDao;
import cn.luojia.domain.Contract;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月9日
 * @Description 购销合同持久层
 */
@Repository
@SuppressWarnings(value = {"rawtypes"})
public class ContractDaoImpl extends BaseDaoImpl<Contract> implements ContractDao {

	public ContractDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.ContractMapper");
	}

	@Override
	public void updateState(Map map) {
		super.getSqlSession().update(super.getNs() + ".updateState", map);
	}

	@Override
	public ContractVO view(String contractId) {
		return super.getSqlSession().selectOne(super.getNs() + ".view", contractId);
	}
}
