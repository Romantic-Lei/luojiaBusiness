package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ContractDao;
import cn.luojia.dao.ExportDao;
import cn.luojia.dao.ExportProductDao;
import cn.luojia.dao.ExtEproductDao;
import cn.luojia.domain.Contract;
import cn.luojia.domain.Export;
import cn.luojia.domain.ExportProduct;
import cn.luojia.domain.ExtEproduct;
import cn.luojia.pagination.Page;
import cn.luojia.service.ExportService;
import cn.luojia.util.UtilFuns;
import cn.luojia.vo.ContractProductVO;
import cn.luojia.vo.ContractVO;
import cn.luojia.vo.ExtCproductVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 出口报运类业务层
 */
@Service
public class ExportServiceImpl implements ExportService {

	@Autowired
	ExportDao exportDao;
	@Autowired
	ExportProductDao exportProductDao;
	@Autowired
	ContractDao contractDao;
	@Autowired
	ExtEproductDao extEproductDao;

	@Override
	public List<Export> findPage(Page page) {
		return exportDao.findPage(page);
	}

	@Override
	public List<Export> find(Map paraMap) {
		return exportDao.find(paraMap);
	}

	@Override
	public Export get(Serializable id) {
		return exportDao.get(id);
	}

	@Override
	public void insert(String[] contractIds) {
		/*
		 * 步骤：
		 * 1. 根据合同 id 获得合同对象，获取合同号
		 * 2. 将合同下的货物信息搬家到报运下货物表中
		 * 3. 将合同下的附件信息搬家到报运下的附件表中
		 */
		// 拼接合同号，形成报运号
		String contractNos = "";
		for (int i = 0; i < contractIds.length; i++) {
			ContractVO contract = contractDao.view(contractIds[i]);
			// 以空格作为分隔符
			contractNos += contract.getContractNo() + " ";
		}
		// 工具类，删除最后一个空格
		contractNos = UtilFuns.delLastChar(contractNos);
		
		Export export = new Export();
		export.setId(UUID.randomUUID().toString());
		
		// x, y
		export.setContractIds(UtilFuns.joinStr(contractIds, ","));		// 工具类，拼串
		export.setCustomerContract(contractNos);
		
		export.setState(0);		// 默认是草稿状态
		exportDao.insert(export);
		
		// 处理货物信息
		for (int i = 0; i < contractIds.length; i++) {
			
			ContractVO contract = contractDao.view(contractIds[i]);
			
			for(ContractProductVO cp : contract.getContractProducts()) {
				
				ExportProduct ep = new ExportProduct();
				ep.setId(UUID.randomUUID().toString());
				ep.setExportId(export.getId());							// 绑定外键
				
				//数据搬家，将合同下的对应的货物信息写入到报运下的货物信息中
				ep.setFactoryId(cp.getFactory().getId());
				ep.setFactoryName(cp.getFactory().getFactoryName());
				ep.setProductNo(cp.getProductNo());
				ep.setPackingUnit(cp.getPackingUnit());
				ep.setCnumber(cp.getCnumber());
				ep.setBoxNum(cp.getBoxNum());
				ep.setPrice(cp.getPrice());
				
				exportProductDao.insert(ep);
				
				// 处理附件信息
				for (ExtCproductVO extcp : cp.getExtCproducts()) {
					ExtEproduct extep = new ExtEproduct();
					
					BeanUtils.copyProperties(extcp, extep);				// 数据的拷贝
					
					extep.setId(UUID.randomUUID().toString());
					extep.setExportProductId(ep.getId()); 				// 绑定外键
					extep.setFactoryId(extcp.getFactory().getId());
					extep.setFactoryName(extcp.getFactory().getFactoryName());
					
					extEproductDao.insert(extep);
					
				}
			}
			
		}
		
		
	}

	@Override
	public void update(Export export,
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
		exportDao.update(export);
		// 批量修改货物信息
		
		for (int i = 0; i < mr_id.length; i++) {
			if (mr_changed[i] != null && mr_changed[i] == 1) {			// 修改标识，只有用户修改的行才进行更新
				ExportProduct ep = exportProductDao.get(mr_id[i]);
				ep.setOrderNo(mr_orderNo[i]);
				ep.setCnumber(mr_cnumber[i]);
				ep.setGrossWeight(mr_grossWeight[i]);
				ep.setNetWeight(mr_netWeight[i]);
				ep.setSizeLength(mr_sizeLength[i]);
				ep.setSizeWidth(mr_sizeWidth[i]);
				ep.setSizeHeight(mr_sizeHeight[i]);
				ep.setExPrice(mr_exPrice[i]);
				ep.setTax(mr_tax[i]);
				exportProductDao.update(ep);
			}
		}
	}

	@Override
	public void deleteById(Serializable id) {
		exportDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		exportDao.delete(ids);
	}

	@Override
	public void submit(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 1); // 1已上报
		map.put("ids", ids);
		exportDao.updateState(map);
	}

	@Override
	public void cancel(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 0); // 0 草稿
		map.put("ids", ids);
		exportDao.updateState(map);
	}

	@Override
	public List<Contract> getContractList() {
		Map paraMap = new HashMap();
		paraMap.put("state", 1); // 1 已上报的合同信息

		return contractDao.find(paraMap);
	}
	
	public String getMrecordDate(String exportId) {
		Map paraMap = new HashMap();
		paraMap.put("exportId", exportId);
		
		List<ExportProduct> oLIst = exportProductDao.find(paraMap);
		StringBuffer sBuf = new StringBuffer();
		for(ExportProduct ep : oLIst) {
			sBuf.append("addTRRecord(\"mRecordTable\", \"").append(ep.getId()).append("\", \"").append(ep.getProductNo()).append("\", \"").append(ep.getCnumber()).append("\", \"").append(UtilFuns.convertNull(ep.getGrossWeight())).append("\", \"").append(UtilFuns.convertNull(ep.getNetWeight())).append("\", \"").append(UtilFuns.convertNull(ep.getSizeLength())).append("\", \"").append(UtilFuns.convertNull(ep.getSizeWidth())).append("\", \"").append(UtilFuns.convertNull(ep.getSizeHeight())).append("\", \"").append(UtilFuns.convertNull(ep.getExPrice())).append("\", \"").append(UtilFuns.convertNull(ep.getTax())).append("\");");
		}
		return sBuf.toString();
	}

}
