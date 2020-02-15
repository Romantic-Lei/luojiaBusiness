package cn.luojia.domain;

import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 报运货物实体
 */
@Data
public class ExportProduct {
	private String id;
	
	private String exportId;
	private String factoryId;
	
	private String factoryName;
	private String productNo;
	private Integer cnumber;				//数量
	private String packingUnit;
	private Double price;
	private Integer boxNum;					//箱数
	
	private Double grossWeight;				//毛重
	private Double netWeight;				//净重
	private Double sizeLength;				//长
	private Double sizeWidth;				//宽
	private Double sizeHeight;				//搞
	private Double exPrice;					//出口单价
	private Double tax;						//税
	
	private Integer orderNo;
}
