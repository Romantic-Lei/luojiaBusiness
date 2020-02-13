package cn.luojia.print;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.luojia.util.UtilFuns;
import cn.luojia.util.file.PoiUtil;
import cn.luojia.vo.ContractProductVO;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月13日
 * @Description 手工POI写excel文件
 */
public class ContractPrint {

	public void print(ContractVO contract, String path, HttpServletResponse response) throws ParseException {
		System.out.println(contract.getId());

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signingDate = sd.format(contract.getSigningDate());
		String deliveryPeriod = sd.format(contract.getDeliveryPeriod());
		String shipTime = sd.format(contract.getShipTime());

		// 相同厂家的信息一起打印
		List<ContractProductVO> oList = contract.getContractProducts();
		UtilFuns utilFuns = new UtilFuns();
		String tempXlsFile = path + "make/xlsprint/tCONTRACT.xls"; // 获取模板文件

		// 填写每页的内容，之后在循环每页读取打印
		Map<String, String> pageMap = null;
		List<Map> pageList = new ArrayList(); // 打印页

		ContractProductVO oProduct = null;
		String stars = "";
		for (int j = 0; j < contract.getImportNum(); j++) { // 重要程度
			stars += "★";
		}

		String oldFactory = ""; // 生产工厂
		for (int i = 0; i < oList.size(); i++) {
			oProduct = oList.get(i); // 获得货物
			pageMap = new HashMap(); // 每页的内容

			pageMap.put("Offeror", "收 购 方：" + contract.getOfferor());
			pageMap.put("Factory", "生产工厂：" + oProduct.getFactory().getFactoryName());
			pageMap.put("ContractNo", "合 同 号：" + contract.getContractNo());
			pageMap.put("Contractor", "联 系 人：" + oProduct.getFactory().getContacts());
			pageMap.put("SigningDate",
					"签单日期：" + UtilFuns.formatDateTimeCN(UtilFuns.dateTimeFormat(contract.getSigningDate())));
			pageMap.put("Phone", "电    话：" + oProduct.getFactory().getPhone());
			pageMap.put("InputBy", "制单：" + contract.getInputBy());
			pageMap.put("CheckBy", "审单：" + utilFuns.fixSpaceStr(contract.getCheckBy(), 26) + "验货员："
					+ utilFuns.convertNull(contract.getInspector()));
			pageMap.put("Remark", "  " + contract.getRemark());
			pageMap.put("Request", "  " + contract.getCrequest());

			pageMap.put("ProductImage", oProduct.getProductImage());
			pageMap.put("ProductDesc", oProduct.getProductDesc());
			pageMap.put("Cnumber", String.valueOf(oProduct.getCnumber().doubleValue()));
			if (oProduct.getPackingUnit().equals("PCS")) {
				pageMap.put("PackingUnit", "只");
			} else if (oProduct.getPackingUnit().equals("SETS")) {
				pageMap.put("PackingUnit", "套");
			}
			pageMap.put("Price", String.valueOf(oProduct.getPrice().doubleValue()));
			pageMap.put("ProductNo", oProduct.getProductNo());

			oldFactory = oProduct.getFactory().getFactoryName();

			// 打印款式在创建购销合同的时候就选定了
			if ("2".equals(contract.getPrintStyle())) {
				i++; // 读取第二个货物
				if (i < oList.size()) {
					// 厂家不同另起新页打印，除去第一次的比较
					if (oProduct.getFactory().getFactoryName().equals(oldFactory)) {
						pageMap.put("ProductImage2", oProduct.getProductImage());
						pageMap.put("ProductDesc2", oProduct.getProductDesc());
						pageMap.put("Cnumber2", String.valueOf(oProduct.getCnumber().doubleValue()));
						if (oProduct.getPackingUnit().equals("PCS")) {
							pageMap.put("PackingUnit2", "只");
						} else if (oProduct.getPackingUnit().equals("SETS")) {
							pageMap.put("PackingUnit2", "套");
						}
						pageMap.put("Price2", String.valueOf(oProduct.getPrice().doubleValue()));
						// pageMap.put("Amount2", String.valueOf(oProduct.getAmount().doubleValue()));
						// //在excel中金额采用公式，所以无需准备数据
						pageMap.put("ProductNo2", oProduct.getProductNo());
					} else {
						i--; // tip:list退回
					}
				} else {
					pageMap.put("ProductNo2", null); // 后面依据此判断是否有第二个货物
				}
			}
			// 操作完第二款货物
			pageMap.put("ContractDesc", stars+" 货物描述");			//重要程度 + 货物描述
			pageList.add(pageMap);
		}
		
		// 定义货物图片的高度
		int cellHeight = 96;
		// 如果想区别对待货物为一款或者两款时的样式，我们可以再次下功夫
//		if (contract.getPrintStyle().equals("2")) {
//			cellHeight = 96; // 值可以自己另行设置
//		}
		
		PoiUtil 

	}

}
