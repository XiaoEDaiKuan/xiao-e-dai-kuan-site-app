package com.webloan.region.service.impl;

import java.util.List;

import com.webloan.model.Region;
import com.webloan.region.dao.RegionRepository;
import com.webloan.region.service.RegionService;

public class RegionServiceImpl implements RegionService {

	private RegionRepository regionRepository;
	
	public RegionRepository getRegionRepository() {
		return regionRepository;
	}
	public void setRegionRepository(RegionRepository regionRepository) {
		this.regionRepository = regionRepository;
	}

	public List<Region> queryProvinces() {
		Long chinaId = 1L;
		return regionRepository.queryList(Region.class, 
				new String[]{ "parent.id" }, 
				new Object[]{ chinaId });
	}
	
	public List<Region> queryCities(Long provinceId) {
		return regionRepository.queryList(Region.class, 
				new String[]{ "parent.id" }, 
				new Object[]{ provinceId });
	}

}
