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
	        background-position: center;
	        background-attachment: fixed;
	        color: #333;
		}
		/* ヘッダーのスタイル */
		.header {
		    display: flex;
		    background-color: #ddd;
		    padding: 15px 20px;
		    justify-content: space-between;
		    align-items: center;
		    box-shadow: 0px 4px 2px -2px gray;
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
		    background-color: #333;
		    border-radius: 2px;
		}
		/* メニュー */
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
		.menu-item:hover,
		.submenu a:hover {
		    background-color: #f0f0f0;
		}
		/* 戻るリンク */
		.back {
		    text-decoration: underline;
		    font-size: 30px;
		    margin: 10px 0; /* 上下のマージン調整 */
		}
		/* コンテンツエリア */
		.content {
		    display: flex;
		    flex-direction: column;
		}
		/* テキストボックス */
		.text-border {
		    border: 2px solid #333;
		    width: 500px;
		    height: 60px;
		    display: flex;
		    justify-content: center;  /* 水平方向の中央揃え */
		    align-items: center;  /* 垂直方向の中央揃え */
		    font-size: 16px;
		    margin-left: auto;
		    margin-right: 0;
		    margin-bottom: 20px;
		    margin-right: 20px;
		}
		/* アイコンエリア */
	    .icons-container {
	        display: flex;
	        justify-content: left;
	        margin-top: 20px; /* 画像間のスペース調整 */
	    }
	    table {
	        border-collapse: collapse; /* セルの境界線を結合 */
	    }
	    td {
	        padding: 100px; /* セル内の間隔 */
	    }
	    img {
	        border: 2px solid #333;
	        width: 200px; /* 適宜サイズを調整 */
	    }
	</c:param>
	<c:param name="title">
		テキスト検索結果
	</c:param>

	<c:param name="scripts"></c:param>

	<div class="main">
		<div class="content">
        	<div class="text-border">入力内容を表示</div>

	        <!-- アイコンエリア -->
	        <c:forEach var="recycleMark" items="${recycleMarks}">
	        <div class="icons-container">
	            <table>
	                <tr>
	                    <td><img src="${recycleMark.markImg}" alt="${recycleMark.markName}"></td>
	                </tr>
	            </table>
	        </div>
	        </c:forEach>
    	</div>
	</div>
</c:import>