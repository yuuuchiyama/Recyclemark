<%-- 検索履歴JSP --%>
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
		    margin: 20px 0 0 0;
		    min-height: 100vh;
		    padding: 20px 0 20px 0;
	    }
	    .main-container {
		    background-color: rgba(255, 255, 255, 0.7); /* 半透明の背景色 */
		    padding: 30px 50px;
		    border-radius: 15px;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
		    max-width: 800px; /* 任意の幅 */
		    width: 100%;
		    text-align: center;
	    }

       .history{
	        display: flex; /* 横並びに配置 */
	        align-items: center;
	        margin-bottom: 15px; /* 項目間の余白 */
	        gap: 40px;
	    }
	    .history_dot {
	        font-size: 30px;
	        margin: 20px 50px 20px 0;
	    }
	    .mark-img {
	        width: 150px;
		    height: 150px;
	        margin-right: 150px;
	    }
	    a {
	        font-size: 30px;
	    }
        </c:param>

        <c:param name="title">
		    RecycleMark
	  </c:param>

		<c:param name="header">
				<a class="back" href="mypage.jsp">＜</a>
			</c:param>


	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<div class="main">
    		<div class="main-container">
    			<c:choose>
    				<c:when test="${empty recyclemarks}">
	    				<input type="hidden" value="${language }" id="language">
						<div id="null_history">検索履歴はありません</div>
					</c:when>
    			</c:choose>
				<div class="history">
			    	<table>
			    		<!-- 繰り返し文で表示  ~start~ -->
			    		<c:forEach var="recyclemark" items="${recyclemarks }">
				        <tr>
				        	<td><span class="history_dot" >・</span> <!-- カスタムの「・」 --></td>
				        	<td> <input type="image" src="${recyclemark.getMarkImg() }" class="mark-img"></td>
							<td>
								<a href="SearchResultExecute.action?markId=${recyclemark.getMarkId() }&forhistory=1" class="mark-link">
									${recyclemark.getMarkName() }
								</a>
							</td>
						</tr>
						</c:forEach>
			    	<!-- 繰り返し文で表示  ~end~ -->
					</table>
				</div>
			</div>
		</div>
	</c:param>
	<c:param name="script">
		const menuIcon = document.getElementById('menu-icon');
	    const menu = document.getElementById('menu');
	    const searchContainer = document.getElementById('search-container');
	    // Toggle menu display
	    menuIcon.addEventListener('click', function() {
	        if (menu.style.display === 'flex') {
	            menu.style.display = 'none';
	            searchContainer.style.display = 'flex'; // Show search container
	        } else {            menu.style.display = 'flex';
	                searchContainer.style.display = 'none'; // Hide search container
	        }
	    });
	    // Toggle submenu display
	    function toggleSubMenu(submenuId) {
	        const submenu = document.getElementById(submenuId);
	        submenu.style.display = submenu.style.display === 'flex' ? 'none' : 'flex';
	    }

	    const language = document.getElementById("language").value;
		const null_history = document.getElementById("null_history");

		// jsonファイルの読み込み
		fetch("../../JSON/history.json")
		.then(response => response.json())
		.then(data => {
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			null_history.innerHTML = data[language]["null_history"];
			console.log(language);

		})
		.catch(error => {
			// エラー処理
		});

	</c:param>
</c:import>
