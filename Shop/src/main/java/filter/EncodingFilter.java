package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	// 변수 선언
	private String encoding;

	// 초기화 클래스
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 요청, 응답에 대한 인코딩 방식 설정
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		
		// 다음필터로 전달
		// 다음필터가 없으면 자동 종료된다.
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}
}
