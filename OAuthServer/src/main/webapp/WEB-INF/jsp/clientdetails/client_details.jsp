
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>client_details</title>

<style>
.list-group li:hover {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<a href="<c:url value='/' />">Home</a>

	<div class="row">
		<div class="col-md-10">
			<h3>client_details</h3>
		</div>
		<div class="col-md-2">
			<div class="pull-right">
				<a href="register_client" class="btn btn-success btn-sm">client
					추가</a>
			</div>
		</div>
	</div>

	<hr />

	<div>
		<ul class="list-group">
			<c:forEach items="${clientDetailsDtoList}" var="cli">
				<li class="list-group-item">
					<div class="pull-right">
						<c:if test="${not cli.archived}">
							<a href="<c:url value='/test_client/${cli.clientId}'/>">test</a>
							<a href="<c:url value='/archive_client/${cli.clientId}'/>"
								class="text-danger"
								onclick="return confirm('Are you sure archive \'${cli.clientId}\'?')">archive</a>
						</c:if>
						<c:if test="${cli.archived}">
							<strong class="text-muted">Archived</strong>
						</c:if>
					</div>
					<h3 class="list-group-item-heading">
						${cli.clientId} <small>${cli.authorizedGrantTypes}</small>
					</h3>

					<div class="list-group-item-text text-muted">
						client_id: <span class="text-danger">${cli.clientId}</span>&nbsp;
						client_secret: <span class="text-primary">${cli.clientSecret}</span>&nbsp;
						<br /> authorized_grant_types: <span class="text-primary">${cli.authorizedGrantTypes}</span>&nbsp;
						resource_ids: <span class="text-primary">${cli.resourceIds}</span>&nbsp;
						<br /> scope: <span class="text-primary">${cli.scope}</span>&nbsp;
						web_server_redirect_uri: <span class="text-primary">${cli.webServerRedirectUri}</span>&nbsp;
						<br /> authorities: <span class="text-primary">${cli.authorities}</span>&nbsp;
						access_token_validity: <span class="text-primary">${cli.accessTokenValidity}</span>&nbsp;
						refresh_token_validity: <span class="text-primary">${cli.refreshTokenValidity}</span>&nbsp;
						<br /> create_time: <span class="text-primary">${cli.createTime}</span>&nbsp;
						archived: <strong
							class="${cli.archived?'text-warning':'text-primary'}">${cli.archived}</strong>&nbsp;
						trusted: <span class="text-primary">${cli.trusted}</span>&nbsp;
						additional_information: <span class="text-primary">${cli.additionalInformation}</span>&nbsp;
					</div>
				</li>
			</c:forEach>

		</ul>
		<p class="help-block">
			각각의 item 통신
			<code>oauth_client_details</code>
			데이터 테이블; 총<strong>${fun:length(clientDetailsDtoList)}</strong>기술데이터. <br />
			spring-oauth-server데이터베이스 테이블의 방문에 대한 자세한 설명에 <a
				href="http://andaily.com/spring-oauth-server/db_table_description.html"
				target="_blank">http://andaily.com/spring-oauth-server/db_table_description.html</a>
			(또는 Access 프로젝트others 폴더 db_table_description.html파일)
		</p>
	</div>
</body>
</html>