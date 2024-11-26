<%-- お気に入り一覧JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="style">
		/* ヘッダーのスタイル */
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
		    margin: 10px 20px;
		    font-size: 30px;
		    text-align: left;
		    display: inline-block;
		}
		.back:hover {
		    text-decoration: underline;
		}

		.container {
		    text-align: center;
		}

		.recycle-grid {
		    display: grid;
		    grid-template-columns: repeat(3, 1fr);
		    gap: 20px;
		}

		.recycle-item {
		    text-align: center;
		}

		.recycle-item img {
		    width: 150px;
		    height: auto;
		}

		.recycle-item p {
		    margin-top: 10px;
		    font-size: 20px;
		}
	</c:param>
	<c:param name="title">
		お気に入り一覧
	</c:param>



	<c:param name="content">
		<div class="main">
			<!-- リサイクルマーク一覧テーブル -->
			<div class="container">
				<div class="recycle-grid">
					<div>${errors.get("favorite_error")}</div>
					<c:forEach var="favorite" items="${favorites}">
						<div class="recycle-item">
							<img src="${favorite.markImg}" alt="${favorite.markName}">
							<p>"${favorite.markName}"</p>
						</div>
					</c:forEach>
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

	</c:param>
</c:import>