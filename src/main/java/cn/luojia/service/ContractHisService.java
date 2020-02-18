package cn.luojia.service;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月18日
 * @Description 历史购销合同
 */
public interface ContractHisService {

	public void pigeinhole(String[] contractIds);			// 归档
	public void pigeouthole(String[] contractIds);			// 取消归档
}
