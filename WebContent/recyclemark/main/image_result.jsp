<%-- 画像検索結果JSP --%>
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
    /* Main content styling */
    .main {
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: calc(100vh - 150px);
        margin-top: -30px;
    }

    .icon-and-text {
        display: flex;
        align-items: center;
        gap: 200px;
    }
    .icon-section h1 {
        font-size: 30px;
        margin-top: 0;
        padding: 0 10px;
        border: none;
        border-radius: 5px;
        color: #4E7644;
        background-color: rgba(255, 255, 255, 0.8);
    }
    .icon-section img {
        width: 300px;
        height: 300px;
    }
    .explanation-box {
        width: 300px;
        height: 300px;
        font-size: 20px;
        border: 2px solid #333;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 115px;
    }

    .details-link {
        font-size: 30px;
        text-decoration: underline;
        color: #333;
        margin-top: 10px;
        display: inline-block;
    }
    </c:param>


    <c:param name="title">
		    RecycleMark
	  </c:param>


	<c:param name="content">
	 <!-- Main content -->
    <div class="main">
     <form action="ImageSearchExecute.action" method="post">
        <div class="icon-and-text">
            <!-- Icon Section -->
            <div class="icon-section">
                <h1>検索結果</h1>
                <img src="image/プラスチック.gif" alt="Recycle Mark Icon">
            </div>
            <!-- Uploaded Image Section -->
            <div class="explanation-section">
                <div class="explanation-box">
                    <img src="#" alt="アップロードした画像">
                </div>
                <a href="#" class="details-link">詳細はこちら</a>
            </div>
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







