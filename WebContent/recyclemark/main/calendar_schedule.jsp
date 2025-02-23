<%-- 予定登録画面JSP --%>
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
        display: flex;
        flex-direction: column;
        height: 100vh;
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
    /* 中央のコンテナ */
     .main {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
        min-height: 100vh;
        padding: 20px;
    }
    /* 中央のコンテナ */
    .main-container {
        width: 100%;
        height: 450px;
        max-width: 800px;
        background-color: rgba(255, 255, 255, 0.8); /* 半透明の背景 */
        backdrop-filter: blur(10px); /* 背景のぼかし効果 */
        padding: 20px;
        border: 1px solid rgba(255, 255, 255, 0.6); /* 半透明の境界線 */
        border-radius: 15px; /* 角を丸く */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* 浮いているような影 */
        text-align: center;
        margin: 20px auto; /* 中央揃え */
        transform: translateY(-10px); /* 少し浮いているような位置調整 */
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* ホバー時のアニメーション */
    }
    /* 日付表示とナビゲーション */
    .date-navigation {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }
    .date-button {
        font-size: 40px;
        background: none;
        border: none;
        cursor: pointer;
        color: #3a5c34;
    }
    .date-display {
        font-size: 30px;
        font-weight: bold;
        margin: 0 10px;
        border: 1.5px solid #3a5c34;
        padding: 5px 50px;
        border-radius: 5px;
    }
    /* アイコンリスト */
    .icon-list {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        padding: 10px 0;
        border-bottom: 1px dashed #ddd;
    }
    .icon {
        width: 70px;
        height: 70px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 70%; /* 追加: ボタン自体の形を丸くする */
        border: none; /* 追加: 枠線をなくす */
        padding: 0; /* 追加: パディングをリセット */
    }
    .icon img {
        width: 70px;
        height: 70px;
        border-radius: 70%; /* 画像を丸くする */
    }
    .icon.active img {
        border: 4px solid #3a5c34; /* 青色の丸い枠 */
        border-radius: 70%; /* 丸い形にする */
        padding: 5px; /* 内側に余白を追加 */
        transition: border 0.3s ease; /* スムーズなエフェクト */
    }
    /* メモ入力 */
    .memo {
        width: 90%;
        height: 150px;
        font-size: 20px;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 20px;
        resize: none;
        align-items: center;
    }
    /* 登録ボタン */
    .register-button {
        font-size: 18px;
        padding: 10px 20px;
        background-color: #4E7644;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }
    .register-button:hover {
        background-color: #3a5c34;
    }
    </c:param>


    <c:param name="title">
		カレンダー
	</c:param>

 	<c:param name="header">
		<a class="back" href="CalendarExecute.action">＜</a>
	</c:param>

<c:param name="content">
	<form action="ScheduleExecute.action" method="get">
		<div class="main">
			<!-- メインコンテンツ -->
			<div class="main-container">
		    	<!-- 日付ナビゲーション -->
			    <div class="date-navigation">
			    	<input type="hidden" id="day" name="date" value='${date}'>
			        <div class="date-display" id="date-display"><%=request.getAttribute("date") %></div>
			    </div>

		    	<!-- アイコンリスト
		    	マークのパスをどう渡すか -->
		    	<div>${errors.get("icon_error")}</div>
				<div class="icon-list">
		    		<button type="button" class="icon" onclick="toggleIcon(this)" value="1">
		        		<img src="../../images/燃えるゴミ.gif" alt="可燃ごみ">
		    		</button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="2">
				        <img src="../../images/燃えないゴミ.gif" alt="不燃ごみ">
				    </button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="3">
				        <img src="../../images/プラスチック.gif" alt="プラスチック">
				    </button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="4">
				        <img src="../../images/粗大ごみ.jpg" alt="粗大ごみ">
				    </button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="5">
				        <img src="../../images/ビン.jpg" alt="瓶">
				    </button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="6">
				        <img src="../../images/can.png" alt="缶">
				    </button>
				    <button type="button" class="icon" onclick="toggleIcon(this)" value="7">
				        <img src="../../images/取り消し.jpg" alt="取り消し">
				    </button>
				</div>

				<input type="hidden" id="select" name="icon" value="${stampId}">

			    <!-- メモ入力 -->
			    <textarea class="memo" name="memo" placeholder="memo">${memo}</textarea>

				<input type="hidden" value="${language }" id="language" />

				<c:choose>
	    			<c:when test="${have == '0'}">
	    				<input id="schedule" type="hidden" name="schedule" value="0">
				        <!-- 登録ボタン -->
					    <button id="button" class="register-button">登録</button>
				    </c:when>
				    <c:when test="${have == '1'}">
				    	<input id="schedule" type="hidden" name="schedule" value="1">
				        <!-- 登録ボタン -->
					    <button id="button" class="register-button">変更</button>
				    </c:when>
				</c:choose>
			</div>
		</div>
	</form>
</c:param>
	<c:param name="script">
		const menuIcon = document.getElementById('menu-icon');
	    const menu = document.getElementById('menu');
	    // Toggle menu display
	    menuIcon.addEventListener('click', function() {
	        menu.style.display = menu.style.display === 'flex' ? 'none' : 'flex';
	    });
	    // Toggle submenu display
	    function toggleSubMenu(submenuId) {
	        const submenu = document.getElementById(submenuId);
	        submenu.style.display = submenu.style.display === 'flex' ? 'none' : 'flex';
	    }


	    // 日付のナビゲーション用の変数
	    let currentDate = new Date(); // 現在の日付を取得

	    function updateDateDisplay() {
	        const dateDisplay = document.getElementById('date-display');
	        dateDisplay.textContent = ${date};
	    }

		// 予定情報がある場合のアイコンの処理
		function selectIcon() {
	    	let selButtons = document.getElementsByClassName("icon");
	    	console.log(selButtons);
	    	for (var selButton of selButtons) {
	    		if (<%=request.getAttribute("stampId") %> == selButton.value) {
	    			console.log(<%=request.getAttribute("stampId") %>);
	    			selButton.classList.add("active");
	    		}
	    	}
		}


		// ページ読み込み時
		window.onload = selectIcon;

	    // 初期表示の更新
	    updateDateDisplay();


	    function toggleIcon(element) {
	        // クリックされたアイコンが既にアクティブかどうかをチェック
	        if (element.classList.contains('active')) {
	            // アクティブなら、クラスを外して枠を消す
	            element.classList.remove('active');
	        } else {
	            // 他のアイコンからアクティブなクラスを外す
	            document.querySelectorAll('.icon').forEach(icon => icon.classList.remove('active'));

	            // クリックしたアイコンにアクティブなクラスを付与
	            element.classList.add('active');
	            const setValue = document.getElementsByClassName("active")[0];
	            let select = document.getElementById("select");
	            console.log(setValue.value);
	            console.log(select.value);
	            select.value = setValue.value;
	            console.log(select.value);
	        }
	    }

	    const language = document.getElementById("language").value;
	    const schedule = document.getElementById("schedule").value;
	    const button = document.getElementById("button");

	    // jsonファイルの読み込み
		fetch("../../JSON/calendarRegister.json")
		  .then(response => response.json())
		  .then(data => {
		  	// レスポンスを処理するコード
		  	// dataにはjsonファイルの中身が格納されている
		  	if (schedule == "0") {
		  		button.innerHTML = data[language]["Register"];
		  	}else {
		  		button.innerHTML = data[language]["Change"];
		  	}
		  })
		  .catch(error => {
		    // エラー処理
		  });
    </c:param>
</c:import>