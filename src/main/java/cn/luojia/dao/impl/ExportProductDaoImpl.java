package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ExportProductDao;
import cn.luojia.domain.ExportProduct;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 合同下货物持久层
 */
@Repository
public class ExportProductDaoImpl extends BaseDaoImpl<ExportProduct> implements ExportProductDao {
	public ExportProductDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.ExportProductMapper");
	}
}
