package cn.luojia.dao;

import java.io.Serializable;

import cn.luojia.domain.ExtCproduct;

/**
 * 继承了基础的方法，可以将此接口留作扩展，以后可以添加新的方法
 * @author Memories
 *
 */
public interface ExtCproductDao extends BaseDao<ExtCproduct> {
	public void deleteByContractProductById(Serializable[] ids);
	public void deleteByContractId(Serializable[] contractIds);
}
