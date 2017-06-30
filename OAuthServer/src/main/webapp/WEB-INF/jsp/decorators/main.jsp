<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>" />
<title><decorator:title default="" /> - Spring Security &
	OAuth2</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/justified-nav.css'/>" rel="stylesheet" />
<decorator:head />

</head>
<body>
	<div class="container">
		<div class="masthead">
			<nav class="navbar navbar-light bg-faded rounded mb-3">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarCollapse" aria-controls="navbarCollapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-toggleable-md" id="navbarCollapse">
					<ul
						class="nav navbar-nav text-md-center justify-content-md-between">
						<li class="nav-item active"><a class="nav-link" href="<c:url value='/'/>">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/client_details'/>">ClientDetails관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/user/overview' />">User관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/unity/dashboard' />">Unity</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/m/dashboard'/>">Mobile</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="http://example.com"
							id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">My Page</a>
							<div class="dropdown-menu" aria-labelledby="dropdown01">
								<a class="dropdown-item" href="#">Login</a> <a
									class="dropdown-item" href="#">Logout</a> <a
									class="dropdown-item" href="#">Sign up</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
		<decorator:body />
		<footer class="footer">
			<p class="text-center text-muted">
				&copy; 2017 <a href="mailto:yks8890@nanuminet.com">yks8890@nanuminet.com</a>
				from <a href="http://git.oschina.net/shengzhao/OAuthServer"
					target="_blank">OAuthServer</a>
			</p>
		</footer>
	</div>

	<script src="<c:url value='/js/jquery-3.1.1.slim.min.js'/>"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>

	<script src="<c:url value='/js/tether.min.js'/>"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<c:url value='/js/ie10-viewport-bug-workaround.js'/>"></script>
</body>
</html>