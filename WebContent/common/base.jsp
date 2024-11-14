<%-- 共通テンプレート --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/main.css">
<title>${param.title}</title>
</head>
<body>
	<header>
		<c:import url="/common/header.jsp" />
	</header>
	<main> ${param.content} </main>
<script src="../js/main.js"></script>
${param.scripts}
</body>
</html>