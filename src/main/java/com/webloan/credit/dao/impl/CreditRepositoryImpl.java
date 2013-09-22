package com.webloan.credit.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.credit.dao.CreditRepository;
import com.webloan.model.Credit;
import com.webloan.model.Cust;

public class CreditRepositoryImpl extends BaseJpaRepositoryImpl implements CreditRepository {


	@Override
	public List<Credit> creditListByUser(Long custId) {
    return this.queryList(Credit.class, new String[]{"cust.id"}, new Object[]{custId});
    }

	@Override
	public void deleteCredit(Long creditId) {
      Credit credit=this.load(Credit.class, creditId);
      this.delete(credit);
	}


	@Override
	public void saveCredit(Long custId, String creditType,
			String custName, String custTelephone,
			BigDecimal creditMin, BigDecimal creditMax) {
         Credit credit=new Credit();
         Cust cust=this.load(Cust.class, custId);
         credit.setCust(cust);
         credit.setCreditType(creditType);
         credit.setCustName(custName);
         credit.setCustTelephone(custTelephone);
         credit.setCreditMin(creditMin);
         credit.setCreditMax(creditMax);
         this.save(credit);  
	}

}
