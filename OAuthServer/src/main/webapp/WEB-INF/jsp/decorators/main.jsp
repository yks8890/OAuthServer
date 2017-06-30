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
<style>
body {
	font-family: "Microsoft YaHei", Arial;
}
</style>

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
</body>
</html>