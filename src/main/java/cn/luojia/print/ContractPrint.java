package cn.luojia.print;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;

import cn.luojia.util.DownloadUtil;
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

	public void print(ContractVO contract, String path, HttpServletResponse response) throws Exception {
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
			pageMap.put("ContractDesc", stars + " 货物描述"); // 重要程度 + 货物描述
			pageList.add(pageMap);
		}

		// 定义货物图片的高度
		int cellHeight = 96;
		// 如果想区别对待货物为一款或者两款时的样式，我们可以再次下功夫
		// if (contract.getPrintStyle().equals("2")) {
		// cellHeight = 96; // 值可以自己另行设置
		// }

		PoiUtil poiUtil = new PoiUtil();

		// 获取模板
		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(tempXlsFile));
		HSSFFont defaultFont10 = poiUtil.defaultFont10(wb); // 设置字体
		HSSFFont defaultFont12 = poiUtil.defaultFont12(wb); // 设置字体
		HSSFFont blackFont = poiUtil.blackFont12(wb); // 设置字体
		Short rmb2Format = poiUtil.rmb2Format(wb); // 设置格式
		Short rmb4Format = poiUtil.rmb4Format(wb); // 设置格式

		HSSFSheet sheet = wb.getSheetAt(0); // 选择第一个工作簿
		wb.setSheetName(0, "购销合同"); // 设置工作簿的名称

		CellRangeAddress region = null;
		HSSFPatriarch patriarch = sheet.createDrawingPatriarch(); // add picture

		HSSFRow nRow = null;
		HSSFCell nCell = null;
		int curRow = 0;

		
}

	private HSSFCellStyle leftStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		curStyle.setWrapText(true); // 换行
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置
		// fTitle.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); //加粗
		curFont.setFontHeightInPoints((short) 10);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		curStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 实线右边框
		curStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 实线右边框

		return curStyle;
	}

	private HSSFCellStyle headStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("楷体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setItalic(true);
		curFont.setFontHeightInPoints((short) 16);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle tipStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("Georgia");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 28);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle addressStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("宋体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		// fTitle.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); //加粗
		curFont.setFontHeightInPoints((short) 10);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle ltdStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("Times New Roman");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setItalic(true);
		curFont.setFontHeightInPoints((short) 16);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle telStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("宋体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		// fTitle.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); //加粗
		curFont.setFontHeightInPoints((short) 9);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle titleStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("黑体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 18);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle requestStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		curStyle.setWrapText(true); // 换行
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("宋体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setFontHeightInPoints((short) 10);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle dutyStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("黑体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 16);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	private HSSFCellStyle noteStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("宋体");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 12);
		curStyle.setFont(curFont);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	public HSSFCellStyle thStyle(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("宋体");
		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 12);
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); // 实线右边框
		curStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); // 实线右边框
		curStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 实线右边框
		curStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 实线右边框

		curStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

	public HSSFCellStyle bcv12(HSSFWorkbook wb) {
		HSSFCellStyle curStyle = wb.createCellStyle();
		HSSFFont curFont = wb.createFont(); // 设置字体
		curFont.setFontName("Times New Roman");
		curFont.setCharSet(HSSFFont.DEFAULT_CHARSET); // 设置中文字体，那必须还要再对单元格进行编码设置

		curFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 加粗
		curFont.setFontHeightInPoints((short) 12);
		curStyle.setFont(curFont);

		curStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); // 实线
		curStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); // 粗实线
		curStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 实线
		curStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 实线

		curStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		curStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 单元格垂直居中

		return curStyle;
	}

}
