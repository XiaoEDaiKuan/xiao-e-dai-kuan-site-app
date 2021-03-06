package com.webloan.product.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.common.Asserts;
import com.webloan.common.Page;
import com.webloan.common.dict.RecommendType;
import com.webloan.credit.service.CreditService;
import com.webloan.model.Cust;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.model.Region;
import com.webloan.model.RequireInfo;
import com.webloan.order.ValidatorError;
import com.webloan.order.ValidatorInfo;
import com.webloan.order.ValidatorType;
import com.webloan.order.Validators;
import com.webloan.order.service.OrderService;
import com.webloan.product.service.ProductService;
import com.webloan.product.view.ProductQuery;
import com.webloan.product.view.ProductView;
import com.webloan.product.view.ProductViewHelper;
import com.webloan.question.service.QuestionService;
import com.webloan.region.service.RegionService;
import com.webloan.user.service.UserService;

public class ProductController extends MultiActionController {

	@Resource ProductService productService;
	@Resource OrderService orderService;
	@Resource RegionService regionService;
	@Resource ProductViewHelper productViewHelper;
	@Resource UserService userService;
	@Resource CreditService creditService;
	@Resource QuestionService questionService;
	
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	public ModelAndView queryProduct(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/listproduct");
		
		List<ProductAttach> attaches = productService.queryProductAttaches(pq);
		List<ProductView> prdViews = productViewHelper.transferAttachListToView(
				attaches, pq);

		if ("0".equals(pq.getOrderRate())) {
			Collections.sort(prdViews, new Comparator<ProductView>() {
				public int compare(ProductView o1, ProductView o2) {
					BigDecimal r1 = o1.getInterest();
					BigDecimal r2 = o2.getInterest();
					return compareBigDecimal(r1, r2);
				}
			});
		}
		else if ("0".equals(pq.getOrderMonthly())) {
			Collections.sort(prdViews, new Comparator<ProductView>() {
				public int compare(ProductView o1, ProductView o2) {
					BigDecimal m1 = o1.getMonthlyPay();
					BigDecimal m2 = o2.getMonthlyPay();
					return compareBigDecimal(m1, m2);
				}
			});
		}
//		else {
//			Collections.sort(prdViews, new Comparator<ProductView>() {
//				public int compare(ProductView o1, ProductView o2) {
//					BigDecimal r1 = o1.getInterest();
//					BigDecimal r2 = o2.getInterest();
//					BigDecimal m1 = o1.getMonthlyPay();
//					BigDecimal m2 = o2.getMonthlyPay();
//					int r = compareBigDecimal(r1, r2);
//					int m = compareBigDecimal(m1, m2);
//					return r == 0 ? m : r;
//				}
//			});
//		}
		
		int pageIndex = pq.getPageIndex();
		int pageSize = pq.getPageSize();
		
		Page page = new Page();
		
		page.setPageSize(pageIndex);
		page.setPageSize(pageSize);
		page.setTotalRecords(prdViews == null ? 0 : prdViews.size());
		
		int fromIndex = (pageIndex - 1) * pageSize;
		int toIndex = Math.min(pageIndex * pageSize, page.getTotalRecords());
		
		if (fromIndex < toIndex) {
			page.setItems(prdViews.subList(fromIndex, toIndex));
		}
		
		mav.addObject("pvs", page);

		Page hotRcdProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CREDIT);
		mav.addObject("hotRcdProds", hotRcdProds.getItems());

		return mav;
	}
	
	private int compareBigDecimal(BigDecimal d1, BigDecimal d2) {
		if (d1 == null && d2 == null) {
			return 0;
		}
		if (d1 == null) {
			return -1;
		}
		if (d2 == null) {
			return 1;
		}
		return d1.compareTo(d2);
	}

	public ModelAndView viewProduct(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		Long productId = pq.getProductId();
		Asserts.notNull(productId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/viewProduct");

		ProductAttach prod = productService.getAttachByProductId(productId);
		mav.addObject("prod", prod);

		Page hotRcdProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CREDIT);
		mav.addObject("hotRcdProds", hotRcdProds.getItems());

		Page questions = questionService.pagingQuestionsByProductId(
				pq.getPageIndex(), 5, productId);
		mav.addObject("questions", questions);

		mav.addObject("pq", pq);

		return mav;
	}

	public ModelAndView productView(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		if (pq.getLoanAmt() == null || pq.getLoanIssue() == null) {
			return viewProduct(request, response, pq);
		}
		
		ModelAndView mav = new ModelAndView();

		Long productId = pq.getProductId();
		Asserts.notNull(productId);

		mav.setViewName("order/addToCart");

		ProductAttach pa = productService.getAttachByProductId(productId);
		mav.addObject("pv", productViewHelper.transferAttachToView(pa, pq));

		Page hotRcdProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CREDIT);
		mav.addObject("hotRcdProds", hotRcdProds.getItems());
		
		Page questions = questionService.pagingQuestionsByProductId(
				pq.getPageIndex(), 5, productId);
		mav.addObject("questions", questions);

		mav.addObject("pq", pq);

		return mav;
	}

	public ModelAndView matchProduct(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView("product/matchproduct");

		List<Region> regions = regionService.queryRegionByCityLoan();
		mav.addObject("regions", regions);

		if(null==pq.getRegionId()){
			return mav;	
		}
		
		List<Product> grpBuyProds = productService.queryGroupBuyingProducts(
				pq.getRegionId(), pq.getIdentity());
		mav.addObject("groupProducts", grpBuyProds);

		List<ProductAttach> pchdProds = productService.queryPurchasedProducts(
				pq.getRegionId());
		List<ProductView> prdViews = productViewHelper.transferAttachListToView(
				pchdProds, pq);
		
		Collections.sort(prdViews, new Comparator<ProductView>() {
			public int compare(ProductView o1, ProductView o2) {
				return o2.getNumOrders() - o1.getNumOrders();
			}
		});

		int pageIndex = pq.getPageIndex();
		int pageSize = pq.getPageSize();
		
		Page page = new Page();
		
		page.setPageSize(pageIndex);
		page.setPageSize(pageSize);
		page.setTotalRecords(prdViews == null ? 0 : prdViews.size());
		
		int fromIndex = (pageIndex - 1) * pageSize;
		int toIndex = Math.min(pageIndex * pageSize, page.getTotalRecords());
		
		if (fromIndex < toIndex) {
			page.setItems(prdViews.subList(fromIndex, toIndex));
		}
		
		mav.addObject("pvs", page);

		return mav;
	}

	public ModelAndView requestProductInfo(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/requestProductInfo");

		mav.addObject("productId", pq.getProductId());

		return mav;
	}

	public ModelAndView requestProductCheck(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/rejectOrderRequest");

		//List<ProductAttach> attaches = productService.queryProductAttaches(pq);
		ProductAttach pa = productService.getAttachByProductId(pq.getProductId());

		if (pa == null) {
			return mav;
		}

		//如果最小和最大贷款金额为空，则返回问答页面
		if(null==pa.getMinLoanAmt() || null==pa.getMaxLoanAmt() ){
			mav.setViewName("order/requestOrderQuestion");
			
			mav.addObject("pq", pq);
			mav.addObject("reqInfo", orderService.listRequireInfoByProductId(
					pq.getProductId()));

			return mav;
			
		}
		
		// 低于最小贷款金额或高于最大贷款金额
		if (pq.getLoanAmt().compareTo(
				pa.getMinLoanAmt().divide(BigDecimal.valueOf(10000))) < 0) {
			mav.addObject("prdname", pa.getProduct().getName());
			mav.addObject("response", "该产品最低贷款金额为："
					+ pa.getMinLoanAmt().divide(BigDecimal.valueOf(10000))
					+ "万元");
			return mav;

		} else if (pq.getLoanAmt().compareTo(
				pa.getMaxLoanAmt().divide(BigDecimal.valueOf(10000))) > 0) {
			mav.addObject("prdname", pa.getProduct().getName());
			mav.addObject("response", "该产品最高贷款金额为："
					+ pa.getMaxLoanAmt().divide(BigDecimal.valueOf(10000))
					+ "万元");
			return mav;

		}
		// 低于最短贷款期限或高于最大贷款期限
		if (pq.getLoanIssue().compareTo(pa.getMinLoanIssue()) < 0) {
			mav.addObject("prdname", pa.getProduct().getName());
			mav.addObject("response", "该产品最低贷款期限为：" + pa.getMinLoanIssue()
					+ "个月");
			return mav;

		} else if (pq.getLoanIssue().compareTo(pa.getMaxLoanIssue()) > 0) {
			mav.addObject("prdname", pa.getProduct().getName());
			mav.addObject("response", "该产品最高贷款期限为：" + pa.getMaxLoanIssue()
					+ "个月");
			return mav;

		}
		// 判断贷款用途是否一致
		if (!pq.getLoanUse().equals("0") && !pa.getLoanUse().equals("0")
				&& !pq.getLoanUse().equals(pa.getLoanUse())) {
			String loanUse = "";
			if (pa.getLoanUse().equals("1")) {
				loanUse = "经营贷款";
			} else if (pa.getLoanUse().equals("2")) {
				loanUse = "消费贷款";
			} else if (pa.getLoanUse().equals("3")) {
				loanUse = "购房贷款";
			} else if (pa.getLoanUse().equals("4")) {
				loanUse = "购车贷款";
			}
			mav.addObject("prdname", pa.getProduct().getName());
			mav.addObject("response", "该产品要求贷款用途为：" + loanUse);
			return mav;
		}

		// 符合条件的情况
		mav.setViewName("order/requestOrderQuestion");
		
		mav.addObject("pq", pq);
		mav.addObject("reqInfo", orderService.listRequireInfoByProductId(
				pq.getProductId()));

		return mav;
	}

	public ModelAndView inputOrderInfoForm(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
//		mav.setViewName("order/rejectOrderRequest2");
//
//		//List<ProductAttach> attaches = productService.queryProductAttaches(pq);
//		ProductAttach pa = productService.getAttachByProductId(pq.getProductId());
//		if(pa == null){
//			return mav;
//		}
//		
//		String identity=pa.getIdentity();
//		String easte=pa.getEstate();
//		String vehicle=pa.getVehicle();
//		String credit=pa.getCredit();
//		
//		if(identity.indexOf("|"+pq.getIdentity()+"|")<0){
//			mav.addObject("response", "贷款人身份不满足要求");
//			return mav;
//		}
//		if(easte.indexOf("|"+pq.getEstate()+"|")<0){
//			mav.addObject("response", "贷款人房产情况不满足要求");
//			return mav;
//		}
//		if(vehicle.indexOf("|"+pq.getVehicle()+"|")<0){
//			mav.addObject("response", "贷款人车辆情况不满足要求");
//			return mav;
//		}
//		
//		if(credit.indexOf("|"+pq.getCredit()+"|")<0){
//			mav.addObject("response", "贷款人信用情况不满足要求");
//			return mav;
//		}
		
		List<RequireInfo> reqInfo = orderService.listRequireInfoByProductId(
				pq.getProductId());
		
		List<ValidatorInfo> vinfo = buildValidatorInfo(reqInfo, request);
		List<ValidatorError> verr = Validators.validateAll(vinfo);
		
		if (verr == null || verr.isEmpty()) {
			mav.setViewName("order/inputOrderInfo");
			mav.addObject("pq", pq);
		} 
		else {
			StringBuilder errorMsg = new StringBuilder();
			for (ValidatorError ve : verr) {
				errorMsg.append(",").append(ve.getMessage());
			}
			mav.setViewName("order/rejectOrderRequest2");
			mav.addObject("errorMsg", errorMsg.substring(1));
		}

		return mav;
	}
	
	private List<ValidatorInfo> buildValidatorInfo(List<RequireInfo> reqInfo, 
			HttpServletRequest request) {
		List<ValidatorInfo> info = new ArrayList<ValidatorInfo>();
		for (RequireInfo rinfo : reqInfo) {
			String vtype = rinfo.getValidateType();
			String value = request.getParameter(rinfo.getFormName());
			
			ValidatorInfo vinfo = new ValidatorInfo();
			
			vinfo.setName(rinfo.getQuestion());
			vinfo.setType(vtype);
			vinfo.setProperty(rinfo.getPropertyName());
			vinfo.setMessageTemplate(rinfo.getQuestion() + "不满足要求");
			
			vinfo.setSource(productService.getAttachByProductId(
					rinfo.getProduct().getId()));
			
			if (value != null) {
				vinfo.setValue(ValidatorType.IN.equals(vtype) 
						? "|" + value + "|" : value);
			}
			
			info.add(vinfo);
		}
		return info;
	}
	
	/**
	 * 接收贷款申请人的姓名和手机
	 * @param request
	 * @param response
	 * @param pq
	 * @return
	 */
	public ModelAndView inputNameTel(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("order/inputNameTel");
            mav.addObject("pq", pq);
			return mav;
	}
	
	
	public ModelAndView quickloan(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/KS");
		
//		String rcmdType = pq.getRcmdType();
//		if (rcmdType == null) {
//			rcmdType = RecommendType.QUICK_L1;
//		}
//		Page quickProds = productService.pagingAttachByRecType(
//				pq.getPageIndex(), pq.getPageSize(), rcmdType);
//		mav.addObject("quickProds", quickProds);
		
		Page quickL1Prods = productService.pagingAttachByRecType(
				pq.getPageIndex(), pq.getPageSize(), RecommendType.QUICK_L1);
		mav.addObject("quickL1Prods", quickL1Prods);

		Page quickL3Prods = productService.pagingAttachByRecType(
				pq.getPageIndex(), pq.getPageSize(), RecommendType.QUICK_L3);
		mav.addObject("quickL3Prods", quickL3Prods);

		Page quickL5Prods = productService.pagingAttachByRecType(
				pq.getPageIndex(), pq.getPageSize(), RecommendType.QUICK_L5);
		mav.addObject("quickL5Prods", quickL5Prods);
		
		return mav;
	}

	public ModelAndView posloan(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/POS");

		Page posProds = productService.pagingAttachByRecType(pq.getPageIndex(),
				pq.getPageSize(), RecommendType.POS);
		mav.addObject("posProds", posProds);

		return mav;
	}

	public ModelAndView incramt(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/TG");

		Page incrProds = productService.pagingAttachByRecType(
				pq.getPageIndex(), pq.getPageSize(), RecommendType.ADTL_CREDIT);
		mav.addObject("incrProds", incrProds);

		Page secMortProds = productService.pagingAttachByRecType(
				pq.getPageIndex(), pq.getPageSize(), RecommendType.SEC_MORT);
		mav.addObject("secMortProds", secMortProds);

		return mav;
	}

	public ModelAndView xxloan(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/XX");

		return mav;
	}
	
	//信用评分之后的查询
	public ModelAndView queryForScore(HttpServletRequest request,
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/queryForScore");

		Page page = productService.pagingProductBtwnAmount(1, 5, 
				pq.getMinLoanAmt(), pq.getMaxLoanAmt());
		mav.addObject("pvs", productViewHelper.transferPageToView(page, pq));

		Page hotRcdProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CREDIT);
		mav.addObject("hotRcdProds", hotRcdProds.getItems());

		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null != custId) {
			Cust user = userService.findCustById(custId);
			creditService.saveCredit(custId.toString(),
					request.getParameter("creditType"), user.getCustName(),
					user.getMobileNO(), request.getParameter("minLoanAmt"),
					request.getParameter("maxLoanAmt"));
			
			log.info("===========save credit =========");
		}
		
		
		return mav;
	}
	
	public void updateNumOfOrders(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		String strData = request.getParameter("data");
		String retStr = "fail";
		
		try {
			ObjectMapper mapper = new ObjectMapper();  
			Object params = mapper.readValue(strData, Object.class);
			
			if (params instanceof List<?>) {
				List<?> listParams = (List<?>) params;
				for (Object item : listParams) {
					updateNumOfOrder(item);
				}
			}
			else if (params instanceof Map<?, ?>) {
				updateNumOfOrder(params);
			}
			
			retStr= "success";
		}
		catch (Exception e) {}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(retStr);
		out.flush();
		out.close();
	}
	
	private void updateNumOfOrder(Object params) {
		Map<?, ?> param = (Map<?, ?>) params;
		productService.updateProductStats((String) param.get("productCode"), 
				param.get("numOrders"), param.get("sucOrders"));
	}
}
