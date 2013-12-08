package com.webloan.agent.service.impl;

import com.webloan.agent.service.AgentService;
import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Agent;
import com.webloan.model.Region;

public class AgentServiceImpl implements AgentService {
	
	private BaseJpaRepository baseRepository;
	
	public BaseJpaRepository getBaseRepository() {
		return baseRepository;
	}
	public void setBaseRepository(BaseJpaRepository baseRepository) {
		this.baseRepository = baseRepository;
	}
	
	public void saveAgent(String name, String gender, String telephone,
			String regionId) {
		Agent agent = new Agent();
		agent.setName(name);
		agent.setGender(gender);
		agent.setTelephone(telephone);
		if (regionId != null && !"".equals(regionId)) {
			agent.setRegion(baseRepository.load(Region.class, Long.valueOf(regionId)));
		}
		baseRepository.save(agent);
	}

}
