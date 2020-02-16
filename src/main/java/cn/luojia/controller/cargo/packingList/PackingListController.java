package cn.luojia.controller.cargo.packingList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.dao.PackingListDao;
import cn.luojia.domain.PackingList;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月16日
 * @Description 报运装箱控制层
 */
@Controller
public class PackingListController {
	
	@Autowired
	PackingListDao packingListDao;
	
	@RequestMapping("/cargo/packinglist/list.action")
	public String list(Model model) {
		List<PackingList> dataList = packingListDao.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/packinglist/jPackingListList.jsp";
	}
	

}
