package com.webloan.region.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.model.Region;
import com.webloan.region.dao.RegionRepository;

public class RegionRepositoryImpl extends BaseJpaRepositoryImpl implements RegionRepository {

	public List<Region> queryRegionByCityLoan(String areaCode, String status) {
		StringBuilder jpql = new StringBuilder("select distinct c.region from ")
				.append(" CityLoan c where 1=1 ");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (areaCode != null && !"".equals(areaCode)) {
			jpql.append(" and c.arreaCode=:areaCode ");
			params.put("areaCode", areaCode);
		}
		if (status != null && !"".equals(status)) {
			jpql.append(" and c.status=:status ");
			params.put("status", status);
		}
		
		return queryListResult(Region.class, jpql.toString(), params);
	}

}
