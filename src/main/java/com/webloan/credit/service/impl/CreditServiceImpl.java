package com.webloan.credit.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.webloan.common.Page;
import com.webloan.credit.dao.CreditRepository;
import com.webloan.credit.service.CreditService;
import com.webloan.model.Credit;

public class CreditServiceImpl implements CreditService {
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());
	private CreditRepository creditRepository; 
	@Override
	public Page creditListByUser(String strCustId,int pageIndex,int pageSize) {
		Long custId=strCustId==null?null:Long.valueOf(strCustId);
		return creditRepository.creditListByUser(custId,pageIndex,pageSize);
	}
	public CreditRepository getCreditRepository() {
		return creditRepository;
	}
	public void setCreditRepository(CreditRepository creditRepository) {
		this.creditRepository = creditRepository;
	}
	@Override
	public void deleteCredit(String strCreditId) {
	Long creditId=strCreditId==null?null:Long.valueOf(strCreditId);
	this.creditRepository.deleteCredit(creditId);
	}
	@Override
	public void saveCredit(String strCustId, String strCreditType,
			String strCustName, String strCustTelephone, String strCreditMin,
			String strCreditMax) {
	    Long custId=strCustId==null?null:Long.valueOf(strCustId);
	    BigDecimal creditMin=strCreditMin==null?null:new BigDecimal(strCreditMin);
	    BigDecimal creditMax=strCreditMin==null?null:new BigDecimal(strCreditMax);
		this.creditRepository.saveCredit(custId, strCreditType, strCustName, strCustTelephone, creditMin, creditMax);
		log.info("=========credit has been save====");
	}
   
}
