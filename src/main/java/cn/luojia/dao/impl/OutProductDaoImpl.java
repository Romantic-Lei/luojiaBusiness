package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.OutProductDao;
import cn.luojia.vo.OutProductVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月7日
 * @Description 厂家持久层
 */
@Repository
public class OutProductDaoImpl extends BaseDaoImpl<OutProductVO> implements OutProductDao {

	public OutProductDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.OutProductMapper");
	}
}
