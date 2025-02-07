<%-- メニューJSP --%>
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
	        overflow: hidden; /* スクロールバーを非表示にする */
	    }
	    /* ヘッダーのスタイル */
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

	    /* メインコンテンツ部分のスタイル */
		.main {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    min-height: 100vh;
		    padding: 20px;
		    margin-top: 50px;
			}
		.button-container {
		    display: grid;
		    grid-template-columns: repeat(2, 1fr); /* 2列のグリッド */
		    gap: 40px 60px;
		    max-width: 800px; /* 最大幅を指定 */
		    margin: 70px auto;
		    justify-items: center; /* ボタンを中央揃え */
		}

		/* ボタンのスタイル */
		.button-container button {
		       display: inline-flex;
			   align-items: center; /* ボタン内のテキストを垂直方向でセンタリング */
			   justify-content: center; /* 水平方向でセンタリング */
			   min-width: 350px; /* 最小幅を設定、必要に応じて調整 */
			   padding: 35px 95px;/* 左右の余白と上下の余白 */
			   font-size: 22px;
			   font-weight: bold;
			   color: #f0f0f0;
			   border: 4px solid rgba(78, 118, 68);
			   border-radius: 12px;
			   background-color: rgba(78, 118, 68, 0.8);
			   cursor: pointer;
			   text-align: center;
			   box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* 影を追加 */
        	   transition: all 0.3s ease; /* スムーズなアニメーション */
		}

	    .action-button {
	        display: inline-block;
	        padding: 15px 30px;
	        font-size: 16px;
	        font-weight: bold;
	        color: #f0f0f0;
	        background-color: rgba(78, 118, 68, 0.6);
	        border: 4px solid rgba(78, 118, 68, 0.6);
	        border-radius: 8px;
	        cursor: pointer;
	        text-align: center;
	        transition: background-color 0.3s, color 0.3s;
	    }

	    .button-container button:hover {
	        background-color: rgba(58, 92, 52, 0.8);
	        color: #fff;
	        transform: scale(1.1); /* ボタンが少し大きくなる */
	        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.4); /* 影を強調 */
	    }
	</c:param>
	<c:param name="title">
		メニュー
	</c:param>
	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<div class="main">
			<p>${language }</p>
			<input type="hidden" value="${language }" id="language" />
		   <div class="button-container">
			    <form action="TextSearch.action" method="post">
			        <button type="submit" class="action-button" id="text_search">テキスト検索</button>
			    </form>
			    <form action="ImageSearch.action" method="post">
			        <button type="submit" class="action-button" id="pic_search">画像検索</button>
			    </form>
			    <form action="Ranking.action" method="post">
			        <button type="submit" class="action-button" id="ranking">ランキング</button>
			    </form>
			    <form action="LanguageSelection.action" method="post">
			        <button type="submit" class="action-button" id="back_select">言語再選択</button>
			    </form>
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
		const text_search = document.getElementById("text_search");
		const pic_search = document.getElementById("pic_search");
		const ranking = document.getElementById("ranking");
		const back_select = document.getElementById("back_select");

		// jsonファイルの読み込み
		fetch("../../JSON/nemu.json")
		.then(response => response.json())
		.then(data => {
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			text_search.innerHTML = data[language]["text_search"]
			pic_search.innerHTML = data[language]["pic_search"]
			ranking.innerHTML = data[language]["ranking"]
			back_select.innerHTML = data[language]["back_select"]
		})
		.catch(error => {
			// エラー処理
		});

	</c:param>

</c:import>