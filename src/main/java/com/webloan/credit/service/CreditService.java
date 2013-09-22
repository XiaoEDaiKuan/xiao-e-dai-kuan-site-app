package com.webloan.credit.service;

import java.util.List;

import com.webloan.model.Credit;

public interface CreditService {
	List<Credit> creditListByUser(String strCustId);

	void deleteCredit(String strCreditId);

	void saveCredit(String strCustId, String strCreditType, String strCustName,
			String strCustTelephone, String strCreditMin, String strCreditMax);
}
