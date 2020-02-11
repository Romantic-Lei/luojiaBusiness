package cn.luojia.controller.cargo.contract;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.domain.ExtCproduct;
import cn.luojia.domain.Factory;
import cn.luojia.domain.SysCode;
import cn.luojia.service.ExtCproductService;
import cn.luojia.service.FactoryService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月10日
 * @Description 货物附件控制层
 */
@Controller
public class ExtCProductController {

	@Autowired
	ExtCproductService extCproductService;
	@Autowired
	FactoryService factoryService;
	
	@RequestMapping("/cargo/extcproduct/tocreate.action")
	public String tocreate(String contractProductId, Model model) {
		model.addAttribute("contractProductId", contractProductId);
		// 准备列表数据
		Map paraMap = new HashMap();
		paraMap.put("contractProductId", contractProductId);
		List<ExtCproduct> dataList = extCproductService.find(paraMap);
		model.addAttribute("dataList", dataList);
		
		//生产厂家
		//准备生产厂家的下拉列表
		List<Factory> factoryList = factoryService.getFactoryList();
		model.addAttribute("factoryList", factoryList);
		
		List<SysCode> ctypeList = extCproductService.getCtypeList();
		model.addAttribute("ctypeList", ctypeList);
		
		return "/cargo/contract/jExtCproductCreate.jsp";
	}
	
	@RequestMapping("/cargo/extcproduct/insert.action")
	public String insert(ExtCproduct extCproduct, Model model) {
		extCproductService.insert(extCproduct);
		model.addAttribute("contractProductId", extCproduct.getContractProductId());
		
		return "redirect:/cargo/extcproduct/tocreate.action";
	}
	
	@RequestMapping("/cargo/extcproduct/toupdate.action")
	public String toupdate(String id, Model model) {
		ExtCproduct obj = extCproductService.get(id);
		model.addAttribute("obj", obj);
		
		//准备生产厂家的下拉列表
		List<Factory> factoryList = factoryService.getFactoryList();
		model.addAttribute("factoryList", factoryList);
		
		//准备分类下拉列表
		List<SysCode> ctypeList = extCproductService.getCtypeList();
		model.addAttribute("ctypeList", ctypeList);
		
		return "/cargo/contract/jExtCproductUpdate.jsp";
	}
	
	@RequestMapping("/cargo/extcproduct/update.action")
	public String update(ExtCproduct extCproduct, Model model) {
		extCproductService.update(extCproduct);
		model.addAttribute("contractProductId", extCproduct.getContractProductId());	//传递主表Id
		
		return "redirect:/cargo/extcproduct/tocreate.action";
	}
	
	@RequestMapping("/cargo/extcproduct/deleteById.action")
	public String deleteById(String id, String contractProductId, Model model) {
		extCproductService.deleteById(id);
		model.addAttribute("contractProductId", contractProductId);
		
		return "redirect:/cargo/extcproduct/tocreate.action";
	}
	
}
