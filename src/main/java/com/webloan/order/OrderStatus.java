package com.webloan.order;

public enum OrderStatus {

	waitingPreApprove("等待预审", 0),
	waitingApprove("等待审批",1),
	waitingSigning("等待签约",2),
	waitingLoans("等待放款",3),
	success("申贷成功",4),
	complete("完结",5),
	approveFail("审核未通过",6),
	orderInvalid("订单失效",7),
	orderCancel("已取消",8);
	
	private String name;
	private int index;

	OrderStatus(String name, int index) {
		this.name = name;
		this.index = index;

	}

	public String toCode(int index){
		return this.name();
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	
}
