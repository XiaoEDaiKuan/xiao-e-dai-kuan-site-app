package com.webloan.order.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Order;

public interface OrderRepository extends BaseJpaRepository  {

	List<Order> orderListByUser(Long custId);
	void modifyOrderStatus(Long orderId);
	int orderCount();
	void deleteOrder(Long orderId);
	public void createOrder(Long productId, Long custId, String applyName,
			String applyTelephone, BigDecimal applyAmt, String custRegion) ;

}