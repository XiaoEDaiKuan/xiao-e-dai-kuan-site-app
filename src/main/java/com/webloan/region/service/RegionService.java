package com.webloan.region.service;

import java.util.List;

import com.webloan.model.Region;

public interface RegionService {
	
	Region getRegionById(Long regionId);
	
	List<Region> queryProvinces();
	
	List<Region> queryCities(Long provinceId);
	
	List<Region> queryRegionByCityLoan();
}
