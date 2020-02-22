package cn.luojia.controller.cargo.contract;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Contract;
import cn.luojia.print.ContractPrint;
import cn.luojia.print.ContractPrintTemplate;
import cn.luojia.service.ContractService;
import cn.luojia.vo.ContractVO;

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
		
		// 极不推荐这样处理冗余字段 合同总金额，推荐在购销合同和附件中各自对合同总金额进行操作
		Contract _contract;
		for(Contract contract : dataList) {
			// 临时合同对象
			_contract = contractService.get(contract.getId());
			if(contract.getTotalAmount() != null && !contract.getTotalAmount().equals(_contract.getTotalAmount())) {
				// 数据库中合同总金额和 查询出来的总金额不对应就更新
				contract.setTotalAmount(contract.getTotalAmount());
				contractService.update(contract);
			}
		}
		
		model.addAttribute("dataList", dataList);
		
		return "/cargo/contract/jContractList.jsp";
	}
	
	@RequestMapping("/cargo/contract/tocreate.action")
	public String tocreate() {
		return "/cargo/contract/jContractCreate.jsp";
	}
	
	@RequestMapping("/cargo/contract/toview.action")
	public String toview(String id, Model model) {
		ContractVO obj = contractService.view(id);
		model.addAttribute("obj", obj);
		
		return "/cargo/contract/jContractView.jsp";
	}
	
	@RequestMapping("/cargo/contract/insert.action")
	public String insert(Contract contract) {
		contractService.insert(contract);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	@RequestMapping("/cargo/contract/toupdate.action")
	public String toupdate(String id, Model model) {
		Contract obj = contractService.get(id);
		model.addAttribute("obj", obj);
		
		return "/cargo/contract/jContractUpdate.jsp";
	}
	
	@RequestMapping("/cargo/contract/update.action")
	public String update(Contract contract) {
		contractService.update(contract);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	@RequestMapping("/cargo/contract/deleteById.action")
	public String deleteById(String id) {
		contractService.deleteById(id);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	// 参数名字要和 SQL xml文件中的  item="id" 一致
	@RequestMapping("/cargo/contract/delete.action")
	public String delete(String[] id) {
		contractService.delete(id);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	@RequestMapping("/cargo/contract/submit.action")
	public String submit(String[] id) {
		contractService.submit(id);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	@RequestMapping("/cargo/contract/cancel.action")
	public String cancel(@RequestParam("id") String[] ids) {
		contractService.cancel(ids);
		
		return "redirect:/cargo/contract/list.action";
	}
	
	// 手工POI打印
	@RequestMapping("/cargo/contract/print.action")
	public void print(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ContractPrint cp = new ContractPrint();
		
		ContractVO obj = contractService.view(id);
		
		cp.print(obj, request.getSession().getServletContext().getRealPath("/"), response);
		
	}
	// 模板打印
	@RequestMapping("/cargo/contract/templatePrint.action")
	public void templatePrint(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ContractPrintTemplate cp = new ContractPrintTemplate();
		
		ContractVO obj = contractService.view(id);
		
		cp.print(obj, request.getSession().getServletContext().getRealPath("/"), response);
		
	}
	
}
