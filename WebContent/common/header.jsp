<%-- ヘッダー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
<div class="title">RecycleMark Navigator</div>
<!-- Hamburger menu icon -->
<div class="menu-icon" id="menu-icon">
<div></div>
<div></div>
<div></div>
</div>
</div>
<!-- Full-screen Menu -->
<div class="menu" id="menu">
	<div class="menu-item" onclick="toggleSubMenu('submenu1')">・メニュー ▼</div>
	<div class="submenu" id="submenu1">
		<a href="TextSearch.action">・テキスト検索</a>
		<a href="ImageSearch.action">・画像検索</a>
		<a href="Ranking.action">・ランキング</a>
	</div>
	<div class="menu-item"><a href="Mypage.action">・マイページ</a></div>
	<div class="menu-item"><a href="Logout.action">・ログアウト</a></div>
</div>

<!-- 戻るリンク -->
<!-- <div class="back" onClick="history.back();">＜</div> -->
