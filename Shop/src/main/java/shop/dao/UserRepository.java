package shop.dao;

import java.sql.SQLException;
import java.util.UUID;

import shop.dto.PersistentLogin;
import shop.dto.User;

public class UserRepository extends JDBConnection {

	/**
	 * 회원 등록
	 * 
	 * @param user
	 * @return
	 */
	public int insert(User user) {
		// 등록 성공시 반환값
		int result = 0;

		// SQL문
		String sql = " INSERT INTO user (id, password, name, gender, birth, mail, phone, address) "
				+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ? ) ";

		// values에 적용할 값의 순서 지정을 위한 변수
		int no = 1;

		// DB에 저장할 값 입력
		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(no++, user.getId());
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getGender());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getMail());
			psmt.setString(no++, user.getPhone());
			psmt.setString(no++, user.getAddress());

			// INSERT 문 실행
			result = psmt.executeUpdate();

			// 에러 발생시 출력
		} catch (SQLException e) {
			System.err.println("회원 등록에 실패하였습니다.");
			e.printStackTrace();
		}
		// 등록 성공시 출력
		System.out.println("회원 등록에 성공하였습니다.");
		return result;
	}

	/**
	 * 로그인을 위한 사용자 조회
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public User login(String id, String pw) {

		// SQL 문
		String sql = " SELECT * " + " FROM user " + " WHERE id = ? " + " AND password = ? ";

		User user = null;
		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);

			// SQL문 실행 후 실행 결과를 rs(JDBConnection에 선언))에 저장
			rs = psmt.executeQuery();

			// executeQuery를 통해 반환받은 값에 데이터가 있으면 실행
			if (rs.next()) {
				user = new User(); // rs 내부의 값을 저장할 user 생성
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setBirth(rs.getString("birth"));
				user.setMail(rs.getString("mail"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRegistDay(rs.getString("regist_day"));
			}
		} catch (SQLException e) {
			System.err.println("사용자 조회에 실패했습니다.");
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 로그인을 위한 사용자 조회
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public User getUserById(String id) {
		// SQL 문
		String sql = " SELECT * " + " FROM user " + " WHERE id = ? ";

		User user = null;
		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, id);

			// SQL문 실행 후 실행 결과를 rs(JDBConnection에 선언))에 저장
			rs = psmt.executeQuery();

			// executeQuery를 통해 반환받은 값에 데이터가 있으면 실행
			if (rs.next()) {
				user = new User(); // rs 내부의 값을 저장할 user 생성
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setBirth(rs.getString("birth"));
				user.setMail(rs.getString("mail"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRegistDay(rs.getString("regist_day"));
			}

		} catch (SQLException e) {
			System.err.println("사용자 조회에 실패했습니다.");
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 회원 수정
	 * 
	 * @param user
	 * @return
	 */
	public int update(User user) {

		int result = 0;

		String sql = " UPDATE user SET "
				+ " password = ?, name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ?" + " WHERE id = ? ";

		int no = 1;

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getGender());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getMail());
			psmt.setString(no++, user.getPhone());
			psmt.setString(no++, user.getAddress());
			psmt.setString(no++, user.getId());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("회원정보 수정실패");
			e.printStackTrace();
		}
		System.out.println("회원정보가 수정되었습니다.");
		return result;
	}

	/**
	 * 회원 삭제
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id) {

		int result = 0;

		String sql = " DELETE FROM user " + " WHERE id = ? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("삭제실패");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 토큰 리프레쉬
	 * 
	 * @param userId
	 */
	public String refreshToken(String userId) {
		PersistentLogin persistentLogin = selectToken(userId);
		String token = null;
		if (persistentLogin == null) {
			// 토큰이 없는 경우, 삽입
			token = insertToken(userId);
		} else {
			// 토큰이 있는 경우, 갱신
			token = updateToken(userId);
		}
		return token;
	}

	/**
	 * 토큰 정보 조회
	 * 
	 * @param userId
	 * @return
	 */
	public PersistentLogin selectToken(String userId) {
		String sql = "SELECT * FROM persistent_logins WHERE user_id = ?";

		PersistentLogin persistentLogin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("token"));
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 토큰 정보 조회 - 토큰으로
	 * 
	 * @param token
	 * @return
	 */
	public PersistentLogin selectTokenByToken(String token) {
		String sql = "SELECT * FROM persistent_logins WHERE token = ?";

		PersistentLogin persistentLogin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("date")); // date 필드로 변경
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 자동 로그인 토큰 생성
	 * 
	 * @param userId
	 * @return
	 */
	public String insertToken(String userId) {
		int result = 0;
		String sql = "INSERT INTO persistent_logins (user_id, token) VALUES (?, ?)";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, token);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 등록 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개가 등록되었습니다.");
		return token;
	}

	/**
	 * 자동 로그인 토큰 갱신
	 * 
	 * @param userId
	 * @return
	 */
	public String updateToken(String userId) {
		int result = 0;
		String sql = "UPDATE persistent_logins SET token = ?, date = now() WHERE user_id = ?";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, userId);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 수정 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 수정되었습니다.");
		return token;
	}

	/**
	 * 토큰 삭제 - 로그아웃 시, 자동 로그인 풀림
	 * 
	 * @param userId
	 * @return
	 */
	public int deleteToken(String userId) {
		int result = 0;
		String sql = "DELETE FROM persistent_logins WHERE user_id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			result = psmt.executeUpdate(); // 특정 사용자의 자동 로그인 정보 삭제 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 삭제되었습니다.");
		return result;
	}

}
