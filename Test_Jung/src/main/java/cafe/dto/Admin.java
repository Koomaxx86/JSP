package cafe.dto;

import java.io.Serializable;

public class Admin implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	// 관리자
	private int managerNo;
	private String managerId;
	private String managerPW;
		
	// 주문
	private int orderNo;
	private String userTel;
	private String orderName;
	private int orderCnt;
	private int orderPrice;
	private String orderDate;
	
	public Admin() {

	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPW() {
		return managerPW;
	}

	public void setManagerPW(String managerPW) {
		this.managerPW = managerPW;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
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

	public int getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Admin [managerNo=" + managerNo + ", managerId=" + managerId + ", managerPW=" + managerPW + ", orderNo="
				+ orderNo + ", userTel=" + userTel + ", orderName=" + orderName + ", orderCnt=" + orderCnt
				+ ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + "]";
	}

}