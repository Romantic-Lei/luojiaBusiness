package cn.luojia.controller.cargo.contracthis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.service.ContractHisService;

@Controller
public class ContractHisController extends BaseController {
	
	@Autowired
	ContractHisService contractHisService;
	
	// 历史列表
	@RequestMapping("/cargo/contracthis/list.action")
	public String list() {
		
		return "";
	}
	
	// 归档
	@RequestMapping("/cargo/contracthis/pigeinhole.action")
	public String pigeinhole(String[] id) {
		contractHisService.pigeinhole(id);
		
		return "";
	}

}
