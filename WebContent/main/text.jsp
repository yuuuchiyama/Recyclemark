<%-- テキスト検索JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		RecycleMark
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<!-- Search container -->
 		<div class="main">
			<div class="search-container" id="search-container">
				<h1>テキスト検索</h1>
				<p>リサイクルマークについて入力してください。</p>
				<input type="text" id="search-input" class="search-input" placeholder="検索キーワードを入力">
				<button class="search-button">検索</button>
			</div>
		</div>
	</c:param>
</c:import>