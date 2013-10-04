package com.webloan.credit.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;
import com.webloan.model.Credit;

public interface CreditRepository extends BaseJpaRepository {
  Page creditListByUser(Long custId,int pageIndex,int pageSize);
  void deleteCredit(Long creditId);
  void saveCredit(Long strCustId, String strCreditType, String strCustName,
			String strCustTelephone, BigDecimal strCreditMin, BigDecimal strCreditMax);
}
