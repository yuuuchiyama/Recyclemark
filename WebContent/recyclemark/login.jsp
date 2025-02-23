<%-- ログインJSP --%>
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
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url("../images/20210729_1.jpg");
        background-size: cover;
        background-position: center top;
        background-attachment: fixed;
        color: #333;
    }
    .main-container {
        width: 400px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 40px 70px;
        border-radius: 15px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 500px;
        width: 100%;
    }
    .language-buttons {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
	.language-buttons input {
	    width: 115px;
	    height: 45.33px;
		margin: 0 5px;
        padding: 5px;
        font-size: 18px;
        font-weight: bold;
        color: #f0f0f0;
        border: 4px solid rgba(78, 118, 68, 0.8);
        border-radius: 8px;
        background-color: rgba(78, 118, 68, 0.8);
        cursor: pointer;
	}
    .language-buttons input:hover {
        background-color: rgba(58, 92, 52, 0.8);
    }
    input[type="email"] {
        width: 100px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    input[type="password"] {
        width: 200px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 20px;
        margin-left: 42px;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 5px;
        width: 100%;
    }
    .form-group label {
        text-align: left;
        margin-top: -15px;
        margin-right: 10px;
        font-weight: bold;
    }
    .form-group input {
        flex: 1;
        padding: 5px;
        width: 100%;
        font-size: 15px;
        border: 1.5px solid #4E7644;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .button {
        margin-bottom: 15px;
        padding: 6px 23px;
        background-color: #4E7644;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 20px;
        cursor: pointer;
    }
    .button:hover {
        background-color: #3a5c34;
    }
   	.link {
	    margin-top: 10px;
	    display: block;
	    color: #333;
	}

	h3{
		margin: 5px 10px 5px 60px;
	}
</style>
<title>ログイン</title>

</head>
<body>

	<div class="main-container">
    <h1 id="area1">ログイン</h1>
    <div class="language-buttons">
<%
	String[] select_languages = {"日本語", "English","한국어","中文"};
	request.setAttribute("select_languages", select_languages);
%>
	<c:forEach var="select_language" items="${select_languages}">
		<form action="LanguageSelect.action" method="post">
			<input type="hidden" name="language" value="${select_language}">
			<input type="submit" id="button_lan" value="${select_language}">
		</form>
	</c:forEach>
    </div>
    <input type="hidden" value="${language }" id="language" />
    <form id="form" action="LoginExecute.action" method="post">
        <div class="form-group">
            <label for="mail" id="mail_label">メールアドレス:</label>
            <input type="email" id="mail" name="mail" value="${mail}" required>
            <span class="errorMessage"></span>
        </div>
        <div class="form-group">
            <label for="password" id="password_label">パスワード:</label>
            <input type="password" id="password" name="password" required>
           <span class="errorMessage"></span>
        </div>
		<c:if test="${error != null}">
			<div class="form-group">
				<h3>${error }</h3>
	        </div>
		</c:if>
        <button type="submit" class="button" id="button_login">ログイン</button>
    </form>
    <a id="passreset" href="main/reset_mail.jsp?forlogin=1&delete=0">パスワードを忘れた場合</a><br>
    <a id="create" href="main/create.jsp">アカウント作成</a>
    </div>
    <script>
	    const language = document.getElementById("language").value;
	    const area1 = document.getElementById("area1");
	    const mail = document.getElementById("mail_label");
	    const password = document.getElementById("password_label");
	    const login = document.getElementById("button_login");
	    const passreset = document.getElementById("passreset");
	    const create = document.getElementById("create");

 		// jsonファイルの読み込み
		fetch("../JSON/login_l.json")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			area1.innerHTML = data[language]["login_title"];
			mail.innerHTML = data[language]["mail_login"];
			password.innerHTML = data[language]["password_label"];
			login.innerHTML = data[language]["login_button"];
			passreset.textContent = data[language]["pass_reset"];
			create.textContent = data[language]["link_create"];
		})
		.catch(error => {
			// エラー処理
		});

	    window.onload = function() {
			if (<%=request.getAttribute("logout") %> != null) {
			alert("ログアウト完了");
		}
		};
	</script>
</body>
</html>
