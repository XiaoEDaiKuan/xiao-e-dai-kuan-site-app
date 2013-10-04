package com.webloan.user.dao.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Queriable;
import com.webloan.model.Cust;
import com.webloan.model.IpRec;
import com.webloan.model.Order;
import com.webloan.security.model.User;
import com.webloan.user.dao.UserRepository;

public class UserRepositoryImpl extends BaseJpaRepositoryImpl implements
		UserRepository {

	@Override
	public List<Cust> findCustByEmail(String email) {

		return this.queryList(Cust.class, new String[] { "email" },
				new Object[] { email });
	}

	@Override
	public List<Cust> findCustByMobile(String mobile) {
		return this.queryList(Cust.class, new String[] { "mobileNO" },
				new Object[] { mobile });
	}

	@Override
	public List<Cust> findCustByIdNO(String idNO) {
		return this.queryList(Cust.class, new String[] { "idNO" },
				new Object[] { idNO });
	}

	@Override
	public void createCust(String custName, String logonPasswd,
			String mobileNO, String idType, String idNO, String email,
			String postCode, String address, String custNO, String setupIP,
			Timestamp setupTime) {
		Cust cust = new Cust();
		cust.setAddress(address);
		cust.setCustName(custName);
		cust.setCustNO(custNO);
		cust.setEmail(email);
		cust.setIdNO(idNO);
		cust.setIdType(idType);
		cust.setLogonPasswd(logonPasswd);
		cust.setMobileNO(mobileNO);
		cust.setPostCode(postCode);
		cust.setSetupIP(setupIP);
		cust.setSetupTime(setupTime);
		this.save(cust);

	}

	@Override
	public boolean duplicatedIdNoCheck(String idNO) {
		boolean flag = false;
		List<Cust> custs = this.queryList(Cust.class, new String[] { "idNO" },
				new Object[] { idNO });
		if (custs.size() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean duplicatedEmailCheck(String email) {
		boolean flag = false;
		List<Cust> custs = this.queryList(Cust.class, new String[] { "email" },
				new Object[] { email });
		if (custs.size() > 0) {
			flag = true;
		}

		return flag;
	}

	@Override
	public boolean duplicatedMyEmailCheck(Long custId,String email) {
		boolean flag = false;
		List<Cust> custs = this.queryList(Cust.class, new String[] { "email" },
				new Object[] { email });
		if (null == custs) {
			return flag;
		}
		if (custs.size()==1 && custs.get(0).getId()==custId) {
			return flag;
		}
		if (custs.size()==1 && custs.get(0).getId()!=custId) {
			 flag=true;
			 return flag;
		}
		
		if (custs.size()>1 ) {
			 flag=true;
			 return flag;
		}
		 return flag;
	}

	@Override
	public boolean duplicatedMobileCheck(String mobileNO) {
		boolean flag = false;
		List<Cust> custs = this.queryList(Cust.class,
				new String[] { "mobileNO" }, new Object[] { mobileNO });
		if (custs.size() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean duplicatedMyMobileCheck(Long custId, String mobileNO) {
		boolean flag = false;
		List<Cust> custs = this.queryList(Cust.class,
				new String[] { "mobileNO" }, new Object[] { mobileNO });
		if (null == custs) {
			return flag;
		}
		if (custs.size()==1 && custs.get(0).getId()==custId) {
			return flag;
		}
		if (custs.size()==1 && custs.get(0).getId()!=custId) {
			 flag=true;
			 return flag;
		}
		
		if (custs.size()>1 ) {
			 flag=true;
			 return flag;
		}
		 return flag;
		
	}

	@Override
	public boolean corpIpCheck(String ip) {

		String countJpql = "select count(*) from CorpIP c where inet_aton(c.startIP)<=inet_aton(:ip) and inet_aton(c.endIP)>=inet_aton(:ip)";
		Query countQuery = entityManager.createQuery(countJpql);
		countQuery.setParameter("ip", ip);
		Object count = countQuery.getSingleResult();
		int c = ((Number) count).intValue();
		if (c > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean setupIpOverRun(String ip, int max) {
		Date td = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String setupDate = df.format(td);

		List<IpRec> ipRecs = this.queryList(IpRec.class, new String[] {
				"setupDate", "setupIP" }, new Object[] { setupDate, ip },
				new String[] { Queriable.EQ, Queriable.EQ });

		if (ipRecs.size() == 0)
			return false;

		if (ipRecs.get(0).getSetupIPCnt().intValue() >= max)
			return true;
		else
			return false;

	}

	@Override
	public void createIpRec(String setupDate, String setupIP) {

		List<IpRec> ipRecs = this.queryList(IpRec.class, new String[] {
				"setupDate", "setupIP" }, new Object[] { setupDate, setupIP },
				new String[] { Queriable.EQ, Queriable.EQ });
		if (ipRecs.size() > 0) {
			int c = ipRecs.get(0).getSetupIPCnt().intValue();
			ipRecs.get(0).setSetupIPCnt(c + 1);
			this.update(ipRecs.get(0));
		} else {
			IpRec ic = new IpRec();
			ic.setSetupDate(setupDate);
			ic.setSetupIP(setupIP);
			ic.setSetupIPCnt(1);
			this.save(ic);
		}
	}

	@Override
	public void modifyUser(Long id, String mobileNO, String email,
			String postCode, String address) {

		Cust cust = this.load(Cust.class, id);
		cust.setAddress(address);
		cust.setEmail(email);
		cust.setMobileNO(mobileNO);
		cust.setPostCode(postCode);
		this.update(cust);
	}

	@Override
	public List<Cust> findCustByCustNO(String custNO) {
		return this.queryList(Cust.class, new String[] { "custNO" },
				new Object[] { custNO });
	}

	@Override
	public List<Cust> findCustByCusID(Long custId) {
		return this.queryList(Cust.class, new String[] { "id" },
				new Object[] { custId });
	}

	@Override
	public void modifyPasswd(Long id, String newPasswd) {
		Cust cust = this.load(Cust.class, id);
		cust.setLogonPasswd(newPasswd);
		this.update(cust);
	}

}
