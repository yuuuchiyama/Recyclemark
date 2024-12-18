<<%-- ログインJSP --%>
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
	    background-position: center;
	    background-attachment: fixed;
	    color: #333;
	}
	.container {
	    width: 400px;
	    text-align: center;
	    background-color: rgba(255, 255, 255, 0.7);
	    padding: 40px 50px;
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
	.language-buttons button {
	    flex: 1;
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
	.language-buttons button:hover {
	    background-color: rgba(58, 92, 52, 0.8);
	}
	input[type="email"] {
        width: 300px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 20px;
    }
	input[type="password"] {
	    width: 300px;
	    padding: 10px;
	    font-size: 16px;
	    margin-bottom: 20px;
	}
	.form-group {
	    display: flex;
	    align-items: center;
	    margin-bottom: 5px;
	    width: 100%;

	}
	.form-group label {
	    width: 100px;
	    text-align: left;
	    margin-right: 10px;
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
        margin-top: 0;
        padding: 6px 23px;
        background-color: #4E7644;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 20px;
        cursor: pointer;
    }
	.search-button:hover {
	    background-color: #3a5c34;
	}
	.link {
	    margin-top: 15px;
	    display: block;
	    color: #333;
	}
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
    .language-buttons input{
        flex: 1;
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
        width: 300px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    input[type="password"] {
        width: 300px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        width: 100%;
    }
    .form-group label {
        width: 120px;
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
        margin-top: 5px;
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
</style>
<title>ログイン</title>

</head>
<body>

	<div class="main-container">
    <h1 id="area1">ログイン</h1>
    <div class="language-buttons">
        <input type="button" id="button_lan" value="日本語" onclick="sample();">
        <input type="button" id="button_lan" value="English" onclick="sample1();">
        <input type="button" id="button_lan" value="한국어" onclick="sample2();">
        <input type="button" id="button_lan" value="中文" onclick="sample3();">
    </div>
    <form action="LoginExecute.action" method="post">
        <div class="form-group">
            <label for="mail" id="mail_label">メールアドレス:</label>
            <input type="email" id="mail" name="mail" required>
        </div>
        <div class="form-group">
            <label for="password" id="password_label">パスワード:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="button" id="button_login">ログイン</button>
    </form>
    <a href="main/create.jsp">アカウント作成</a>
    </div>
    <script>
	    function sample(){
	            document.getElementById("area1").innerText = "ログイン";
	            document.getElementById("mail_label").innerText = "メールアドレス:";
	            document.getElementById("password_label").innerText = "パスワード:";
	            document.getElementById("button_login").innerText = "ログイン";
	            document.getElementById("link_create").innerText = "新規登録はこちら";
	    }
	    function sample1(){
	        document.getElementById("area1").innerText = "LOGIN";
	        document.getElementById("mail_label").innerText = "email address:";
	        document.getElementById("password_label").innerText = "password:";
	        document.getElementById("button_login").innerText = "LOGIN";
	        document.getElementById("link_create").innerText = "Sign up here";
	    }
	    function sample2(){
	        document.getElementById("area1").innerText = "로그인";
	        document.getElementById("mail_label").innerText = "메일 주소:";
	        document.getElementById("password_label").innerText = "비밀번호:";
	        document.getElementById("button_login").innerText = "로그인";
	        document.getElementById("link_create").innerText = "여기에서 회원 가입하세요";
	    }
	    function sample3(){
	        document.getElementById("area1").innerText = "登录";
	        document.getElementById("mail_label").innerText = "电子邮件地址:";
	        document.getElementById("password_label").innerText = "密码:";
	        document.getElementById("button_login").innerText = "登录";
	        document.getElementById("link_create").innerText = "新用户注册在这里";
	    }

	    window.onload = function() {
	    	if (<%=request.getAttribute("logout") %> != null) {
	    		alert("ログアウト完了");
	    	}
	   	};
	</script>
</body>
</html>
