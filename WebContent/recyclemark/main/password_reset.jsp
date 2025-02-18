<%-- パスワードリセットJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String mail = request.getParameter("mail");
%>
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

	    .main {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        margin: 100px 0 0 0;
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

    input[type="password"] {
        flex: 1;
        padding: 5px;
        width: 100%;
        font-size: 15px;
        border: 1.5px solid #4E7644;
        border-radius: 5px;
        box-sizing: border-box;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center; /* フォーム内要素の中央揃え */
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        width: 80%;
    }
    .form-group label {
        font-weight: bold;
        width: 140px;
        text-align: left;
        margin-top: 5px;
        margin-right: 10px;
    }
    .form-group2 {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        width: 80%;
    }
    .form-group2 label {
        font-weight: bold;
        width: 140px;
        text-align: left;
        margin-top: 25px;
        margin-right: 10px;
    }

    button {
        margin-top: 10px;
        padding: 5px 20px;
        background-color: #4E7644;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    button:hover {
        background-color: #3a5c34;
    }
	</style>
	<title>パスワードリセット</title>
</head>

<body>
	<script>
		const mailInput = document.getElementById('mail');

		searchInput.addEventListener('input', function() {
			if (!mailInput.validity.valueMissing) {
				mailInput.setCustomValidity('');
			}
		});
	</script>
	<header>
		<div class="header">
			<div class="title">RecycleMark Navigator</div>
		</div>
	</header>

	<!-- メインコンテンツ部分 -->
	<div class="main">
	<input type="hidden" value="${language }" id="language" />
	          <div class="main-container">
			<div class="reset">
				<form action="PasswordResetExecute.action" method="post">
				<input type="hidden" name="mail" value="<%= mail %>">
				<div>${errors.get("password_error")}</div>
				<div class="form-group">
					<label id="new_pass">新しいパスワード:</label>
					<input type="password" id="mail" name="password1" required oninvalid="this.setCustomValidity('パスワードを入力してください')"><br>
				</div>
				<div class="form-group2">
					<label id="new_pass_send">新しいパスワード:(再入力)</label>
					<input type="password" id="mail" name="password2" required oninvalid="this.setCustomValidity('パスワードを入力してください')">
				</div>
			        <button type="submit" class="action-button" id="reset">リセット</button>
			    </form>
			</div>
		</div>
	</div>

	<script>
		const language = document.getElementById("language").value;
	    const new_pass = document.getElementById("new_pass");
	    const new_pass_send = document.getElementById("new_pass_send");
	    const reset = document.getElementById("reset");

	 // jsonファイルの読み込み
		fetch("../JSON/new_password.json")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			new_pass.innerHTML = data[language]["new_pass"];
			new_pass_send.innerHTML = data[language]["new_pass_send"];
			reset.innerHTML = data[language]["reset"];

		})
		.catch(error => {
			// エラー処理
		});
	</script>

</body>

</html>