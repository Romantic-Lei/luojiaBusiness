package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ContractHisDao;
import cn.luojia.domain.Contract;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月18日
 * @Description 购销合同持久层
 */
@Repository
@SuppressWarnings(value = {"rawtypes"})
public class ContractHisDaoImpl extends BaseDaoImpl<Contract> implements ContractHisDao {

	public ContractHisDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.ContractHisMapper");
	}

	@Override
	public ContractVO view(String contractId) {
		return super.getSqlSession().selectOne(super.getNs() + ".view", contractId);
	}
}
