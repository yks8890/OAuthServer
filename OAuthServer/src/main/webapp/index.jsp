<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h2>
		Spring Security&OAuth2 <small class="badge" title="Version">1.0</small>
	</h2>

	<p>
		<a href="<c:url value='/login.jsp'/>">Login</a> &nbsp;|&nbsp; <a
			href="<c:url value='/logout.do'/>">Logout</a>
	</p>

	<div>
		명령어:
		<ol>
			<li>
				<p>User 메뉴는 OAuth Access 검증을 하지 않아도 접근가능(공개 resource);사용자 정보
					관리(추가, 삭제 등..).</p>
			</li>
			<li>
				<p>
					Unity 메뉴와 Mobile 메뉴는 OAuth 접근 검증이 필요함(보호 resource); <br /> Unity
					메뉴는 [ROLE_UNITY] 역할 필요 (resourceId:
					<mark>unity-resource</mark>
					), Mobile 메뉴는 [ROLE_MOBILE] 역할(resourceId:
					<mark>mobile-resource</mark>
					).
				</p>
			</li>
			<li>
				<p>
					사용하기 전에, OAuth2 카테고리 5를 이해하는것이 좋다
					<code>grant_type</code>
					, 请访问 <a href="https://andaily.com/blog/?p=103" target="_blank">https://andaily.com/blog/?p=103</a>
				</p>
			</li>
			<li>
				<p>
					프로젝트 하위 폴더 others에는 <a
						href="http://git.oschina.net/shengzhao/spring-oauth-server/blob/master/others/oauth_test.txt"
						target="_blank">oauth_test.txt</a>파일, 테스트 URL 주소가 있다.(브라우저와 클라이언트
					포함),<br /> Unity 와 Mobile에 접근하려면, 브라우저 기반의 테스트와 첫 번째URL 액세스 검증을 통해
					액세스 할 수있다( 다른 계정은 해당 권한 참고).
				</p>
			</li>
			<li>
				<p>
					당신은 사용자 정의해야하는 경우
					<code>client_details</code>

					그리고 테스트 데이터를 입력 할 수 있습니다 <a href="client_details">client_details</a>
					매뉴얼에 추가
					<code>client_details</code>
					또는으로 생성 된
					<code>client_details</code>
					.
				</p>
			</li>
		</ol>
	</div>
	<br /> 菜单
	<ul>
		<li>
			<p>
				<a href="resources/api/SOS_API-1.0.html" target="_blank">API</a> <span
					class="text-muted">- API 문서 제공</span>
			</p>
		</li>
		<li>
			<p>
				<a href="client_details">client_details</a> <span class="text-muted">-
					ClientDetails관리</span>
			</p>
		</li>
		<li>
			<p>
				<a href="<c:url value='/user/overview' />">User</a> <span
					class="text-muted">- User관리</span>
			</p>
		</li>
		<li>
			<p>
				<a href="<c:url value='/unity/dashboard' />">Unity</a> <span
					class="text-muted">- Unity 자원(resource)은 [ROLE_UNITY] 역할
					필요(resourceId: <mark>unity-resource</mark>에 접근하려면
				</span>
			</p>
		</li>
		<li>
			<p>
				<a href="<c:url value='/m/dashboard'/>">Mobile</a> <span
					class="text-muted">- Mobile 자원(resource), [ROLE_MOBILE] 역할
					필요(resourceId: <mark>mobile-resource</mark>에 접근하려면
				</span>
			</p>
		</li>
	</ul>
	<br />

	<div class="well well-sm">
		<p>
			<strong>설명</strong>: Unity와 Mobile에 접근하려면
			<code>access_token</code>
			URL 뒤에 access_token 매개변수를 입력하여 접근할 수 있습니다 <br /> 예시 URL : <a
				href="<c:url value='/m/dashboard?access_token=i_am_testing_access_token'/>">${pageContext.request.requestURL}/m/dashboard?access_token=i_am_testing_access_token</a>
		</p>

		<p>
			보호 자원
			<mark>Access Token</mark>
			두 가지 방법으로, URL 매개 변수를 추가하는 방법이 있습니다
			<code>access_token</code>
			, 요청 헤더를 추가하는 두 번째 방법 <em>Authorization</em>, 이 값 <em>bearer
				your_access_token</em>
		</p>
	</div>
</body>
</html>