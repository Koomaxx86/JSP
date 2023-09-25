package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.dto.Order;

public class OrderRepository extends JDBConnection{

	/**
	 * 주문 목록
	 * @return
	 */
	public List<Order> list() {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		String sql = " SELECT * FROM order ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Order order = new Order();
				order.setOrderNo(rs.getString("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getString("order_cnt"));
				order.setOrderPrice(rs.getString("order_price"));
				order.setOrderDate(rs.getString("order_date"));
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.err.println("주문 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return orderList;
	}
}