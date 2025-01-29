<%-- ユーザー削除JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="style">
		/* 基本スタイル */
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

/* ユーザー情報ボックス */
	.user-info {
	    padding: 50px;
	    width: 600px;
	    margin: 20px auto;
	    display: flex;
	    flex-direction: column; /* 各項目を縦並びに */
	    align-items: flex-start;
	    background-color: rgba(255, 255, 255, 0.7);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    border-radius: 20px;
	    gap: 15px; /* 各項目間の間隔 */
	}



	/* 各項目のスタイル */
	.user-info p {
	    margin: 0;
	    font-size: 25px;
	    text-align: left;
	    font-weight: bold;
	    line-height: 1.8;
	}


	/* パスワード行を横並びに */
	.user-info .password-row {
	    display: flex;
	    flex-direction: row; /* 横並び */
	    align-items: center; /* 縦方向の中央揃え */
	    gap: 10px; /* ラベルと入力フォームの間隔 */
	    width: 100%; /* 全体幅に揃える */
	}

	/* ラベルと入力フォーム */
	.user-info label {
	    font-size: 25px;
	    font-weight: bold;
	    white-space: nowrap; /* ラベルの改行を防ぐ */
	}

	.user-info input[type="text"] {
	    font-size: 16px;
	    padding: 5px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    flex-grow: 1; /* 入力フィールドを横幅いっぱいに広げる */
	    box-sizing: border-box; /* パディング込みでサイズ計算 */
	}

	/* 削除ボタン */
	.delete-button {
	    padding: 10px 20px;
	    font-size: 16px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #3a5c34;
	    border: none;
	    border-radius: 8px;
	    cursor: pointer;
	    align-self: center; /* ボタンを中央に配置 */
	    transition: background-color 0.3s;
	    margin-top: 20px; /* 上部に間隔を追加 */
	}

	.delete-button:hover {
	    background-color: #2e572a;
	}

	</c:param>
	<c:param name="title">
		ユーザー削除
	</c:param>

    <c:param name="header">
		<a class="back" href="edit.jsp">＜</a>
	</c:param>
	<c:param name="content">
		<div class="main">
			<form action="UserDeleteExecute.action" method="post">
				<div class="user-info">
					<p>User Id : ${user.getId() }</p>   <!-- (仮) -->
					<p>MailAddress : ${user.getMailAddress() }</p>
					<div class="password-row">
						<label for="password">password:</label>
        				<input type="password" id="password" name="password" required>
        			</div>
        			<c:if test="${error != null}">
						<div class="form-group">
							<h3>${error }</h3>
				        </div>
					</c:if>
					<button class="delete-button">削除</button>
				</div>
			</form>
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
	</c:param>
</c:import>