package cn.luojia.vo;

import cn.luojia.domain.ContractProduct;
import cn.luojia.domain.Factory;
import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月11日
 * @Description 货物附件VO
 */
@Data
public class ExtCproductVO {

	private String id;
	
	private ContractProduct contractProduct;
	private Factory factory;
	
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
