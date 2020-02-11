package cn.luojia.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.SysCodeDao;
import cn.luojia.domain.SysCode;
import cn.luojia.service.SysCodeService;

@Service
public class SysCodeServiceImpl implements SysCodeService {

	@Autowired
	SysCodeDao sysCodeDao;
	
	@Override
	public List<SysCode> find(Map paraMap) {
		return sysCodeDao.find(paraMap);
	}

}
