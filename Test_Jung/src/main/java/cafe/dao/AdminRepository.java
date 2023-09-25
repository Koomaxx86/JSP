package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cafe.dto.Admin;

public class AdminRepository extends JDBConnection {

//	/**
//	 * 관리자 등록
//	 * @param admin
//	 * @return
//	 */
//	public int insert(Admin admin) { 
//		int result = 0;
//		String sql = " INSERT INTO manager (manager_no, manager_id, manager_pw) "
//				   + " VALUES ( ?, ?, ?) " ;				
//
//		int no = 1;
//		try {
//			psmt = con.prepareStatement(sql);
//			psmt.setInt(no++, admin.getManagerNo());
//			psmt.setString(no++, admin.getManagerId());
//			psmt.setString(no++, admin.getManagerPW());
//			
//			result = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			System.err.println("관리자 등록 중, 에러 발생!");
//			e.printStackTrace();
//		}
//		System.out.println("관리자 데이터 " + result + "개가 등록되었습니다.");
//		return result;
//	}
	
	/**
	 * 관리자 로그인 조회
	 * @param id
	 * @param PW
	 * @return
	 */
	public Admin login(String id, String pw) {
		
		String sql = " SELECT * "
				   + " FROM manager "
				   + " WHERE manager_id = ? "
				   + "   AND manager_pw = ? ";
		
		Admin admin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) { 
				admin = new Admin();
				admin.setManagerNo(rs.getInt("manager_no"));
				admin.setManagerId(rs.getString("manager_id"));
				admin.setManagerPW(rs.getString("manager_pw"));
			}
			
		} catch (SQLException e) {
			System.err.println("관리자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return admin;
	}
	

//	/**
//	 * 주문 등록
//	 * @param admin
//	 * @return
//	 */
//	public int orderInsert(Admin admin) { 
//		int result = 0;
//		String sql = " INSERT INTO order (order_no, user_tel, order_name, order_cnt, order_price, order_date ) "
//				   + " VALUES ( ?, ?, ?, ?, ?, ? ) " ;				
//
//		int no = 1;
//		try {
//			psmt = con.prepareStatement(sql);
//			psmt.setInt(no++, admin.getOrderNo());
//			psmt.setString(no++, admin.getUserTel());
//			psmt.setString(no++, admin.getOrderName());
//			psmt.setInt(no++, admin.getOrderCnt());
//			psmt.setInt(no++, admin.getOrderPrice());
//			psmt.setString(no++, admin.getOrderDate());
//			
//			result = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			System.err.println("주문 등록 중, 에러 발생!");
//			e.printStackTrace();
//		}
//		System.out.println("주문 데이터 " + result + "개가 등록되었습니다.");
//		return result;
//	}
	
	/**
	 * 주문목록 조회
	 * @param Order
	 * @return
	 */
	public Admin orderSelect(String orderNo) {
		Admin order = new Admin();
		
		String sql = " SELECT * FROM order WHERE order_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, orderNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				order.setOrderNo(rs.getInt("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getInt("order_cnt"));
				order.setOrderPrice(rs.getInt("order_price"));
				order.setOrderDate(rs.getString("order_date"));
			}
		} catch (SQLException e) {
			System.err.println("상품 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
	///////////////////////////////////////////////////
	/*
	public Admin getByID(String ID) {
		Admin order = new Admin();

		
		String sql = " SELECT user_tel "
					+ "	FROM user "
					+ "	WHERE user_id = ?" ;
		
		String sql = " SELECT * "
				+ "	FROM `order`, user "
				+ "	WHERE `order`.user_tel=user.user_tel " ;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ID);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				order.setOrderNo(rs.getInt("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getInt("order_cnt"));
				order.setOrderPrice(rs.getInt("order_price"));
				order.setOrderDate(rs.getString("order_date"));
			}
		} catch (SQLException e) {
			System.err.println("사용자 아이디 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
*/
	
	/**
	 * 세션 ID를 통해 user 테이블의 user_tel 조회
	 */
	public Admin getUserByTel(String ID) {
		Admin order = new Admin();
		
		String sql = " SELECT * "
					+ "	FROM user "
					+ "	WHERE user_id = ? " ;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ID);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				order.setUserTel(rs.getString("user_tel"));
			}
		} catch (SQLException e) {
			System.err.println("사용자 전화번호 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
	
	/**
	 * user 테이블의 userTel을 통해 order 테이블의 orderno, order cnt 조회
	 */
	public Admin OrderInfo(String userTel) {
		Admin order = new Admin();
		
		String sql = " SELECT * "
				+ "	FROM `order`, user "
				+ "	WHERE `order`.user_tel = ? " ;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userTel);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				order.setOrderNo(rs.getInt("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getInt("order_cnt"));
				order.setOrderPrice(rs.getInt("order_price"));
				order.setOrderDate(rs.getString("order_date"));
			}
		} catch (SQLException e) {
			System.err.println("사용자 핸드폰번호 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
	
	/**
	 * 
	 * @param
	 * @return
	 */
	public int productOrder(String userTel, String orderName, String orderCnt, String order_price) {
		int result = 0;
		
		String sql = " INSERT INTO "
				   + " `order`( user_tel, order_name, order_cnt, order_price ) "
				   + " VALUES ( ?, ?, ?, ? ) ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userTel);
			psmt.setString(no++, orderName);
			psmt.setString(no++, orderCnt);
			psmt.setString(no++, order_price);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상품 주문 중, 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}


}
	
	