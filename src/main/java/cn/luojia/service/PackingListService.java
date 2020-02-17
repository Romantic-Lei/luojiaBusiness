package cn.luojia.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.luojia.domain.PackingList;
import cn.luojia.pagination.Page;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月16日
 * @Description
 */
public interface PackingListService {
	public List<PackingList> findPage(Page page);			//分页查询
	public List<PackingList> find(Map paraMap);				//带条件查询，条件可以为null，既没有条件；返回list对象集合
	public PackingList get(Serializable id);				//只查询一个，常用于修改,序列化的好处是不论是自增式的id还是UUID都能用

	public void insert(PackingList packingList);			//插入，用实体作为参数
	public void update(PackingList packingList);			//修改，用实体作为参数
	public void deleteById(Serializable id);				//按id删除，删除一条；支持整数型和字符串类型ID
	public void delete(Serializable[] ids);					//批量删除；支持整数型和字符串类型ID
	
	public void submit(Serializable[] ids);					// 上报
	public void cancel(Serializable[] ids);					// 取消
	
	public String getDivDataCreate(String[] exportIds);								// 获取div 展示数据,在新增页面显示数据
	public String getDivDataUpdate(String[] exportIds, String[] exportNos);			// 获取div 展示数据，在修改页面修改数据
	public String getDivDataView(String[] exportNos);								// 获取div 展示数据，在查看页面展示数据

}
