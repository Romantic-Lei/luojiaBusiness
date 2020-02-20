package cn.luojia.dao;

import java.util.List;
import java.util.Map;

import cn.luojia.domain.Export;

public interface ExportDao extends BaseDao<Export> {
	public void updateState(Map map);				// 修改状态
	public List<Export> findByLcno(String lcno);	// 信用证号查找货物
}
