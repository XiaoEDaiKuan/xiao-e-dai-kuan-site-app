package com.webloan.credit.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Credit;

public interface CreditRepository extends BaseJpaRepository {
  List<Credit> creditListByUser(Long custId);
  void deleteCredit(Long creditId);
  void saveCredit(Long strCustId, String strCreditType, String strCustName,
			String strCustTelephone, BigDecimal strCreditMin, BigDecimal strCreditMax);
}
