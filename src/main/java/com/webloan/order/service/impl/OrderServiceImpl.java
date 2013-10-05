package com.webloan.order.service.impl;


import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;

import com.webloan.common.Page;
import com.webloan.model.Order;
import com.webloan.model.Product;
import com.webloan.model.Question;
import com.webloan.model.RequireInfo;
import com.webloan.order.OrderConstant;
import com.webloan.order.dao.OrderRepository;
import com.webloan.order.service.OrderService;
import com.webloan.util.MailEngine;

public class OrderServiceImpl implements OrderService {

	private OrderRepository orderRepository;
	private MailEngine mailEngine;
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	
	public MailEngine getMailEngine() {
		return mailEngine;
	}

	public void setMailEngine(MailEngine mailEngine) {
		this.mailEngine = mailEngine;
	}

	public OrderRepository getOrderRepository() {
		return orderRepository;
	}

	public void setOrderRepository(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	@Override
	public Page orderListByUser(Long custId,int pageIndex,int pageSize) {
		return orderRepository.orderListByUser(custId,pageIndex,pageSize);
	}

	@Override
	public void modifyOrderStatus(String strOrderId) {
		Long orderId = strOrderId == null ? null : Long.valueOf(strOrderId);
	    orderRepository.modifyOrderStatus(orderId);
		
	}

	@Override
	public void deleteOrder(String strOrderId) {
		Long orderId = strOrderId == null ? null : Long.valueOf(strOrderId);
		
		orderRepository.deleteOrder(orderId);
		
	}

	@Override
	public int orderCount() {
		return orderRepository.orderCount();
	}

	@Override
	public void createOrder(String strProductId, String strCustId, String applyName,
			String applyTelephone, String strApplyAmt, String strRegionId) {

		Long productId = strProductId == null ? null : Long.valueOf(strProductId);
		Long custId = strCustId == null ? null : Long.valueOf(strCustId);
		Long regionId=strRegionId==null?null:Long.valueOf(strRegionId);
		BigDecimal applyAmt=strApplyAmt==null?null:new BigDecimal(strApplyAmt);
		orderRepository.createOrder(productId, custId, applyName, applyTelephone, applyAmt, regionId);
		
	}

	@Override
	public void orderEmail(String email, String productId) {
         //获得产品信息 		
         Product prd=orderRepository.getProduct(Long.valueOf(productId));	
         
 		// 套用模板并发送邮件
 		Map<String, Object> mpModel = new HashMap<String, Object>();
 		mpModel.put("prdName",prd.getName() );
 		mpModel.put("intDesc", prd.getIntrDesc());
 		mpModel.put("repayDesc", prd.getRepayDesc());
 		mpModel.put("appReq", prd.getAppReq());
 		mpModel.put("appMaterial", prd.getAppMaterial());
 		String strTplContent = mailEngine.initTemplate(
 				"/beans/biz/product.vm", mpModel);
 		log.trace("template content:\n {}", new Object[] { strTplContent });

 		// 设置邮件发送参数
 		SimpleMailMessage objMsg = new SimpleMailMessage();
 		objMsg.setSubject(OrderConstant.MAIL_SUBJECT_PRODUCT);
 		objMsg.setText(strTplContent);
 		objMsg.setTo(email);

         // 发送邮件
 		boolean bSent;
 		try {
 			bSent = mailEngine.sendHtmlMail(objMsg);
 			log.debug("mail sent: {}", new Object[] { bSent });

 		} catch (UnsupportedEncodingException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		} catch (MessagingException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}

	}

	 //根据产品id查询关联的问答
	@Override
	public List<Question> listQuestionByPrdId(String productId) {
        Long prdid=productId==null?null:Long.valueOf(productId);
		return orderRepository.listQuestionByPrdId(prdid);
	}

	 //根据产品ID查询贷款申请条件
	@Override
	public List<RequireInfo> listRequireInfoByProductID(String productID) {
        Long prdID=productID==null?null:Long.valueOf(productID);
		return orderRepository.listRequireInfoByProductID(prdID);
	}

}
