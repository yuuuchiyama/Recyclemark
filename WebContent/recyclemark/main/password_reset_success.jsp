<%-- パスワードリセット完了JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
      body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-image: url("../../images/20210729_1.jpg");
	        background-size: cover;
	        background-position: center top;
	        background-attachment: fixed;
	        color: #333;
	        overflow: hidden; /* スクロールバーを非表示にする */
	    }
		/* ヘッダーのスタイル */
		.header {
		    display: flex;
		    padding: 15px 20px;
		    justify-content: space-between;
		    align-items: center;
		    background-color: rgba(255, 255, 255, 0.8);
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
		    color: #000;
	    }
	    .title {
		    font-size:40px;
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
	    .main {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        margin: 120px 0 0 0;
	        min-height: 100vh;
	        padding: 20px 0 20px 0;
	    }

	    .main-container {
	        background-color: rgba(255, 255, 255, 0.7); /* 半透明の背景色 */
	        padding: 50px 50px;
	        border-radius: 15px;
	        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	        max-width: 500px; /* 任意の幅 */
	        width: 100%;
	        text-align: center;
	    }
	</style>

	<title>ログイン</title>

</head>
<body>
	<header>
		<div class="header">
			<div class="title">RecycleMark Navigator</div>
		</div>
	</header>

	<!-- メインコンテンツ部分 -->
	<div class="main">
	<input type="hidden" value="${language }" id="language" />
           <div class="main-container">
           	<h3 id="password_reset">パスワードのリセットが完了しました</h3>
			<a href="../login.jsp" id="login">ログイン画面に戻る</a>
		</div>
	</div>
	<script>
		const language = document.getElementById("language").value;
	    const password_reset = document.getElementById("password_reset");
	    const login = document.getElementById("login");

	 // jsonファイルの読み込み
		fetch("../JSON/password_reset_success.json")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			password_reset.innerHTML = data[language]["password_reset"]
			login.innerHTML = data[language]["login"]

		})
		.catch(error => {
			// エラー処理
		});
	</script>
</body>
</html>