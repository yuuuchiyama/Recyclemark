<%-- メニューJSP --%>
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
	        flex-direction: column;
	        align-items: center;
	        margin: 70px 0 0 0;
	        min-height: 100vh;
	        padding: 20px 0 20px 0;
	    }


	    .main-container {
			  display: flex; /* フレックスボックスを使用 */
			  flex-direction: column; /* 縦方向の配置 */
			  align-items: center; /* 水平方向に中央揃え */
			  justify-content: center; /* 垂直方向に中央揃え */
			  margin: 0 auto; /* 中央寄せ */
			  padding: 30px 50px;
			  background-color: rgba(255, 255, 255, 0.7); /* 半透明の背景色 */
			  border-radius: 15px;
			  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
			  max-width: 400px;
			  width: 100%;
			  text-align: center; /* 中央揃え */
			}
		.edit ul {
		  list-style: none;
		  padding: 0;
		}
		.edit li {
		  display: flex;
		  align-items: center;
		  margin-bottom: 20px;
		}



		.edit li::before {
		  content: "•";
		  margin-right: 8px;
		  color: #333;
		  font-size: 18px;
		}
	</style>
</head>

<title>編集</title>

   <header>
		<div class="header">
		<a class="back" href="mypage.jsp">＜</a>
		</div>
	</header>


		<!-- メインコンテンツ部分 -->
		<div class="main">
            <div class="main-container">
				<div class="edit">
					<ul>

						<li><a href="password_change.jsp">パスワード変更</a></li>

						<li><a href="reset_mail.jsp?forlogin=0&delete=1">アカウント削除</a></li>
					</ul>
				</div>
			</div>
		</div>


