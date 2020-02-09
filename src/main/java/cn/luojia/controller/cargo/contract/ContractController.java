package cn.luojia.controller.cargo.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Contract;
import cn.luojia.service.ContractService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月9日
 * @Description 购销合同控制层
 */
@Controller
public class ContractController extends BaseController {
	@Autowired
	ContractService contractService;
	
	@RequestMapping("/cargo/contract/list.action")
	public String list(Model model) {
		List<Contract> dataList = contractService.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/contract/jContractList.jsp";
	}
}
