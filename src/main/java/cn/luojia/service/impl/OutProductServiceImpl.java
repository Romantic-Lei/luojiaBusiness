package cn.luojia.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.OutProductDao;
import cn.luojia.service.OutProductService;
import cn.luojia.vo.OutProductVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月12日
 * @Description
 */
@Service
public class OutProductServiceImpl implements OutProductService {

	@Autowired
	OutProductDao outProductDao;

	@Override
	public List<OutProductVO> find(String inputDate) {
		Map paraMap = new HashMap();
		paraMap.put("inputDate", inputDate);
		
		return outProductDao.find(paraMap);
	}
	
	

}
