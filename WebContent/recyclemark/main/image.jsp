<%-- 画像検索JSP --%>
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
        padding: 15px 20px;
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
        z-index: 1002;
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
    /* 画像検索画面のスタイル */
    .image-search-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 76px 50px;
        border-radius: 15px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 500px;
        width: 100%;
    }
    h1 {
        font-size: 35px;
        margin-top: 5px;
        margin-bottom: 25px;
    }
    .image-input[type="file"] {
        width: 100%;
        padding: 5px;
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
		    画像検索
	  </c:param>

	  <c:param name="scripts"></c:param>

	<c:param name="content">

	 <div class="main">
	 <form action="ImageSearchExecute.action" method="post">
		<!-- 画像検索画面 -->
		<div class="image-search-container">
		    <h1>画像検索</h1>
		    <input type="file" id="image-search-input" class="image-input" accept="image/*">
		    <button class="search-button">検索</button>
		</div>
	</form>
</div>
</c:param>
</c:import>

