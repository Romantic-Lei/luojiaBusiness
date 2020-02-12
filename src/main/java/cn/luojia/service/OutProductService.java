package cn.luojia.service;

import java.util.List;

import cn.luojia.vo.OutProductVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月12日
 * @Description
 */
public interface OutProductService {
	public List<OutProductVO> find(String inputDate);				// 获取生产厂家列表
}
