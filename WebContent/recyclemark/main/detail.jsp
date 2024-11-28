<%-- 検索結果詳細画面JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
     <c:param name="style">


      body {
        font-family: Arial, sans-serif;
        height: 100%; /* 全体の高さを100%に設定 */
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }
/* ヘッダーのスタイル */
       .header {
           display: flex;
           background-color: #ddd;
           padding: 15px 20px;
           justify-content: space-between; /* Title and icon space */
           align-items: center; /* Align items vertically */
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
           justify-content: center; /* Center the icon vertically */
           align-items: center; /* Center the icon horizontally */
           z-index: 1002; /* Menuの上に表示するため */
       }
       .menu-icon div {
           width: 25px;
           height: 3px;
           background-color: #333;
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
       .menu-item:hover,
       .submenu a:hover {
           background-color: #f0f0f0;
       }
        /* 戻るリンクのスタイル */
        .back {
        text-decoration: underline;
        margin: 10px 20px; /* 左に寄せるため左マージンを設定 */
        font-size: 30px;
        text-align: left; /* 左揃えに設定 */
        display: inline-block; /* 幅いっぱいを占めず、左寄せ */
        }
        .back:hover {
            text-decoration: underline;
        }

    /* メインコンテンツのスタイル */
    .main {
        padding: 20px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: calc(100vh - 150px);
    }
    .icon-and-text {
        display: flex;
        align-items: center;
        gap: 200px;
        margin-bottom: 20px;
    }
    .icon-section p{
        font-size: 30px;
    }
    .icon-section img {
        width: 250px;
        height: 250px;
    }
    .explanation-box {
        padding: 90px 120px;
        font-size: 24px;
        border: 2px solid #333;
        border-radius: 15px;
        min-width: 200px;
        text-align: center;
    }
    .explanation-section {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .details-link {
        font-size: 30px;
        text-decoration: underline;
        color: #333;
        margin-top: 30px;
    }

    .menu-link {
        font-size: 30px;
        text-decoration: underline;
        color: #000;
        margin-bottom: 20px;
        text-align: center;
        position: relative;
        display: inline-block;
    }
    .hart {
        position: absolute;
        top: 140px; /* 調整して説明文ボックスの上に配置 */
        right: 0; /* 右端に配置 */
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


	<c:param name="content">
		<!-- メインコンテンツ -->
		<div class="main">
			<!-- 画像と説明文ボックスを横に並べる部分 -->
			<div class="icon-and-text">
				<!-- アイコン -->
				<div class="icon-section">
					<img src="${detail.markImg}" alt="Recycle Mark Icon">
					<p>${detail.markName}</p>
				</div>
				<!-- 説明文ボックス -->
				<div class="explanation-section">
					<div class="explanation-box">${detail.markDescribe}</div>
					<!-- 詳細リンク -->
					<a href="Districts.action" class="details-link">詳細はこちら</a>
				</div>
			</div>
			<form action="FavoriteAddExecute.action" method="post">
				<div class="hart">
					<input type="hidden" id="heartStamp" name="heartStamp" value="${heartStamp}">
					<input type="hidden" name="markId" value="${detail.markId}">
					<input type="hidden" name="markName" value="${detail.markName}">
					<input type="hidden" name="markImg" value="${detail.markImg}">
					<input type="hidden" name="markDescribe" value="${detail.markDescribe}">
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
			<a href="Menu.action" class="menu-link">メニュー画面に戻る</a>
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

    </c:param>
</c:import>