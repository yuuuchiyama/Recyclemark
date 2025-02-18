<%-- メニューJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	boolean result = false;
	boolean toDele = false;
	String forlogin = "1";
	String delete = "1";
	System.out.print("3");
	if (request.getAttribute("error") != null) {
		System.out.println("0");
		forlogin = (String)request.getAttribute("forlogin");
		if(forlogin.equals("1")){
			result = true;
		}
	} else {
		forlogin = request.getParameter("forlogin");
		delete = request.getParameter("delete");
		System.out.println(forlogin);
		result = false;
		toDele = false;
		if(forlogin.equals("1")){
			result = true;
		}
		if(delete.equals("1")){
			toDele = true;
		}
		request.setAttribute("forlogin", forlogin);
	}
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
	        width: 400px;
	        text-align: center;
	        background-color: rgba(255, 255, 255, 0.7);
	        padding: 60px 50px;
	        border-radius: 20px;
	        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	        max-width: 500px;
	        width: 100%;
    	}
        h1 {
	      font-size: 24px;
	      margin-bottom: 20px;
	       }
	    input[type="email"] {
	        flex: 1;
	        padding: 5px;
	        width: 100%;
	        font-size: 15px;
	        border: 1.5px solid #4E7644;
	        border-radius: 5px;
	        box-sizing: border-box;
	        margin-bottom: 10px;

	     }
	    form {
	        display: flex;
	        flex-direction: column;
	        align-items: center; /* フォーム内要素の中央揃え */
	    }
	    .form-group {
	        display: flex;
	        align-items: center;
	        width: 100%;
	    }
		h4{
		   align-items: center;
		   text-align: center;
		   margin-left: 20px;
		   height:5px;
		   width:500px

		}
	    button {
	        margin-top: 20px;
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
   	<c:choose>
   		<c:when test="<%= result %>">
   			<a class="back" href="../login.jsp">＜</a>
   		</c:when>
   		<c:otherwise>
   			<a class="back" href="edit.jsp">＜</a>
   		</c:otherwise>
   	</c:choose>

	<!-- メインコンテンツ部分 -->
	<div class="main">
           <div class="main-container">
			<div class="reset">
			<input type="hidden" value="${language }" id="language" />
				<h3 id="address">メールアドレス</h3>
				<form action="PasswordReset.action" method="post">
					<div class="form-group">
						<c:choose>
							<c:when test="<%= result %>">
								<input type="hidden" name="forlogin" value="<%= forlogin %>">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="forlogin" value="0">
								<c:if test="<%= toDele %>">
									<input type="hidden" name="todelete" value="<%= delete %>">
								</c:if>
							</c:otherwise>
						</c:choose>
						<c:choose>
						  <c:when test="${language == '日本語'}">
						    <input type="email" id="mail" name="mail" required oninvalid="this.setCustomValidity('メールアドレスを入力してください')">
						  </c:when>
						  <c:when test="${language == 'English'}">
						    <input type="email" id="mail" name="mail" required oninvalid="this.setCustomValidity('Enter your email address')">
						  </c:when>
						  <c:when test="${language == '한국어'}">
						    <input type="email" id="mail" name="mail" required oninvalid="this.setCustomValidity('이메일 주소를 입력하세요')">
						  </c:when>
						  <c:when test="${language == '中文'}">
						    <input type="email" id="mail" name="mail" required oninvalid="this.setCustomValidity('输入您的电子邮件地址')">
						  </c:when>
						  <c:otherwise>
						    <input type="email" id="mail" name="mail" required oninvalid="this.setCustomValidity('メールアドレスを入力してください')">
						  </c:otherwise>
						</c:choose>
					</div>
					<c:if test="${error != null}">
						<div class="form-group">
							<h4>${error }</h4>
				        </div>
					</c:if>
			        <button type="submit" class="action-button" id="send">送信</button>
			    </form>
			</div>
		</div>
	</div>
	<script>
	const menuIcon = document.getElementById('menu-icon');
       const menu = document.getElementById('menu');
       const searchContainer = document.getElementById('search-container');
       // Toggle menu display
       menuIcon.addEventListener('click', function() {
           if (menu.style.display === 'flex') {
               menu.style.display = 'none';
               searchContainer.style.display = 'flex'; // Show search container
           } else {
               menu.style.display = 'flex';
               searchContainer.style.display = 'none'; // Hide search container
           }
       });
       // Toggle submenu display
       function toggleSubMenu(submenuId) {
           const submenu = document.getElementById(submenuId);
           submenu.style.display = submenu.style.display === 'flex' ? 'none' : 'flex';
       }

		const mailInput = document.getElementById('mail');

		searchInput.addEventListener('input', function() {
			if (!mailInput.validity.valueMissing) {
				mailInput.setCustomValidity('');
			}
		});

		const language = document.getElementById("language").value;
	    const address = document.getElementById("address");
	    const send = document.getElementById("send");

	 // jsonファイルの読み込み
		fetch("../JSON/reset_mail.json")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			address.innerHTML = data[language]["reset_mail"]
			send.innerHTML = data[language]["send"]

		})
		.catch(error => {
			// エラー処理
		});


	</script>
</body>
</html>