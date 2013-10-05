package com.webloan.region.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Region;

public interface RegionRepository extends BaseJpaRepository {
	
	List<Region> queryRegionByCityLoan(String areaCode, String status);

}
