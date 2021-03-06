package cn.luojia.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ExportDao;
import cn.luojia.domain.Export;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 购销合同持久层
 */
@Repository
@SuppressWarnings(value = {"rawtypes"})
public class ExportDaoImpl extends BaseDaoImpl<Export> implements ExportDao {

	public ExportDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.ExportMapper");
	}

	@Override
	public void updateState(Map map) {
		super.getSqlSession().update(super.getNs() + ".updateState", map);
	}

	@Override
	public List<Export> findByLcno(String lcno) {
		
		return super.getSqlSession().selectList(super.getNs() + ".findByLcno", lcno);
	}
}
