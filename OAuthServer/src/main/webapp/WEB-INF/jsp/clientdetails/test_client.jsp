<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Test [${clientDetailsDto.clientId}]</title>

<script src="<c:url value='/js/angular.min.js'/>"></script>

</head>
<body>
	<div ng-app>
		<a href="<c:url value='/'/>">Home</a>

		<h2>Test [${clientDetailsDto.clientId}]</h2>

		<p>
			<code>grant_type</code>
			아래의 URL은 전체 Oauth 테스트를 제공합니다.<a
				href="http://git.oschina.net/mkk/spring-oauth-client"
				target="_blank">spring-oauth-client</a> 계획.
		</p>

		<div ng-controller="TestClientCtrl">
			<c:if test="${clientDetailsDto.containsAuthorizationCode}">
				<div class="panel panel-default">
					<div class="panel-heading">Test [authorization_code]</div>
					<div class="panel-body">
						<p class="text-muted">주소 아래의 링크를 각 단계를 클릭에 필요한 정보를 입력 한 후..</p>
						<ol>
							<li>
								<p>
									<code>부터 spring-oauth-server받기 'code'</code>
									<br /> redirect_uri: <input type="text" value=""
										ng-model="redirectUri" size="70" required="required" /> <br />
									<a
										href="<c:url value='/oauth/authorize?client_id={{clientId}}&redirect_uri={{redirectUri}}&response_type=code&scope={{scope}}&state=your_state'/>"
										target="_blank">
										/oauth/authorize?client_id={{clientId}}&redirect_uri={{redirectUri}}&response_type=code&scope={{scope}}&state=your_state</a>
									<span class="label label-info">GET</span>
								</p>
							</li>
							<li><code>용도 'code' 교환 'access_token'</code> <br /> 입력을
								획득하는 첫 단계 code: <input type="text" name="code" value=""
								ng-model="code" required="required" /> <br />

								<form
									action="<c:url value='/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=authorization_code&code={{code}}&redirect_uri={{redirectUri}}'/>"
									method="post" target="_blank">
									<%--<a href="${contextPath}/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=authorization_code&code={{code}}&redirect_uri={{redirectUri}}"--%>
									<%--target="_blank">/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=authorization_code&code={{code}}&redirect_uri={{redirectUri}}</a>--%>
									<button class="btn btn-link" type="submit">
										/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=authorization_code&code={{code}}&redirect_uri={{redirectUri}}
									</button>
									<span class="label label-warning">POST</span>
								</form></li>
						</ol>
					</div>
				</div>
			</c:if>

			<c:if test="${clientDetailsDto.containsPassword}">
				<div class="panel panel-default">
					<div class="panel-heading">Test [password]</div>
					<div class="panel-body">
						<p class="text-muted">기입 username, password 링크 주소를 클릭합니다.</p>
						username: <input type="text" required="required"
							ng-model="username" /> <br /> password: <input type="text"
							required="required" ng-model="password" /> <br />

						<form
							action="<c:url value='/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=password&scope={{scope}}&username={{username}}&password={{password}}'/>"
							method="post" target="_blank">
							<%--<a href="${contextPath}/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=password&scope={{scope}}&username={{username}}&password={{password}}"--%>
							<%--target="_blank">/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=password&scope={{scope}}&username={{username}}&password={{password}}</a>--%>
							<button class="btn btn-link" type="submit">
								/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=password&scope={{scope}}&username={{username}}&password={{password}}
							</button>
							<span class="label label-warning">POST</span>
						</form>
					</div>
				</div>
			</c:if>

			<c:if test="${clientDetailsDto.containsImplicit}">
				<div class="panel panel-default">
					<div class="panel-heading">Test [implicit]</div>
					<div class="panel-body">
						<p class="text-muted">기입 redirect_uri 링크 주소를 클릭합니다.
							받기access_token 주 시청 후redirect_uri 의hash제 (# 기호 뒤에 섹션)</p>
						redirect_uri: <input type="text" value=""
							ng-model="implicitRedirectUri" size="70" required="required" />

						<p>
							<a
								href="<c:url value='/oauth/authorize?client_id={{clientId}}&response_type=token&scope={{scope}}&redirect_uri={{implicitRedirectUri}}'/>">/oauth/authorize?client_id={{clientId}}&response_type=token&scope={{scope}}&redirect_uri={{implicitRedirectUri}}</a>
							<span class="label label-info">GET</span>
						</p>
					</div>
				</div>
			</c:if>

			<c:if test="${clientDetailsDto.containsClientCredentials}">
				<div class="panel panel-default">
					<div class="panel-heading">Test [client_credentials]</div>
					<div class="panel-body">
						<p class="text-muted">테스트에 링크 주소를 클릭하십시오</p>


						<form
							action="<c:url value='/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=client_credentials&scope={{scope}}'/>"
							method="post" target="_blank">
							<%--<a href="${contextPath}/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=client_credentials&scope={{scope}}"--%>
							<%--target="_blank">/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=client_credentials&scope={{scope}}</a>--%>
							<button class="btn btn-link" type="submit">
								/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=client_credentials&scope={{scope}}
							</button>
							<span class="label label-warning">POST</span>
						</form>
					</div>
				</div>
			</c:if>

			<c:if test="${clientDetailsDto.containsRefreshToken}">
				<div class="panel panel-default">
					<div class="panel-heading">Test [refresh_token]</div>
					<div class="panel-body">
						<p class="text-muted">기입 refresh_token 링크 주소를 클릭합니다.</p>
						refresh_token: <input type="text" ng-model="refreshToken"
							required="required" size="70" /> <br />

						<form
							action="<c:url value='/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=refresh_token&refresh_token={{refreshToken}}' />"
							method="post" target="_blank">
							<%--<a href="${contextPath}/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=refresh_token&refresh_token={{refreshToken}}"--%>
							<%--target="_blank">/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=refresh_token&refresh_token={{refreshToken}}</a>--%>
							<button class="btn btn-link" type="submit">
								/oauth/token?client_id={{clientId}}&client_secret={{clientSecret}}&grant_type=refresh_token&refresh_token={{refreshToken}}
							</button>
							<span class="label label-warning">POST</span>
						</form>
					</div>
				</div>
			</c:if>

			<div class="text-center">
				<a href="<c:url value='/client_details' />" class="btn btn-default">Back</a>
			</div>
		</div>
	</div>

	<script>
		var TestClientCtrl = [
				"$scope",
				function($scope) {
					$scope.clientId = "${clientDetailsDto.clientId}";
					$scope.clientSecret = "${clientDetailsDto.clientSecret}";
					$scope.scope = "${clientDetailsDto.scopeWithBlank}";

					<c:if test="${empty clientDetailsDto.webServerRedirectUri}" var="eptRedUri">
					$scope.implicitRedirectUri = location.href;
					$scope.redirectUri = "http://localhost:8080/spring-oauth-server/unity/dashboard";
					</c:if>
					<c:if test="${not eptRedUri}">
					$scope.implicitRedirectUri = "${clientDetailsDto.webServerRedirectUri}";
					$scope.redirectUri = "${clientDetailsDto.webServerRedirectUri}";
					</c:if>

					$scope.username = "mobile";
					$scope.password = "mobile";
					//a temp value
					$scope.refreshToken = "1156ebfe-e303-4572-9fb5-4459a5d46610";

				} ];
	</script>
</body>
</html>