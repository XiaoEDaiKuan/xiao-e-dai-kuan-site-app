package com.webloan.user.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Cust;

public interface UserRepository extends BaseJpaRepository {

	List<Cust> findCustByEmail(String email);

	List<Cust> findCustByMobile(String mobile);

	List<Cust> findCustByIdNO(String idNO);

	void createCust(String custName, String logonPasswd, String mobileNO,
			String idType, String idNO, String email, String postCode,
			String address, String custNO, String setupIP, Timestamp setupTime);

	boolean duplicatedIdNoCheck(String idNO);

	boolean duplicatedEmailCheck(String email);

	boolean duplicatedMobileCheck(String mobileNO);

	boolean corpIpCheck(String ip);

	boolean setupIpOverRun(String ip, int max);

	void createIpRec(String setupDate, String setupIP);

	public void modifyUser(Long id, String mobileNO, String email,
			String postCode, String address);

}
