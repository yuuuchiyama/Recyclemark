<%-- 画像検索JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		RecycleMark
	</c:param>

	<c:param name="scripts"></c:param>

	<div class="main">
<!-- 画像検索画面 -->
<div class="image-search-container">
    <h1>画像検索</h1>
    <input type="file" id="image-search-input" class="image-input" accept="image/*">
    <button class="search-button">検索</button>
</div>
</div>
</c:import>


