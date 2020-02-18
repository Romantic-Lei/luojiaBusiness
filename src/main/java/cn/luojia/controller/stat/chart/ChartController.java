package cn.luojia.controller.stat.chart;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.common.springdao.SqlDao;
import cn.luojia.util.file.FileUtil;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月18日
 * @Description 统计报表控制层
 */
@Controller
public class ChartController {
	
	@Autowired
	SqlDao sqlDao;
	
	// 生产厂家销售饼形图
	/*
	 * 开发步骤
	 * 1. 组织数据源
	 * 2. 拼接成xml
	 * 3. 创建一个文件 txt格式，xml工具类
	 * 4. 转向对应目录下的 index.html
	 */
	
	@RequestMapping("/stat/chart/factorySale.action")
	public String factorySale(HttpServletRequest request) throws FileNotFoundException {
		
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到厂家名称和厂家对应的销售货物的数量
		String sql = "SELECT f.factory_name,cp.countnum FROM (SELECT factory_id,factory_name FROM factory_c) f RIGHT JOIN (SELECT factory_id,COUNT(*) AS countnum FROM contract_product_c GROUP BY factory_id ) cp ON f.factory_id=cp.factory_id";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		
		// 拼接数据到一个xml 字符串
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<pie>");
		for(int i=0;i<dataList.size();){
			//在for循环内部控制当前记录标识
			sb.append("  <slice title=\"").append(dataList.get(i++)).append("\">").append(dataList.get(i++)).append("</slice>");
		}
		sb.append("</pie>");
		
		// 输出文件,如果目录下没有文件，则直接创建，否则覆盖
		FileUtil fu = new FileUtil();
		fu.createTxt(path + "/stat/chart/factorysale", "data.xml", sb.toString(), "utf-8");
		
		return "/stat/chart/jStat.jsp?forward=factorysale";
	}

}
