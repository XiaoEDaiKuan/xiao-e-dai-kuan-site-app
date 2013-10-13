package com.webloan.region.service.impl;

import java.util.List;

import com.webloan.model.CityLoan;
import com.webloan.model.Region;
import com.webloan.region.dao.RegionRepository;
import com.webloan.region.service.RegionService;

public class RegionServiceImpl implements RegionService {
	
	public static final String STATUS_KT = "0";
	public static final String STATUS_WKT = "1";
	
	private RegionRepository regionRepository;
	
	public RegionRepository getRegionRepository() {
		return regionRepository;
	}
	public void setRegionRepository(RegionRepository regionRepository) {
		this.regionRepository = regionRepository;
	}
	
	public Region getRegionById(Long regionId) {
		return regionRepository.load(Region.class, regionId);
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
	
	public List<Region> queryRegionByCityLoan() {
		return regionRepository.queryRegionByCityLoan(null, STATUS_KT);
	}
	
	public CityLoan getCityLoanByRegionId(Long regionId) {
		List<CityLoan> cityLoans = regionRepository.queryList(
				CityLoan.class, 
				new String[]{ "region.id", "status" }, 
				new Object[]{ regionId, STATUS_KT });
		return cityLoans == null || cityLoans.isEmpty() ? null : cityLoans.get(0);
	}
	
}
