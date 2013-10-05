package com.webloan.region.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.model.Region;
import com.webloan.region.dao.RegionRepository;

public class RegionRepositoryImpl extends BaseJpaRepositoryImpl implements RegionRepository {

	public List<Region> queryRegionByCityLoan(String areaCode, String status) {
		StringBuilder jpql = new StringBuilder("select distinct c.region from CityLoan c ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (areaCode != null && !"".equals(areaCode)) {
			jpql.append(" and c.arreaCode=:areaCode ");
			params.put("areaCode", areaCode);
		}
		if (status != null && !"".equals(status)) {
			jpql.append(" and c.status=:status ");
			params.put("status", status);
		}
		
		TypedQuery<Region> query = entityManager.createQuery(jpql.toString(), Region.class);
		for (Map.Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		
		return query.getResultList();
	}

}