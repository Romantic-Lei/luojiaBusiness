package cn.luojia.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.common.springdao.SqlDao;
import cn.luojia.dao.ContractHisDao;
import cn.luojia.domain.Contract;
import cn.luojia.pagination.Page;
import cn.luojia.service.ContractHisService;
import cn.luojia.util.UtilFuns;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月18日
 * @Description
 */
@Service
public class ContractHisServiceImpl implements ContractHisService {

	@Autowired
	SqlDao sqlDao;
	@Autowired
	ContractHisDao contractHisDao;
	
	@Override
	public void pigeinhole(String[] contractIds) {
		sqlDao.batchSQL(this.doData(contractIds, "", "_his"));			// 批量执行
	}

	@Override
	public void pigeouthole(String[] contractIds) {
		sqlDao.batchSQL(this.doData(contractIds, "_his", ""));
	}
	
	//处理数据:由源表向目的表赋值数据，将源表数据删除
	//参数：操作表id,源表,目的表
	public String[] doData(String[] contractIds,String source,String target){
		StringBuffer sBuf = new StringBuffer();
		//将当前表的数据插入到历史表中
		String inStr = UtilFuns.joinStr(contractIds, "'", "'", ",");		//合同的id串 x,y ,构造成in 子查询串'x','y'
		//处理历史合同新增
		sBuf.append("insert into contract").append(target).append("_c (select * from contract").append(source).append("_c where contract_id in (").append(inStr).append("));");
		//处理历史货物新增
		sBuf.append("insert into contract_product").append(target).append("_c (select * from contract_product").append(source).append("_c where contract_id in (").append(inStr).append("));");
		//处理历史附件新增
		sBuf.append("insert into ext_cproduct").append(target).append("_c (select * from ext_cproduct").append(source).append("_c where contract_product_id in (select contract_product_id from contract_product").append(source).append("_c where contract_id in (").append(inStr).append(")));");
		
		//当前表的数据删除，删除需要从最先面的开始删
		sBuf.append("delete from ext_cproduct").append(source).append("_c where contract_product_id in (select contract_product_id from contract_product").append(source).append("_c where contract_id in (").append(inStr).append("));");
		sBuf.append("delete from contract_product").append(source).append("_c where contract_id in (").append(inStr).append(");");
		sBuf.append("delete from contract").append(source).append("_c where contract_id in (").append(inStr).append(");");
		
		return sBuf.toString().split(";");			//批量执行，将SQL语句以分号分割成6条语句
	}
	
	//删除归档合同里面的 附件，产品，合同
	public void deleteAll(String[] contractIds) {
		StringBuffer sBuf = new StringBuffer();
		String inStr = UtilFuns.joinStr(contractIds, "'", "'", ",");
		sBuf.append("delete from ext_cproduct_his_c where contract_product_id in (select contract_product_id from contract_product_his_c where contract_id in (").append(inStr).append("));");
		sBuf.append("delete from contract_product_his_c where contract_id in (").append(inStr).append(");");
		sBuf.append("delete from contract_his_c where contract_id in (").append(inStr).append(");");
		
		sqlDao.batchSQL(sBuf.toString().split(";"));
	}

	@Override
	public List<Contract> findPage(Page page) {
		return contractHisDao.findPage(page);
	}

	@Override
	public List<Contract> find(Map paraMap) {
		return contractHisDao.find(null);
	}

	@Override
	public ContractVO view(String contractId) {
		return contractHisDao.view(contractId);
	}

}
