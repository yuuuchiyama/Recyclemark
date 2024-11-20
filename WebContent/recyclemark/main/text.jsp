<%-- テキスト検索JSP --%>
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
       /* Header style */
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



        .main {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            min-height: 100vh;
            padding: 20px;
        }

        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 60px 50px;
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        .search-container h1 {
            font-size: 32px;
            margin-bottom: 0;
        }
        .search-container p{
            font-size: 16px;
            margin-top: 2px;
            margin-bottom: 20px;
        }
        .search-input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1.5px solid #4E7644;
            border-radius: 5px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .search-button {
            padding: 10px 20px;
            background-color: #4E7644;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-button:hover {
            background-color: #3a5c34;
        }
        </c:param>

	<c:param name="title">
		RecycleMark
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<form action="TextSearchExecute.action" method="post">
			<!-- メインコンテンツ部分 -->
			<!-- Search container -->
	 		<div class="main">
				<div class="search-container" id="search-container">
					<h1>テキスト検索</h1>
					<p>リサイクルマークについて入力してください。</p>
					<div>${errors.get("mark_error")}</div>
					<input type="text" id="search-input" class="search-input" name="detail" value="${errors.get('mark_error')}" placeholder="検索キーワードを入力">
					<button class="search-button">検索</button>
				</div>
			</div>
		</form>
	</c:param>
</c:import>