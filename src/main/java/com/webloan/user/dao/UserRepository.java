package com.webloan.user.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Cust;

public interface UserRepository extends BaseJpaRepository {

	//根据邮件查找客户
	List<Cust> findCustByEmail(String email);
	//根据手机号查找客户
	List<Cust> findCustByMobile(String mobile);
	//根据身份证号查找客户
	List<Cust> findCustByIdNO(String idNO);
    //根据客户账号查找客户
	List<Cust> findCustByCustNO(String custNO);

    //根据客户ID主键查找客户
	List<Cust> findCustByCusID(Long custId);

	//保存客户注册信息
	void createCust(String custName, String logonPasswd, String mobileNO,
			String idType, String idNO, String email, String postCode,
			String address, String custNO, String setupIP, Timestamp setupTime);

	//验证身份证号是否重复
	boolean duplicatedIdNoCheck(String idNO);

	//验证邮件是否重复
	boolean duplicatedEmailCheck(String email);

	//验证手机是否重复
	boolean duplicatedMobileCheck(String mobileNO);

	//验证是否是公司的IP
	boolean corpIpCheck(String ip);
    
	//验证同一IP是否多次注册
	boolean setupIpOverRun(String ip, int max);
    
	//保存注册IP信息
	void createIpRec(String setupDate, String setupIP);

	//修改客户信息
	public void modifyUser(Long id, String mobileNO, String email,
			String postCode, String address);
    //修改密码
	public void modifyPasswd(Long id,String newPasswd);
}
