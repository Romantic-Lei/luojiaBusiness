package cn.luojia.controller.cargo.contracthis;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Contract;
import cn.luojia.print.ContractPrint;
import cn.luojia.service.ContractHisService;
import cn.luojia.vo.ContractVO;

@Controller
public class ContractHisController extends BaseController {
	
	@Autowired
	ContractHisService contractHisService;
	
	// 历史列表
	@RequestMapping("/cargo/contracthis/list.action")
	public String list(Model model){
		List<Contract> dataList = contractHisService.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/contracthis/jContractHisList.jsp";
	}
	
	// 查看历史购销合同
	@RequestMapping("/cargo/contracthis/toview.action")
	public String toview(String id,Model model) {
		ContractVO obj = contractHisService.view(id);
		model.addAttribute("obj", obj);
		return "/cargo/contracthis/jContractHisView.jsp";
	}
	
	// 归档
	@RequestMapping("/cargo/contracthis/pigeinhole.action")
	public String pigeinhole(String[] id) {
		contractHisService.pigeinhole(id);
		
		return "redirect:/cargo/contracthis/list.action";
	}
	
	// 取消归档
	@RequestMapping("/cargo/contracthis/pigeouthole.action")
	public String pigeouthole(String[] id) {
		contractHisService.pigeouthole(id);
		
		return "redirect:/cargo/contracthis/list.action"; 
	}
	
	// 历史购销合同删除
	@RequestMapping("/cargo/contracthis/delete.action")
	public String delete(String[] id) {
		contractHisService.delete(id);
		
		return "redirect:/cargo/contracthis/list.action";
	}
	
	// 历史购销合同打印
	@RequestMapping("/cargo/contracthis/print.action")
	public void print(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/");
		
		ContractVO view = contractHisService.view(id);
		ContractPrint cp = new ContractPrint();
		cp.print(view, path, response);
	}
	

}
