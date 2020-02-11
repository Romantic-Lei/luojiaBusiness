package cn.luojia.vo;

import java.util.List;

import cn.luojia.domain.Contract;
import cn.luojia.domain.ExtCproduct;
import cn.luojia.domain.Factory;
import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月11日
 * @Description 合同下的货物VO对象
 */
@Data
public class ContractProductVO {
	private String id;
	
	private Contract contract;			//将复杂的关联关系变成单表操作
	private List<ExtCproduct> extCproduct;//和附件一对多
	private Factory factory;			//和生产厂家是多对一的关系
	
	private String productNo;			//货号
	private String productImage;		//货物图片
	private String productDesc;			//货物描述
	private Integer cnumber;			//货物数量
	private Integer outNumber;			//出货数量
	private String loadingRate;			//装率
	private Integer boxNum;				//箱数
	private String packingUnit;			//包装单位
	private Double price;				//单价
	private Double amount;				//总金额
	private Integer finished;			//是否完成（出货用）
	private String exts;				//附件
	private Integer orderNo;			//排序号(冗余)
}
