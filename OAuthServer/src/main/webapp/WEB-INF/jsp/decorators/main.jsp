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
<title><decorator:title default="" /> - Spring Security&OAuth2</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/justified-nav.css'/>" rel="stylesheet" />
<decorator:head />

</head>
<body class="container">
	<div>
		<div>
			<decorator:body />
		</div>
		<div>
			<hr />
			<p class="text-center text-muted">
				&copy; 2017 <a href="mailto:yks8890@hanmail.net">yks8890@hanmail.net</a>
				from <a href="http://git.oschina.net/shengzhao/OAuthServer"
					target="_blank">OAuthServer</a>
			</p>
		</div>
	</div>

	<script src="<c:url value='/js/jquery-3.1.1.slim.min.js'/>"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>

	<script
		src="<c:url value='/js/tether.min.js'/>"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<c:url value='/js/ie10-viewport-bug-workaround.js'/>"></script>
</body>
</html>