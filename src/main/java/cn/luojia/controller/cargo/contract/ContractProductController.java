package cn.luojia.controller.cargo.contract;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Contract;
import cn.luojia.domain.ContractProduct;
import cn.luojia.domain.Factory;
import cn.luojia.service.ContractProductService;
import cn.luojia.service.ContractService;
import cn.luojia.service.FactoryService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月10日
 * @Description
 */
@Controller
public class ContractProductController extends BaseController {
	
	@Autowired
	ContractProductService contractProductService;
	@Autowired
	ContractService contractService;
	@Autowired
	FactoryService factoryService;
	
	// 转向新增页面
	@RequestMapping("/cargo/contractproduct/tocreate.action")
	public String tocreate(String contractId, Model model) {
		model.addAttribute("contractId", contractId);
		
		// 准备生产厂家的下拉列表
		List<Factory> factoryList = factoryService.getFactoryList();
		model.addAttribute("factoryList", factoryList);
		
		// 某个合同下的货物列表
		Map paraMap = new HashMap();
		paraMap.put("contractId", contractId);
		List<ContractProduct> dataList = contractProductService.find(paraMap);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/contract/jContractProductCreate.jsp";
	}
	
	// 新增
	@RequestMapping("/cargo/contractproduct/insert.action")
	public String insert(ContractProduct contractProduct, Model model) {
		contractProductService.insert(contractProduct);
		
		// 传递主表id
		model.addAttribute("contractId", contractProduct.getContractId());
		
		// 新增完一条货物信息之后，接着在继续新增货物信息，批量
		return "redirect:/cargo/contractproduct/tocreate.action";
	}
	
	// 转向修改页面
	@RequestMapping("/cargo/contractproduct/toupdate.action")
	public String toupdate(String id, Model model) {
		ContractProduct obj = contractProductService.get(id);
		model.addAttribute("obj", obj);
		
		// 准备生产厂家的下拉列表
		List<Factory> factoryList = factoryService.getFactoryList();
		model.addAttribute("factoryList", factoryList);
		
		return "/cargo/contract/jContractProductUpdate.jsp";
	}
	
	// 修改
	@RequestMapping("/cargo/contractproduct/update.action")
	public String update(ContractProduct contractProduct, Model model) {
		contractProductService.update(contractProduct);
		// 修改合同冗余的总金额，其他增删改查也是同理
		Double amount = contractProduct.getAmount();
		Contract contract = contractService.get(contractProduct.getContractId());
		contract.setTotalAmount(amount);
		contractService.update(contract);
		//重定向的时候把id传到新增页面，避免id遗失
		model.addAttribute("contractId", contractProduct.getContractId());
		
		return "redirect:/cargo/contractproduct/tocreate.action";
	}
	
	// 删除
	@RequestMapping("/cargo/contractproduct/deleteById.action")
	public String deleteById(String id, String contractId, Model model) {
		contractProductService.deleteById(id);
		model.addAttribute("contractId", contractId);		//传递主表ID
		
		return "redirect:/cargo/contractproduct/tocreate.action";
	}
	
}
