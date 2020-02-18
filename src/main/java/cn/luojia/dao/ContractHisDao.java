package cn.luojia.dao;

import cn.luojia.domain.Contract;
import cn.luojia.vo.ContractVO;

public interface ContractHisDao extends BaseDao<Contract> {
	public ContractVO view(String contractId);				// 查询某个合同
}
