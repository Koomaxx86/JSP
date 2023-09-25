package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.dto.Coupon;

public class CouponRepository extends JDBConnection{
	
	/**
	 * 쿠폰 목록
	 * @return
	 */
	public List<Coupon> couponlist() {
		
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
		
		String sql = " SELECT * FROM coupon ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	/**
	 * 쿠폰 번호 조회
	 * @param couponNo
	 * @return
	 */
	public Coupon couponSelect(String userNo) {
		Coupon coupon = new Coupon();
		
		String sql = " SELECT * FROM coupon WHERE coupon_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));

			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회시, 에러 발생");
			e.printStackTrace();
		}
		
		return coupon;
	}
	
	/**
	 * 쿠폰 발행(등록)
	 * @param coupon
	 * @return
	 */
	public int couponGenerate(Coupon coupon) {
		int result = 0;
		
		String sql = " INSERT INTO coupon (coupon_no, user_no, coupon_name, coupon_date, coupon_img, coupon_check) "
				   + " VALUES (?, ?, ?, ?, ?, ? ) " ;	
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, coupon.getCouponNo());
			psmt.setInt(no++, coupon.getUserNo());
			psmt.setString(no++, coupon.getCouponName());
			psmt.setString(no++, coupon.getCouponDate());	
			psmt.setString(no++, coupon.getCouponImg());	
			psmt.setInt(no++, coupon.getCouponCheck());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 발행 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰 " + result + "개가 발행되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 정보 수정
	 * @param coupon
	 * @return
	 */
	public int couponUpdate(Coupon coupon) {
		
		System.out.println(coupon);
		
		int result = 0;

		String sql = " UPDATE coupon "
				   + " SET coupon_no = ? "
				   + " , user_no = ? "
				   + " , coupon_name = ? "
				   + " , coupon_date = ? "
				   + " , coupon_img = ? "
				   + " , coupon_check = ? "
				   + " WHERE coupon_no = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, coupon.getCouponNo());
			psmt.setInt(no++, coupon.getUserNo());
			psmt.setString(no++,coupon.getCouponName());
			psmt.setString(no++, coupon.getCouponDate());
			psmt.setString(no++, coupon.getCouponImg());
			psmt.setInt(no++, coupon.getCouponCheck());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰" + result + "개가 수정되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 삭제
	 * @param coupon
	 * @return
	 */
	public int couponDelete(String couponNo) {
		int result = 0;
		
		String sql = "DELETE FROM coupon "
				   + "WHERE coupon_no = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, couponNo);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰" + result + "개가 삭제되었습니다.");
		
		return result;
	}
	
	/**
	 * 
	 * @param
	 * @return
	 */
	public int cartAdd(String productNo, String userNo) {
		int result = 0;
		
		String sql = " INSERT INTO cart(user_no, product_no, cart_cnt) "
				   + " VALUES ( ?, ?, ? ) ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userNo);
			psmt.setString(no++, productNo);
			psmt.setInt(no++, 1);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("장바구니 등록 중, 에러 발생");
			e.printStackTrace();
		}
		
		System.out.println("장바구니에" + result + "개가 등록되었습니다.");
		
		return result;
	}
	
}