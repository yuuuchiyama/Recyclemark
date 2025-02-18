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
			background-position: center;
			background-attachment: fixed;
			color: #333;
		}
		/* ヘッダーのスタイル */
		.header {
			display: flex;
			background-color: #ddd;
			padding: 15px 20px;
			justify-content: space-between; /* Title and icon space */
			align-items: center; /* Align items vertically */
			box-shadow: 0px 4px 2px -2px gray;
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
			justify-content: center; /* Center the icon vertically */
			align-items: center; /* Center the icon horizontally */
			z-index: 1002; /* Menuの上に表示するため */
		}
		.menu-icon div {
			width: 25px;
			height: 3px;
			background-color: #333;
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
		.menu-item:hover,
		.submenu a:hover {
			background-color: #f0f0f0;
		}
		/* 戻るリンクのスタイル */
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
	</c:param>
	<c:param name="title">
		メニュー
	</c:param>

	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<div class="history">
		<input type="hidden" value="${language }" id="language" />

			<c:choose>
				<c:when test="${recyclemarks[0].getMarkImg() != null}">
					<p><img src="${recyclemarks[0].getMarkImg() }"  ></p>
				</c:when>
				<c:otherwise>
					<div id="null_history">検索履歴はありません</div>
				</c:otherwise>
	    	</c:choose>

		</div>
	</c:param>

	<c:param name="script">
	const language = document.getElementById("language").value;
    const null_history = document.getElementById("null_history");

	// jsonファイルの読み込み
	fetch("../../JSON/history.json")
	  .then(response => response.json())
	  .then(data => {
	  	// レスポンスを処理するコード
	  	// dataにはjsonファイルの中身が格納されている
		null_history.innerHTML = data[language]["null_history"]

	  })
	  .catch(error => {
	    // エラー処理
	  });
	</c:param>
</c:import>