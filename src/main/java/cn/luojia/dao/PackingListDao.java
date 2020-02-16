package cn.luojia.dao;

import java.util.Map;

import cn.luojia.domain.PackingList;

public interface PackingListDao extends BaseDao<PackingList> {
	public void updateState(Map map);						// 修改状态
}
