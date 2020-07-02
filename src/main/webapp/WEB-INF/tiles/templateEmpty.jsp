<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 관리</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/master.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin_login.css" type="text/css" media="screen, projection">
		<!--[if IE]>
		<link rel="stylesheet" href="resources/css/ie.css" 
			type="text/css" media="screen, projection">
		<![endif]-->
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/additional-methods.min.js"></script>
		<style>
	
		</style>
		<script>
		
		</script>
	</head>
<body class="empty">
	<div id="container">
		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>