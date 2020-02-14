package cn.luojia.print;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;

import cn.luojia.util.DownloadUtil;
import cn.luojia.util.UtilFuns;
import cn.luojia.vo.ContractProductVO;
import cn.luojia.vo.ContractVO;

public class ContractPrintTemplate {
	public void print(ContractVO contract, String path, HttpServletResponse response) throws ParseException, FileNotFoundException, IOException{
		/*
		 * 1.获取数据
		 * 2.封装每页数据
		 * 3.打印
		 */
		
		UtilFuns utilFuns = new UtilFuns();
		List<Map> pageList = new ArrayList<Map>();
		Map<String,String> pageMap = null;
		
		String _stars = "";
		for(int i=0;i<contract.getImportNum();i++){
			_stars += "★";
		}
		
		List<ContractProductVO> cpList = contract.getContractProducts();
		ContractProductVO cp = null;
		for(int i=0;i<cpList.size();i++){
			pageMap = new HashMap<String,String>();
			cp = cpList.get(i);
			
			pageMap.put("Offeror", "收 购 方："+contract.getOfferor());
			pageMap.put("ContractNo", "合 同 号："+contract.getContractNo());
			pageMap.put("SigningDate", "签单日期："+UtilFuns.formatDateTimeCN(UtilFuns.dateTimeFormat(contract.getSigningDate())));
			
			pageMap.put("Factory", "生产工厂："+cp.getFactory().getFullName());
			pageMap.put("Contractor", "联 系 人："+cp.getFactory().getContacts());
			pageMap.put("Phone", "电    话："+cp.getFactory().getPhone());
			
			pageMap.put("InputBy", "制单："+contract.getInputBy());
			pageMap.put("CheckBy", "审单："+utilFuns.fixSpaceStr(contract.getCheckBy(), 26) + "验货员："+contract.getInspector());
			
			pageMap.put("Crequest", contract.getCrequest());
			
			
			
			pageMap.put("ProductDescTitle", _stars + " 货物描述");
			
			pageMap.put("ProductImage", cp.getProductImage());
			pageMap.put("ProductDesc", cp.getProductDesc());
			pageMap.put("Cnumber", cp.getCnumber().toString());
			if(cp.getPackingUnit().equals("PCS")){
				pageMap.put("PackingUnit", "只");
			}else if(cp.getPackingUnit().equals("SETS")){
				pageMap.put("PackingUnit", "套");
			}
			pageMap.put("Price", cp.getPrice().toString());
			pageMap.put("ProductNo", cp.getProductNo());
			
			String fullName = cp.getFactory().getFullName();
			if(contract.getPrintStyle().equals("2")){		//按两款货物打印，才做
				//处理第二款货物
				i++;
				if(i<cpList.size()){			//判断第二款货物是否有
					cp = cpList.get(i);
					if(cp.getFactory().getFullName().equals(fullName)){
						pageMap.put("ProductImage2", cp.getProductImage());
						pageMap.put("ProductDesc2", cp.getProductDesc());
						pageMap.put("Cnumber2", cp.getCnumber().toString());
						if(cp.getPackingUnit().equals("PCS")){
							pageMap.put("PackingUnit2", "只");
						}else if(cp.getPackingUnit().equals("SETS")){
							pageMap.put("PackingUnit2", "套");
						}
						pageMap.put("Price2", cp.getPrice().toString());
						pageMap.put("ProductNo2", cp.getProductNo());
					}
				}else{
					i--;						//如果第二款货物厂家不同，则必须新起一页
				}
			}
			
			pageList.add(pageMap);				//存储一页数据
		}
		
		/*
		 * 打开模板，复制sheet，另存
		 */;
		Workbook wb = new HSSFWorkbook(new FileInputStream(new File(path + "make/xlsprint/tCONTRACTVO1.xls")));
		for(int i=0;i<pageList.size();i++){
			wb.cloneSheet(0);								//复制工作簿
			wb.setSheetName(i+1, "C"+(i+1)+"");		//设置工作簿名称
//			DownloadUtil du = new DownloadUtil();
//			ByteArrayOutputStream bos = new ByteArrayOutputStream();
//			wb.write(bos);
//			bos.close();
//			du.download(bos, response, "购销合同.xls");
		}
		
		//设置相同内容
		for(int i=0;i<pageList.size();i++){
			int rowNo = 7;
			int colNo = 0;
			Row nRow = null;
			Cell nCell = null;
			Map<String,String> printMap = pageList.get(i);
			
			Sheet sheet = wb.getSheetAt(i+1);						//定位到当前工作表
			String sheetName = sheet.getSheetName();
			sheet.setForceFormulaRecalculation(true);				//强制公式自动计算，利用模板时，模板中的公式不会因值发生变化而自动计算。
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("Offeror"));
			nCell = nRow.getCell(5);
			nCell.setCellValue(printMap.get("Factory"));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("ContractNo"));
			nCell = nRow.getCell(5);
			nCell.setCellValue(printMap.get("Contractor"));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("SigningDate"));
			nCell = nRow.getCell(5);
			nCell.setCellValue(printMap.get("Phone"));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(4);
			nCell.setCellValue(printMap.get("ProductDescTitle"));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("ProductImage"));
			if(UtilFuns.isNotEmpty(printMap.get("ProductImage"))){
				this.setPicture(path+"/ufiles/jquery/"+printMap.get("ProductImage"), sheet, rowNo-1, 1, rowNo, 3);		//插入产品图片
			}			
			
			nCell = nRow.getCell(4);
			nCell.setCellValue(printMap.get("ProductDesc"));
			nCell = nRow.getCell(5);
			nCell.setCellValue(Integer.parseInt(printMap.get("Cnumber")));
			nCell = nRow.getCell(6);
			nCell.setCellValue(printMap.get("PackingUnit"));
			nCell = nRow.getCell(7);
			nCell.setCellValue(Double.parseDouble(printMap.get("Price")));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("ProductNo"));
			
			
			if(printMap.get("ProductNo2")!=null){			//第二款货不存在
				nRow = sheet.getRow(rowNo++);
				nCell = nRow.getCell(1);
				nCell.setCellValue(printMap.get("ProductImage2"));
				if(UtilFuns.isNotEmpty(printMap.get("ProductImage2"))){
					this.setPicture(path+"/ufiles/jquery/"+printMap.get("ProductImage2"), sheet, rowNo-1, 1, rowNo, 3);		//插入产品图片
				}
				
				nCell = nRow.getCell(4);
				nCell.setCellValue(printMap.get("ProductDesc2"));
				nCell = nRow.getCell(5);
				nCell.setCellValue(printMap.get("Cnumber2"));
				nCell = nRow.getCell(6);
				nCell.setCellValue(printMap.get("PackingUnit2"));
				nCell = nRow.getCell(7);
				nCell.setCellValue(printMap.get("Price2"));
				
				nRow = sheet.getRow(rowNo++);
				nCell = nRow.getCell(1);
				nCell.setCellValue(printMap.get("ProductNo2"));
			
			}else{				//没有第二款货物时空着
				rowNo++;
				rowNo++;
			}
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue(printMap.get("InputBy"));			
			nCell = nRow.getCell(4);
			nCell.setCellValue(printMap.get("CheckBy"));	
			
			rowNo++;
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(1);
			nCell.setCellValue("  "+printMap.get("Crequest"));
		}
		
		wb.removeSheetAt(0);					//删除模板sheet

		DownloadUtil du = new DownloadUtil();
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		wb.write(bos);
		bos.close();
		du.download(bos, response, "购销合同.xls");
		wb.setFirstVisibleTab(1);
	}
	
	//处理图片，excel中图片是单独对象存放
	public void setPicture(String pic, Sheet sheet, int startRow, int startCol, int stopRow, int stopCol) throws IOException{
		File imageFile = new File(pic);
		if(imageFile.exists()){
			InputStream is = new FileInputStream(new File(pic));
			byte[] bytes = IOUtils.toByteArray(is);
			int pictureIdx = sheet.getWorkbook().addPicture(bytes, Workbook.PICTURE_TYPE_JPEG);		//扩展名可为.jpg/.jpeg/.png
			is.close();
			
			Drawing drawing = sheet.createDrawingPatriarch();	// Create the drawing patriarch.  This is the top level container for all shapes.
			//前面四个参数是图片偏移量
			ClientAnchor anchor = new HSSFClientAnchor(20, 1, 1020, 0, (short)startCol, startRow, (short)stopCol, stopRow);	//add a picture shape
			anchor.setRow1(startRow);							//set position corner of the picture		
			anchor.setCol1(startCol);
			anchor.setRow2(stopRow);
			anchor.setCol2(stopCol);
			
			drawing.createPicture(anchor, pictureIdx);
		}
	}
	
	
	public void print() throws ParseException, FileNotFoundException, IOException{

		/*
		 * 打开模板，复制sheet，另存
		 */
		Workbook wb = new HSSFWorkbook(new FileInputStream(new File("c:\\tCONTRACTVO.xls")));
		for(int i=0;i<2;i++){
			wb.cloneSheet(0);								//复制工作簿
			wb.setSheetName(i+1, "Sheet("+(i+1)+")");		//设置工作簿名称
		}
		
		//设置相同内容
		for(int i=1;i<wb.getNumberOfSheets();i++){
			Row nRow = null;
			Cell nCell = null;
			
			Sheet sheet = wb.getSheetAt(i);						//定位到当前工作表
			System.out.println(sheet.getLastRowNum());
			
			nRow = sheet.getRow(6);
			nCell = nRow.getCell(1);
			nCell.setCellValue("Offeror");
			
			System.out.println("=================================="+i);
		}

		wb.write(new FileOutputStream("c:\\y.xls"));
	}	
}
