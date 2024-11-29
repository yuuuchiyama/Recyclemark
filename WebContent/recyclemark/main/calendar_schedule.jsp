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
        background-color: #ddd;
        padding: 15px 20px;
        display: flex;
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
        height: calc(100vh - 110px);
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
    /* 中央のコンテナ */
    .container {
        width: 100%;
        height: 100%;
        max-width: 600px;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin: 20px auto; /* 上下20pxの余白と左右の自動均等配置 */
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
    }
    .date-display {
        font-size: 30px;
        font-weight: bold;
        margin: 0 10px;
        border: 1px solid #333;
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
        border: 3px solid #007BFF; /* 青色の丸い枠 */
        border-radius: 70%; /* 丸い形にする */
        padding: 5px; /* 内側に余白を追加 */
        transition: border 0.3s ease; /* スムーズなエフェクト */
    }
    /* メモ入力 */
    .memo {
        width: 90%;
        height: 100px;
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
        background-color: #000;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .register-button:hover {
        background-color: #555;
    }
    </c:param>


    <c:param name="title">
		カレンダー
	</c:param>

<c:param name="content">
	<!-- メインコンテンツ -->
	<div class="container">
    	<!-- 日付ナビゲーション -->
	    <div class="date-navigation">
	        <button class="date-button" onclick="prevDate()">&#x3C;</button>
	        <div class="date-display" id="date-display"></div>
	        <button class="date-button" onclick="nextDate()">&#x3E;</button>
	    </div>

    	<!-- アイコンリスト -->
		<div class="icon-list">
    		<button class="icon" onclick="toggleIcon(this)">
        		<img src="../../images/燃えるゴミ.gif" alt="可燃ごみ">
    		</button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/燃えないゴミ.gif" alt="不燃ごみ">
    </button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/プラスチック.gif" alt="プラスチック">
    </button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/粗大ごみ.jpg" alt="粗大ごみ">
    </button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/ビン.jpg" alt="瓶">
    </button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/can.png" alt="缶">
    </button>
    <button class="icon" onclick="toggleIcon(this)">
        <img src="../../images/取り消し.jpg" alt="取り消し">
    </button>

</div>


    <!-- メモ入力 -->
    <textarea class="memo" placeholder="memo"></textarea>

    <!-- 登録ボタン -->
    <button class="register-button">登録</button>
</div>
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
        dateDisplay.textContent = `${currentDate.getFullYear()}/${currentDate.getMonth() + 1}/${currentDate.getDate()}`;
    }

    function prevDate() {
        currentDate.setDate(currentDate.getDate() - 1);
        updateDateDisplay();
    }

    function nextDate() {
        currentDate.setDate(currentDate.getDate() + 1);
        updateDateDisplay();
    }

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
        }
    }
    </c:param>

</c:import>