package cn.luojia.controller.cargo.export;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Contract;
import cn.luojia.domain.Export;
import cn.luojia.service.ExportService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 出口报运控制层
 */
@Controller
public class ExportController extends BaseController {
	@Autowired
	ExportService exportService;
	
	@RequestMapping("/cargo/export/list.action")
	public String list(Model model) {
		List<Export> dataList = exportService.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/export/jExportList.jsp";
	}
	
	// 购销合同查询列表
	@RequestMapping("/cargo/export/contractList.action")
	public String contractList(Model model) {
		List<Contract> dataList = exportService.getContractList();
		model.addAttribute("dataList", dataList);
		
		// 报运目录下调用购销合同，只显示已上报购销合同
		return "/cargo/export/jContractList.jsp";
	}
	
	// 报运新增,直接在后台保存,批量保存
	@RequestMapping("/cargo/export/insert.action")
	public String insert(@RequestParam("id") String[] contractIds) { 		// 合同的 id 集合
		
		exportService.insert(contractIds);
		
		return "redirect:/cargo/export/list.action";
	}
	
	// 修改
	@RequestMapping("/cargo/export/toupdate.action")
	public String toupdate(String id, Model model) {
		Export obj = exportService.get(id);
		model.addAttribute("obj", obj);
		
		return "cargo/export/jExportUpdate.jsp";
	}
	
	@RequestMapping("/cargo/export/update.action")
	public String update(Export export) {
		exportService.update(export);
		
		return "redirect:/cargo/export/list.action";
	}

}
