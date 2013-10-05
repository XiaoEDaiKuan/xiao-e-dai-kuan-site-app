package com.webloan.common;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.webloan.common.Page;
import com.webloan.common.BaseJpaRepository;

import static com.webloan.common.Queriable.*;

public class BaseJpaRepositoryImpl implements BaseJpaRepository {
	
	protected EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public void save(Object entity) {
		entityManager.persist(entity);
	}
	
	public void update(Object entity) {
		entityManager.merge(entity);
	}
	
	public void delete(Object entity) {
		entityManager.remove(entity);
	}
	
	public <T> void delete(Class<T> clazz, Serializable id) {
		T t = load(clazz, id);
		if (t != null) {
			delete(t);
		}
	}
	
	public <T> boolean exists(Class<T> clazz, Serializable id) {
		return load(clazz, id) != null;
	}
	
	public <T> T load(Class<T> clazz, Serializable id) {
		return entityManager.find(clazz, id);
	}
	
	public <T> List<T> queryList(Class<T> clazz, String[] keys, Object[] values) {
		return queryList(clazz, keys, values, null, null, null);
	}

	public <T> List<T> queryList(Class<T> clazz, String[] keys, Object[] values,
			String[] conds) {
		return queryList(clazz, keys, values, conds, null, null);
	}

	public <T> List<T> queryList(Class<T> clazz, String[] keys, Object[] values,
			String[] conds, String[] orderKeys, String[] orderValues) {
		StringBuilder jpql = new StringBuilder("select o from ")
				.append(clazz.getName())
				.append(" o ");
		
		Map<Integer, Object> params = buildConds(keys, values, conds);
		if (!params.isEmpty()) {
			String condStr = (String) params.remove(Integer.MIN_VALUE);
			if (!"".equals(condStr)) {
				jpql.append(" where ").append(condStr);
			}
		}
		
		String orderStr = buildOrders(orderKeys, orderValues);
		if (orderStr != null && orderStr.length() > 0) {
			jpql.append(" order by ").append(orderStr);
		}
		
		TypedQuery<T> query = entityManager.createQuery(jpql.toString(), clazz);
		for (Map.Entry<Integer, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		
		System.out.println("JPQL: " + jpql);
		System.out.println("PARAMS: " + params);
		
		return query.getResultList();
	}

	public Page queryPage(int pageIndex, int pageSize, Class<?> clazz,
			String[] keys, Object[] values) {
		return queryPage(pageIndex, pageSize, clazz, keys, values, null, null, null);
	}
	
	public Page queryPage(int pageIndex, int pageSize, Class<?> clazz,
			String[] keys, Object[] values, String[] conds) {
		return queryPage(pageIndex, pageSize, clazz, keys, values, conds, null, null);
	}
	
	public Page queryPage(int pageIndex, int pageSize, Class<?> clazz,
			String[] keys, Object[] values, String[] conds,
			String[] orderKeys, String[] orderValues) {
		StringBuilder jpql = new StringBuilder(" from ")
				.append(clazz.getName())
				.append(" o ");
		
		Map<Integer, Object> params = buildConds(keys, values, conds);
		if (!params.isEmpty()) {
			String condStr = (String) params.remove(Integer.MIN_VALUE);
			if (!"".equals(condStr)) {
				jpql.append(" where ").append(condStr);
			}
		}
		
		String orderStr = buildOrders(orderKeys, orderValues);
		if (orderStr != null && orderStr.length() > 0) {
			jpql.append(" order by ").append(orderStr);
		}
		
		String pageJpql = "select o" + jpql;
		String countJpql = "select count(*)" + jpql;
		
		System.out.println("PAGE JPQL: " + pageJpql);
		System.out.println("COUNT JPQL: " + countJpql);
		System.out.println("PARAMS: " + params);
		
		return queryPageResult(pageIndex, pageSize, pageJpql, countJpql, params);
	}
	
	private void fillQueryParams(Query query, Map<?, ?> params) {
		for (Map.Entry<?, ?> param : params.entrySet()) {
			Object key = param.getKey();
			if (key instanceof Number) {
				int indexKey = ((Number) key).intValue();
				query.setParameter(indexKey, param.getValue());
			} 
			else if (key != null) {
				query.setParameter(key.toString(), param.getValue());
			}
		}
	}
	
	protected Object querySingleResult(String jpql, Map<?, ?> params) {
		Query query = entityManager.createQuery(jpql);
		fillQueryParams(query, params);
		return query.getSingleResult();
	}
	
	protected List<?> queryListResult(String jpql, Map<?, ?> params) {
		Query query = entityManager.createQuery(jpql);
		fillQueryParams(query, params);
		return query.getResultList();
	}
	
	protected <T> List<T> queryListResult(Class<T> clazz, String jpql, Map<?, ?> params) {
		TypedQuery<T> query = entityManager.createQuery(jpql, clazz);
		fillQueryParams(query, params);
		return query.getResultList();
	}
	
	protected Page queryPageResult(int pageIndex, int pageSize, 
			String pageJpql, String countJpql, Map<?, ?> params) {
		Query pageQuery = entityManager.createQuery(pageJpql);
		Query countQuery = entityManager.createQuery(countJpql);

		fillQueryParams(pageQuery, params);
		fillQueryParams(countQuery, params);
		
		Object count = countQuery.getSingleResult();
		
		pageQuery.setFirstResult((pageIndex - 1) * pageSize);
		pageQuery.setMaxResults(pageSize);
		
		Page page = new Page();
		page.setPageIndex(pageIndex);
		page.setPageSize(pageSize);
		
		page.setTotalRecords(((Number) count).intValue());
		page.setItems(pageQuery.getResultList());
		
		return page;
	}
	
	private Map<Integer, Object> buildConds(String[] keys, Object[] values, String[] conds) {
		Map<Integer, Object> params = new HashMap<Integer, Object>();
		if (keys == null || values == null) {
			return params;
		}
		
		StringBuilder ret = new StringBuilder();
		int len = Math.min(keys.length, values.length);
		int cnt = 0;
		
		for (int i = 0; i < len; i++) {
			Object value = values[i];
			String cond = EQ;
			
			if (conds != null && i < conds.length) {
				cond = conds[i];
			}

			if (value != null && (LIKE.equals(cond) || NOT_LIKE.equals(cond))) {
				String strVal = value.toString().trim();
				if (!strVal.startsWith("%") && !strVal.endsWith("%")) {
					value = "%" + strVal + "%";
				}
			}

			if (value != null && (IN.equals(cond) || NOT_IN.equals(cond))) {
				if (!(value instanceof List<?>)) {
					value = Arrays.asList(value);
				}
			}
			
			KCV kcv = new KCV();
			kcv.prefix = "o";
			kcv.index = i;
			
			kcv.key = keys[i];
			kcv.value = value;
			kcv.condition = cond;
			
			String tmp = kcv.toString();
			
			if (!"".equals(tmp)) {
				if (cnt++ > 0) {
					ret.append(" and ");
				}
				
				ret.append(tmp);
				if (value != null) {
					params.put(i, value);
				}
			}
		}
		
		params.put(Integer.MIN_VALUE, ret.toString());
		
		return params;
	}
	
	private String buildOrders(String[] keys, String[] values) {
		if (keys == null) {
			return null;
		}
		
		StringBuilder ret = new StringBuilder();
		
		for (int i = 0; i < keys.length; i++) {
			String value = ASC;
			if (values != null && i < values.length) {
				value = values[i];
			}
			
			OV ov = new OV();
			ov.prefix = "o";
			ov.key = keys[i];
			ov.value = value;
			
			String tmp = ov.toString();
			
			if (!"".equals(tmp)) {
				if (ret.length() > 0) {
					ret.append(", ");
				}
				ret.append(tmp);
			}
		}
		
		return ret.toString();
	}
	
	class KCV {
		public String prefix;
		public int index;
		
		public String key;
		public Object value;
		public String condition;
		
		String getPrefix() {
			return prefix == null || "".equals(prefix.trim()) ? "" : prefix + ".";
		}
		
		@Override
		public String toString() {
			if (key == null || "".equals(key) || (value == null && condition == null)) {
				return "";
			}
			
			StringBuilder ret = new StringBuilder();
			ret.append(getPrefix()).append(key);
			
			if (value != null) {
				if (condition == null) {
					ret.append(" = ?").append(index);
				}
				else if (IN.equals(condition) || NOT_IN.equals(condition)) {
					if (value instanceof List<?>) {
						ret.append(" ").append(condition).append(" (?").append(index).append(")");
					} else {
						return "";
					}
				}
				else if (!IS.equals(condition) && !IS_NOT.equals(condition)) {
					ret.append(" ").append(condition).append(" ?").append(index);
				}
				else {
					return "";
				}
			}
			else {
				if (IS.equals(condition) || IS_NOT.equals(condition)) {
					ret.append(" ").append(condition).append(" NULL");;
				} else {
					return "";
				}
			}
			
			return ret.toString();
		}
	}
	
	class OV {
		public String prefix;
		
		public String key;
		public Object value = ASC;
		
		String getPrefix() {
			return prefix == null || "".equals(prefix.trim()) ? "" : prefix + ".";
		}
		
		@Override
		public String toString() {
			if (key == null || "".equals(key)) {
				return "";
			}
			
			StringBuilder ret = new StringBuilder();
			ret.append(getPrefix()).append(key);
			
			if (value == null) {
				ret.append(" asc");
			}
			else {
				ret.append(" ").append(value);
			}
			
			return ret.toString();
		}
	}
	
//	public static void main(String[] args) {
//		BaseJpaRepositoryImpl br = new BaseJpaRepositoryImpl();
//		String[] keys = {"name", "organ.id", "rate.value", "c.d.e", "c.list"};
//		Object[] vals = {"Lonnie", 1, "2.34", null, new Integer[]{1, 2}};
//		String[] cnds = {NE, LT, NOT_LIKE, IS_NOT, NOT_IN};
//		String[] okys = {"name", "id", "c.order"};
//		String[] ovls = {ASC, DESC};
//		br.queryList(String.class, keys, vals);
//		System.out.println("-------------");
//		br.queryList(String.class, keys, vals, cnds);
//		System.out.println("-------------");
//		br.queryList(String.class, keys, vals, cnds, okys, ovls);
//	}
}
