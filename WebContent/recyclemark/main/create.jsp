<%-- アカウント新規作成JSP --%>
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
            background-image: url("../../images/20210729_1.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
        .container {
            width: 400px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 60px 50px;
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
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
        form {
            display: flex;
            flex-direction: column;
            align-items: center; /* フォーム内要素の中央揃え */
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
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
            margin-top: 20px;
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
<title>アカウント新規作成</title>
</head>
<body>
 <div class="container">
        <h1>新規アカウント作成</h1>
        <form action="UserCreateExecute.action" method="post">
            <div class="form-group">
                <label for="mail">Mail:</label>
                <input type="email" id="mail" name="mail" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="button">create</button>
        </form>
    </div>
</body>
</html>