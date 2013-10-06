package com.webloan.credit.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
import com.webloan.credit.dao.CreditRepository;
import com.webloan.model.Credit;
import com.webloan.model.Cust;
import com.webloan.util.DateUtils;

public class CreditRepositoryImpl extends BaseJpaRepositoryImpl implements CreditRepository {


	@Override
	public Page creditListByUser(Long custId,int pageIndex,int pageSize) {
    return this.queryPage(pageIndex, pageSize, Credit.class, new String[]{"cust.id"}, new Object[]{custId});
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
         credit.setStatus("0");
         credit.setCalTime(DateUtils.getTimeStamp());
         this.save(credit);  
	}

}
