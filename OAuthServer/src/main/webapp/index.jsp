<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HOME</title>
</head>
<body>


	<!-- Jumbotron -->
	<div class="jumbotron">
		<h1>
			Spring Security & OAuth2 <small class="badge" title="Version">1.0</small>
		</h1>
		<p class="lead">
			OAuth2 프로젝트를 사용하기 전에, 아래의 API 문서를 읽고 사용방법을 이해하는 것이 좋습니다. <br>
			User 관리 메뉴(회원 추가, 삭제 등)와 ClientDetails 관리 메뉴는 OAuth2 검증 없이 접근 가능합니다.<br>
			Unity와 Mobile 메뉴에 접근하려면
			<code>access_token</code>
			URL 뒤에 access_token 매개변수를 입력하여 접근할 수 있습니다
		</p>
		<p>
			<a class="btn btn-lg btn-success" target="_blank"
				href="<c:url value='/resources/api/SOS_API-1.0.html'/>"
				role="button">API 문서 제공</a>
		</p>
	</div>

	<!-- Example row of columns -->
	<div class="row">
		<div class="col-lg-4">
			<h2>Client_details</h2>
			<p>
				사용자 정의해야 하는 경우,
				<code>client_details</code>
				메뉴를 선택하여 데이터를 추가 할 수 있습니다. 또한, 이미 생성된 사용자 리스트를 조회할 때도
				<code>client_details </code>
				메뉴를 통해 확인 할 수 있습니다.
			</p>
			<p>
				<a class="btn btn-primary" href="#" role="button">View details
					&raquo;</a>
			</p>
		</div>
		<div class="col-lg-4">
			<h2>Unity</h2>
			<p>
				Unity 메뉴 OAuth2 접근 검증이 필요한 보호 resources입니다.
				<code>Unity 메뉴</code>
				에 접근하려면 [ROLE_UNITY] 역할과 (resourceId:
				<mark>unity-resource</mark>
				) URL 뒤에 access_token 매개변수를 입력하여 접근할 수 있습니다

			</p>
			<p>
				<a class="btn btn-primary" href="#" role="button">View details
					&raquo;</a>
			</p>
		</div>
		<div class="col-lg-4">
			<h2>Mobile</h2>
			<p>
				Mobile 메뉴 OAuth2 접근 검증이 필요한 보호 resources입니다.
				<code>Mobile 메뉴</code>
				에 접근하려면 [ROLE_MOBILE] 역할과 (resourceId:
				<mark>mobile-resource</mark>
				) URL 뒤에 access_token 매개변수를 입력하여 접근할 수 있습니다
			</p>
			<p>
				<a class="btn btn-primary" href="#" role="button">View details
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>
