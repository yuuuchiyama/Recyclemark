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
        background-position: center top;
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
		テキスト検索
	</c:param>

	<c:param name="header">
		<a class="back" href="menu.jsp">＜</a>
	</c:param>

	<c:param name="content">
		<form action="TextSearchExecute.action" method="post">
			<!-- メインコンテンツ部分 -->
			<!-- Search container -->
	 		<div class="main">
	 		<input type="hidden" value="${language }" id="language">
				<div class="search-container" id="search-container">
					<h1 id="text_search">テキスト検索</h1>
					<p id="message">リサイクルマークについて入力してください。</p>
					<div>${errors.get("mark_error")}</div>
					<c:choose>
					  <c:when test="${language == '日本語'}">
					    <input type="text" id="search-input" class="search-input" name="trait" placeholder="検索キーワードを入力" required oninvalid="this.setCustomValidity('リサイクルマークについて入力してください')">
					  </c:when>
					  <c:when test="${language == 'English'}">
					    <input type="text" id="search-input" class="search-input" name="trait" placeholder="Enter search keywords" required oninvalid="this.setCustomValidity('Enter about the recycling mark')">
					  </c:when>
					  <c:when test="${language == '한국어'}">
					    <input type="text" id="search-input" class="search-input" name="trait" placeholder="검색 키워드를 입력하세요" required oninvalid="this.setCustomValidity('재활용 마크에 대해 입력해 주세요')">
					  </c:when>
					  <c:when test="${language == '中文'}">
					    <input type="text" id="search-input" class="search-input" name="trait" placeholder="输入搜索关键词" required oninvalid="this.setCustomValidity('进入有关回收标志的页面')">
					  </c:when>
					  <c:otherwise>
					    <input type="text" id="search-input" class="search-input" name="trait" placeholder="検索キーワードを入力" required oninvalid="this.setCustomValidity('リサイクルマークについて入力してください')">
					  </c:otherwise>
					</c:choose>
					<button type="submit" class="search-button" id="TextSearch_button">検索</button>
				</div>
			</div>
		</form>
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

		const searchInput = document.getElementById('search-input');

		searchInput.addEventListener('input', function() {
			if (!searchInput.validity.valueMissing) {
				searchInput.setCustomValidity('');
			}
		});

		const language = document.getElementById("language").value;
		const text_search = document.getElementById("text_search");
		const massage = document.getElementById("message");
		const search_input = document.getElementById("input");
		const textSearch_button = document.getElementById("TextSearch_button");

		// jsonファイルの読み込み
		fetch("../../JSON/Text_S.json")
		.then(response => response.json())
		.then(data => {
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			text_search.innerHTML = data[language]["text_search"];
			massage.innerHTML = data[language]["message"];
			textSearch_button.innerHTML = data[language]["TextSearch_button"];
			console.log(language);

		})
		.catch(error => {
			// エラー処理
		});
	</c:param>
</c:import>