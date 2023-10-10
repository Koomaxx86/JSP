package filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {

	// 초기화 클래스
	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// Cookie를 사용하기 위해 Servlet request를 HttpServletRequest로 형변환
		HttpServletRequest cookieRequest = (HttpServletRequest) request;

		// 형변환된 cookieRequest에서 쿠키 정보를 가져와 배열 arryCookie에 저장
		Cookie[] arryCookie = cookieRequest.getCookies();

		// 로그인 아이디와 token를 저장할 변수 선언
		String rememberMe = null;
		String token = null;

		// getCookies로 가져온 cookie에 값이 들어있을 경우 문장 실행
		if (arryCookie != null) {

			for (int i = 0; i < arryCookie.length; i++) {

				// 불러온 쿠키의 모든 요소에 순차 접근 후 myCookie로 저장
				Cookie myCookie = arryCookie[i];
				// 저장된 쿠키의 Name을 name에 저장
				String name = myCookie.getName();
				// 특수문자를 사용하기위해 url로 인코딩된 쿠키를 다시 정상적인 문자로 디코딩 한다
				String value = URLDecoder.decode(myCookie.getValue(), "UTF-8");

				// switch문을 통해 name의 값을 확인 후 원하는 값이면 변수에 값을 저장
				switch (name) {
				case "rememberMe":
					rememberMe = value;
					break;
				case "token":
					token = value;
					break;
				}
			}
		}
	}

	@Override
	public void destroy() {
	}
}
