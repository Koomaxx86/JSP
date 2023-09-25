package cafe.dto;

import java.io.Serializable;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;
	private String userTel;
	private String orderName;
	private String orderCnt;
	private String orderPrice;
	private String orderDate;
	
	public Order() {
		
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(String orderCnt) {
		this.orderCnt = orderCnt;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userTel=" + userTel + ", orderName=" + orderName + ", orderCnt="
				+ orderCnt + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + "]";
	}
}