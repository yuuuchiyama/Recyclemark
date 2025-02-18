<%-- 検索結果詳細画面JSP --%>
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

	    /* メインコンテンツのスタイル */
	    .main {
	        padding: 20px;
	        text-align: center;
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        margin: 20px auto 0 auto;
	        min-height: 111vh;
	        padding: 20px;
	    }
	    .main-container {
	        background-color: rgba(255, 255, 255, 0.7); /* 半透明の背景色 */
	        padding: 60px 50px 60px 50px;
	        border-radius: 15px;
	        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	        max-width: 900px; /* 任意の幅 */
	        width: 100%;
	        text-align: center;
	    }

	    .icon-and-text {
	        display: flex;
	        align-items: center;
	        gap: 150px;
	        margin-top: 150px;
	        margin-left: 75px;
	        position: relative;
	    }

	    .icon-section p{
	        font-size: 25px;
	        text-align: center;
	        font-weight: bold;
	    }
	    .icon-section img {
	        width: 250px;
	        height: 250px;
	        margin-top: -110px;
	        object-fit: contain;
	        border: 1.5px solid #333;
	    }
	    .explanation-box {
	    	display: flex; /* フレックスボックスを有効化 */
		    align-items: center; /* 縦方向の中央揃え */
		    justify-content: center; /* 横方向の中央揃え */
		    text-align: center; /* テキストの中央揃え */
	        padding: 50px 20px;
	        font-size: 20px;
	        border: 2px solid #333;
	        border-radius: 12px;
	        min-width: 200px;
	        text-align: center;
	        margin: -130px 0 0 0;
	        width: 300px; /* 固定幅 */
		    height: 150px; /* 固定高さ */
		    text-align: center;
		    overflow-y: auto; /* 内容が溢れたらスクロールバーを表示 */
		    margin: -140px 0 0 0;
		    background-color: #fff; /* 背景色（必要に応じて変更） */
	    }

		.explanation-box::-webkit-scrollbar {
		    width: 8px; /* スクロールバーの幅 */
		    border-radius: 8px; /* スクロールバー自体の角を丸く */
		}

		.explanation-box::-webkit-scrollbar-track {
		    background: transparent; /* スクロールバーの背景（透明にすることで目立たなくする） */
		    border-radius: 15px; /* 背景の角を丸く */
		}

		.explanation-box::-webkit-scrollbar-thumb {
		    background: rgba(0, 0, 0, 0.2); /* スクロールバーのつまみ部分の色 */
		    border-radius: 15px; /* つまみ部分の角を丸く */
		}
	    .explanation-section {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        justify-content: center;
	        margin-right: 100px;
	    }

	    .details-link {
	        font-size: 25px;
	        margin-top: 25px;
	    }

	    .menu-link {
	        font-size: 25px;
	        margin: 10px 30px 5px 30px; /* 下のマージンを小さくして間隔を狭める */
	        display: block;
	        text-align: center;
	    }
	    .hart {
	        position: absolute;
	        top: 250px; /* 調整して説明文ボックスの上に配置 */
	        right: 100px; /* 右端に配置 */
	        transform: translate(-50%, -50%); /* 微調整 */
	    }
	    .likeButton {
		    color: #888; /* 初期状態のグレー */
		    font-size: 5em; /* アイコンを大きくする */
		    padding-top: 20px;
		    background-color: transparent;
		    border: none; /* ボーダーをなくす */
		    cursor: pointer;
		    transition: color 150ms ease-in-out, transform 150ms ease-in-out;
		    outline: 0;
	    }
	    .likeButton__icon {
	        display: inline-block;
	        fill: currentColor;
	        width: 1em; /* サイズ調整 */
	        height: 1em;
	    }
	    .liked {
	        color: #e5348c; /* いいね時の色（ピンク） */
	        font-size: 5em; /* アイコンを大きくする */
	    	padding-top: 20px;
	    	background-color: transparent;
	    	border: none; /* ボーダーをなくす */
	    	cursor: pointer;
	    	transition: color 150ms ease-in-out, transform 150ms ease-in-out;
	    	outline: 0;
	    }
    </c:param>

    <c:param name="title">
		    検索結果詳細
	</c:param>
<%-- ↓ これをコメントアウトしないとバグが発生する ↓ --%>

    <c:param name="header">
    	<c:choose>
			<c:when test="${forRanking == 1}">
				<a class="back" href="Ranking.action">＜</a>
			</c:when>
			<c:when test="${forText == 1}">
				<a class="back" href="TextSearchExecute.action">＜</a>
			</c:when>
			<c:when test="${forImage == 1}">
				<a class="back" href="ImageSearch.action">＜</a>
			</c:when>
			<c:when test="${forHistory == 1}">
				<a class="back" href="History.action">＜</a>
			</c:when>
			<c:otherwise>
				<a class="back" href="FavoriteExecute.action">＜</a>
			</c:otherwise>
    	</c:choose>
	</c:param>

	<c:param name="content">
		<!-- メインコンテンツ -->
		<div class="main">
		<input type="hidden" value="${language }" id="language">
		<div class="main-container">
			<!-- 画像と説明文ボックスを横に並べる部分 -->
			<div class="icon-and-text">
				<!-- アイコン -->
				<div class="icon-section">
					<img src="${detail.getMarkImg()}" alt="Recycle Mark Icon">
					<p>${detail.getMarkName()}</p>
				</div>
				<!-- 説明文ボックス -->
				<div class="explanation-section">
					<div class="explanation-box">${detail.markDescribe}</div>
					<!-- 詳細リンク -->
					<a href="Districts.action" class="details-link" id="click_details">地区別詳細はこちら</a>
				</div>
			</div>
			<form action="FavoriteAddExecute.action" method="post">
				<div class="hart">
					<input type="hidden" id="heartStamp" name="heartStamp" value="${heartStamp}">
					<input type="hidden" id="forRanking" name="forRanking" value="${forRanking}">
					<input type="hidden" id="forText" name="forText" value="${forText}">
					<input type="hidden" id="forImage" name="forImage" value="${forImage}">
					<input type="hidden" id="forHistory" name="forHistory" value="${forHistory}">
					<input type="hidden" name="markId" value="${detail.getMarkId()}">
					<input type="hidden" name="markName" value="${detail.getMarkName()}">
					<input type="hidden" name="markImg" value="${detail.getMarkImg()}">
					<input type="hidden" name="markDescribe" value="${detail.getMarkDescribe()}">
					<c:choose>
						<c:when test="${heartStamp == 0}">
							<button type="submit" class="likeButton">
								<svg class="likeButton__icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
									<path d="M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z"/>
								</svg>
							</button>
						</c:when>
						<c:when test="${heartStamp > 0}">
							<button type="submit" class="liked">
								<svg class="likeButton__icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
									<path d="M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z"/>
								</svg>
							</button>
						</c:when>
					</c:choose>
				</div>
			</form>
	    	<!-- 一番下に配置されるメニュー画面へのリンク -->
			<a href="Menu.action" class="menu-link" id="back_menu">メニュー画面に戻る</a>
		</div>
		</div>
	</c:param>
   	<c:param name="script">
    	const menuIcon = document.getElementById('menu-icon');
        const menu = document.getElementById('menu');
        const searchContainer = document.getElementById('search-container');
        var inputValue = document.getElementById('heart_stamp');
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


	    const language = document.getElementById("language").value;
		const click_details = document.getElementById("click_details");
		const back_menu = document.getElementById("back_menu");

		// jsonファイルの読み込み
		fetch("../../JSON/Detailresults.json")
		.then(response => response.json())
		.then(data => {
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			click_details.innerHTML = data[language]["Click_details"];
			back_menu.innerHTML = data[language]["Back_menu"];
			console.log(language);

		})
		.catch(error => {
			// エラー処理
		});

    </c:param>
</c:import>