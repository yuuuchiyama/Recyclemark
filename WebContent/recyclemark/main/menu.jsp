<%-- メニューJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="style">
		body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-image: url("../../images/20210729_1.jpg");
	        background-size: cover;
	        background-position: center top;
        	background-attachment: fixed;
	        color: #333;
	    }
	    /* ヘッダーのスタイル */
	    .header {
	        display: flex;
	        background: transparent; /* 背景を透明に設定 */
	        padding: 15px 20px;
	        display: flex;
	        justify-content: space-between;
	        align-items: center;
	        background-color: rgba(255, 255, 255, 0.8);
	        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	        color: #000;
	    }
	    .title {
	        font-size: 40px;
	        font-weight: bold;
	    }
	    /* Hamburger menu icon */
	    .menu-icon {
	        display: flex;
	        cursor: pointer;
	        flex-direction: column;
	        gap: 6px;
	        justify-content: center;
	        align-items: center;
	        z-index: 1002; /* Menuの上に表示するため */
	    }
	    .menu-icon div {
	        width: 25px;
	        height: 3px;
	        background-color: #000;
	        border-radius: 2px;
	    }
	    /* Full-screen menu style */
	    .menu {
	        display: none;
	        flex-direction: column;
	        position: fixed;
	        top: 0;
	        left: 0;
	        width: 100%;
	        background-color: #fff;
	        justify-content: flex-start;
	        padding-top: 60px;
	        z-index: 1000;
	        height: calc(100vh - 120px);
	    }
	    .menu-item {
	        font-size: 18px;
	        padding: 15px 20px;
	        border-bottom: 1px solid #ddd;
	        cursor: pointer;
	    }
	    .menu-item a {
	     font-size: 16px;
	     padding: 10px 0;
	     text-decoration: none;
	     color: #333;
	    }
	    /* Submenu style */
	    .submenu {
	        padding-left: 20px;
	        display: none;
	        flex-direction: column;
	    }
	    .submenu a {
	        font-size: 16px;
	        padding: 10px 0;
	        text-decoration: none;
	        color: #333;
	    }
	    .menu-item:hover, .submenu a:hover {
	        background-color: #f0f0f0;
	    }
	    .back {
	     border-radius: 50%; /* ボタンを丸く */
	     display: flex;
	     justify-content: center; /* 水平方向に中央揃え */
	     align-items: center; /* 垂直方向に中央揃え */
	     padding: 18px 18px 15px 10px;
	     width: 25px;
	     height: 20px;
	     background: #f0f0f0;
	     color: #4E7644;
	     text-decoration: none;
	     font-size: 30px;
	     margin: 10px 20px;
	     border: 1px solid #ccc; /* 境界線の色 */
	     box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	     transition: background-color 0.3s, border-color 0.3s;
	    }
	    .back:hover {
	        background-color: #e0e0e0;
	        border-color: #999;
	        color: #3a5c34;
	    }
	    /* メインコンテンツ部分のスタイル */
	    .main {
	    display: flex;
	    justify-content: center;
	    text-align: center;
	    flex-direction: column;
	    align-items: center;
	    margin-top: 20px;
	    min-height: 100vh;
	    padding: 20px;
	    }

	    .button-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px; /* ボタン間のスペース */
        margin-top: 20px;
	    }

	    form {
	        margin: 0; /* 不要な余白を削除 */
	    }

	    .action-button {
	        display: inline-block;
	        padding: 15px 30px;
	        font-size: 16px;
	        font-weight: bold;
	        color: #f0f0f0;
	        background-color: rgba(78, 118, 68, 0.6);
	        border: 4px solid rgba(78, 118, 68, 0.6);
	        border-radius: 8px;
	        cursor: pointer;
	        text-align: center;
	        transition: background-color 0.3s, color 0.3s;
	    }

	    .action-button:hover {
	        background-color: rgba(58, 92, 52, 0.8);
	        color: #fff;
	    }
	</c:param>
	<c:param name="title">
		メニュー
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<div class="main">
		   <div class="button-container">
    <form action="TextSearch.action" method="post">
        <button type="submit" class="action-button">テキスト検索</button>
    </form>
    <form action="ImageSearch.action" method="post">
        <button type="submit" class="action-button">画像検索</button>
    </form>
    <form action="Ranking.action" method="post">
        <button type="submit" class="action-button">ランキング</button>
    </form>
    <form action="LanguageSelection.action" method="post">
        <button type="submit" class="action-button">言語選択に戻る</button>
    </form>
</div>

		</div>
	</c:param>
</c:import>