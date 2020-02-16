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
		
		// 准备批量修改控件的数据mrecord
		model.addAttribute("mRecordData", exportService.getMrecordDate(id));
		
		return "/cargo/export/jExportUpdate.jsp";
	}
	
	@RequestMapping("/cargo/export/update.action")
	public String update(Export export,
			String[] mr_id,
			Integer[] mr_orderNo,
			Integer[] mr_cnumber,
			Double[] mr_grossWeight,
			Double[] mr_netWeight,
			Double[] mr_sizeLength,
			Double[] mr_sizeWidth,
			Double[] mr_sizeHeight,
			Double[] mr_exPrice,
			Double[] mr_tax,
			Integer[] mr_changed) {
		exportService.update(export,
				mr_id,
				mr_orderNo,
				mr_cnumber,
				mr_grossWeight,
				mr_netWeight,
				mr_sizeLength,
				mr_sizeWidth,
				mr_sizeHeight,
				mr_exPrice,
				mr_tax,
				mr_changed);
		
		return "redirect:/cargo/export/list.action";
	}

}
