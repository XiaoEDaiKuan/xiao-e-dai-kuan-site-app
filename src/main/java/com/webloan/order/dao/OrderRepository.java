package com.webloan.order.dao;

import java.math.BigDecimal;
import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;
import com.webloan.model.Order;
import com.webloan.model.Product;
import com.webloan.model.Question;
import com.webloan.model.RequireInfo;

public interface OrderRepository extends BaseJpaRepository  {

	
	Page orderListByUser(Long custId,int pageIndex,int pageSize);
	void modifyOrderStatus(Long orderId);
	
	int getOrderCount(Long productId);
	
	void deleteOrder(Long orderId);
	public void createOrder(Long productId, Long custId, String applyName,
			String applyTelephone, BigDecimal applyAmt, Long regionId) ;
   //获得产品
	public   Product getProduct(Long productId);

	//根据产品id查询关联的问答
   List<Question> listQuestionByPrdId(Long productId);
   //根据产品ID查询贷款申请条件
   List<RequireInfo> listRequireInfoByProductId(Long productId);

}
