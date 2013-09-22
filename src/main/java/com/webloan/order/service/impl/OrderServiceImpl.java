package com.webloan.order.service.impl;


import java.math.BigDecimal;
import java.util.List;

import com.webloan.model.Order;
import com.webloan.order.dao.OrderRepository;
import com.webloan.order.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderRepository orderRepository;
	
	public OrderRepository getOrderRepository() {
		return orderRepository;
	}

	public void setOrderRepository(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	@Override
	public List<Order> orderListByUser(String strCustId) {
		Long custId = strCustId == null ? null : Long.valueOf(strCustId);
		return orderRepository.orderListByUser(custId);
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
			String applyTelephone, String strApplyAmt, String custRegion) {

		Long productId = strProductId == null ? null : Long.valueOf(strProductId);
		Long custId = strCustId == null ? null : Long.valueOf(strCustId);
		BigDecimal applyAmt=strApplyAmt==null?null:new BigDecimal(strApplyAmt);
		orderRepository.createOrder(productId, custId, applyName, applyTelephone, applyAmt, custRegion);
		
	}

}
