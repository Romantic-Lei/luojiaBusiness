package cn.luojia.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.PackingListDao;
import cn.luojia.domain.PackingList;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月16日
 * @Description 装箱持久层
 */
@Repository
@SuppressWarnings(value = {"rawtypes"})
public class PackingListDaoImpl extends BaseDaoImpl<PackingList> implements PackingListDao {

	public PackingListDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.PackingListMapper");
	}

	@Override
	public void updateState(Map map) {
		super.getSqlSession().update(super.getNs() + ".updateState", map);
	}
}
