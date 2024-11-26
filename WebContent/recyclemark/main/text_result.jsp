<%-- テキスト検索結果JSP --%>
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
	        background-position: center top;
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
	    /* コンテンツエリア */
	    .main {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        margin: 20px 0 0 0;
	        min-height: 100vh;
	        padding: 20px 0 20px 0;
	    }
	    .main-container {
	        background-color: rgba(255, 255, 255, 0.7); /* 半透明の背景色 */
	        padding: 30px 50px;
	        border-radius: 15px;
	        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	        max-width: 900px; /* 任意の幅 */
	        width: 100%;
	        text-align: center;
	    }
	    /* テキストボックス */
	    .text-border {
	        position: absolute; /* 絶対位置に変更 */
	        top: 100px; /* ヘッダーの下に配置 (ヘッダー高さ + 余白) */
	        right: 20px; /* 右から20px */
	        border: 1px solid #333;
	        width: 500px;
	        height: 60px;
	        display: flex;
	        justify-content: center;  /* 水平方向の中央揃え */
	        align-items: center;  /* 垂直方向の中央揃え */
	        font-size: 16px;
	        background-color: rgba(255, 255, 255, 0.8); /* 背景を半透明に */
	        border-radius: 8px; /* 角を丸く */
	        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); /* 立体感を追加 */
	    }
	    .recycle-grid {
	        display: grid;
	        grid-template-columns: repeat(3, 1fr);
	        gap: 40px;
	    }
	    .recycle-item {
	        text-align: center;
	        margin: 20px 30px 10px;
	    }
	    .recycle-item input[type="image"] {
		    border: 1.5px solid #333;
		    width: 200px;
		    height: 200px;
		}
	</c:param>

	<c:param name="content">
	    <div class="text-border">${trait}</div>
		<div class="main">
	        <div class="main-container">
	        	<form action="SearchResultExecute.action" method="post">
			        <!-- アイコンエリア -->
			        <c:forEach var="recycleMark" items="${recycleMarks}">
				        <div class="recycle-grid">
                			<div class="recycle-item">
				                    <input type="image" name="recycleId" value="${recycleMark.markId}" src="${recycleMark.markImg}" alt="${recycleMark.markName}">
				        	</div>
				        </div>
			        </c:forEach>
		        </form>
	    	</div>
		</div>
	</c:param>

	<c:param name="scripts"></c:param>

</c:import>