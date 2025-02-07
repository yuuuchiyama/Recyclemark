<%-- パスワード変更JSP --%>
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
		    margin: 30px 20px 10px 20px;
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
	        margin: 70px 0 0 0;
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
        margin-bottom: 30px;
        height: 30px;
        width: 80%;
    }
    .form-group label {
        font-weight: bold;
        width: 140px;
        text-align: left;
        margin-top: 5px;
        margin-right: 10px;
    }
    .form-group1 {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        height: 30px;
        width: 80%;
    }
    .form-group1 label {
        font-weight: bold;
        width: 140px;
        text-align: left;
        margin-top: 5px;
        margin-right: 10px;
    }
    .form-group2 {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
        height: 30px;
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
	<title>パスワード変更</title>
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
			<a class="back" href="edit.jsp">＜</a>
		</div>
	</header>

	<!-- メインコンテンツ部分 -->
	<div class="main">
	          <div class="main-container">
			<div class="reset">
				<form action="PasswordChangeExecute.action" method="post">
					<div>${errors.get("password_error")}</div>
					<div class="form-group">
						<label>現在のパスワード:</label>
						<input type="password" name="originpas" required oninvalid="this.setCustomValidity('パスワードを入力してください')"><br>
					</div>
					<div class="form-group1">
						<label>新しいパスワード:</label>
						<input type="password" name="password1" required oninvalid="this.setCustomValidity('パスワードを入力してください')"><br>
					</div>
					<div class="form-group2">
						<label>新しいパスワード:(再入力)</label>
						<input type="password" name="password2" required oninvalid="this.setCustomValidity('パスワードを入力してください')">
					</div>
				    <button type="submit" class="action-button">変更</button>
			    </form>
			</div>
		</div>
	</div>
</body>
</html>