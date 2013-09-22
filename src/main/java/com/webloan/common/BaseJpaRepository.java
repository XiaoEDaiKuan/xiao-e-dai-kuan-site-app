package com.webloan.common;

import java.io.Serializable;
import java.util.List;

import com.webloan.common.Page;

public interface BaseJpaRepository {
	
	/** 保存实体 */
	<T> void save(T entity);
	
	/** 更新实体 */
	<T> void update(T entity);
	
	/** 删除实体 */
	<T> void delete(T entity);
	
	/** 通过 id 删除实体 */
	<T> void delete(Class<T> clazz, Serializable id);
	
	/** 判断实体是否存在 */
	<T> boolean exists(Class<T> clazz, Serializable id);
	
	/** 通过 id 载入实体 */
	<T> T load(Class<T> clazz, Serializable id);

	<T> List<T> queryList(
			Class<T> clazz, 
			String[] keys, 
			Object[] values);
	
	<T> List<T> queryList(
			Class<T> clazz, 
			String[] keys, 
			Object[] values, 
			String[] conditions);
	
	<T> List<T> queryList(
			Class<T> clazz, 
			String[] keys, 
			Object[] values, 
			String[] conditions, 
			String[] orderKeys, 
			String[] orderValues);
	
	Page queryPage(
			int pageIndex,
			int pageSize, 
			Class<?> clazz, 
			String[] keys, 
			Object[] values);
	
	Page queryPage(
			int pageIndex,
			int pageSize, 
			Class<?> clazz, 
			String[] keys, 
			Object[] values, 
			String[] conditions);
	
	Page queryPage(
			int pageIndex,
			int pageSize, 
			Class<?> clazz, 
			String[] keys, 
			Object[] values, 
			String[] conditions, 
			String[] orderKeys, 
			String[] orderValues);
}
