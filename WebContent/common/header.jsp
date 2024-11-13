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
<a href="#">・テキスト検索</a>
<a href="#">・画像検索</a>
<a href="#">・ランキング</a>
</div>
<div class="menu-item"><a href="#">・マイページ</a></div>
<div class="menu-item"><a href="#">・ログアウト</a></div>
</div>

<!-- 戻るリンク -->
<a href="#" class="back">＜戻る</a>