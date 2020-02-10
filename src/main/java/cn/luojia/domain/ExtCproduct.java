package cn.luojia.domain;

import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月10日
 * @Description 货物附件
 */
@Data
public class ExtCproduct {

	private String id;
	
	private String contractProductId;			//关联关系的表（外键），都成为普通字段
	private String factoryId;
	
	private String factoryName;					//厂家名称  冗余
	private String ctype;						//类型
	
	private String productNo;					//货号
	private String productImage;				//货物照片
	private String productDesc;					//货物描述
	private Integer cnumber;					//数量
	private String packingUnit;					//包装单位
	private Double price;						//价格
	private Double amount;						//总金额
	private String productRequest;				//要求
	private Integer orderNo;					//排序号
}
