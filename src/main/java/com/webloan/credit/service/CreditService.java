package com.webloan.credit.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Credit;

public interface CreditService {
	Page creditListByUser(String strCustId,int pageIndex,int pageSize);

	void deleteCredit(String strCreditId);

	void saveCredit(String strCustId, String strCreditType, String strCustName,
			String strCustTelephone, String strCreditMin, String strCreditMax);
}
