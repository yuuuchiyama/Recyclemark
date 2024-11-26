<%-- 23区詳細画面JSP --%>
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
            background-color: #f9f9f9;
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
		    margin-top: 20px;
		    min-height: 100vh;
		    padding: 20px;
		}
        h1 {
            font-size: 30px;
            margin-bottom: 20px;
            text-align: center; /* 中央揃え */
        }
        li{
            font-size: 20px;

        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #ddd;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
	</c:param>

	<c:param name="content">
	    <h1>東京都　23区</h1>
	    <li><a href="https://www.union.tokyo23-seisou.lg.jp/joho/index.html">23区のホームページ一覧</a></li>

	    <table>
	        <thead>
	            <tr>
	                <th>区名</th>
	                <th>PDF</th>
	                <th>区のHP</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>千代田区</td>
	                <td><a href="https://www.city.chiyoda.lg.jp/documents/1952/wakekataposter-jp_1.pdf">日本語</a></td>
	                <td><a href="https://www.city.chiyoda.lg.jp/koho/kurashi/gomi/index.html">千代田区HP</a></td>
	            </tr>
	            <tr>
	                <td>中央区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.chuo.lg.jp/kurashi/gomi/index.html">中央区HP</a></td>
	            </tr>
	            <tr>
	                <td>港区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.minato.tokyo.jp/kurashi/gomi/index.html">港区HP</a></td>
	            </tr>
	            <tr>
	                <td>新宿区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.shinjuku.lg.jp/seikatsu/index09.html">新宿区HP</a></td>
	            </tr>
	            <tr>
	                <td>文京区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.bunkyo.lg.jp/tetsuzuki/gomi/index.html">文京区HP</a></td>
	            </tr>
	            <tr>
	                <td>台東区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.taito.lg.jp/kurashi/gomi/index.html">台東区HP</a></td>
	            </tr>
	            <tr>
	                <td>墨田区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.sumida.lg.jp/kurashi/gomi_recycle/index.html">墨田区HP</a></td>
	            </tr>
	            <tr>
	                <td>江東区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.koto.lg.jp/kurashi/gomi/index.html">江東区HP</a></td>
	            </tr>
	            <tr>
	                <td>品川区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.shinagawa.tokyo.jp/PC/kankyo/kankyo-gomi/index.html">品川区HP</a></td>
	            </tr>
	            <tr>
	                <td>目黒区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.meguro.tokyo.jp/kurashi/gomi/index.html">目黒区HP</a></td>
	            </tr>
	            <tr>
	                <td>大田区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.ota.tokyo.jp/seikatsu/gomi/index.html">大田区HP</a></td>
	            </tr>
	            <tr>
	                <td>世田谷区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.setagaya.lg.jp/kurashi/gomi/11535.html">世田谷区HP</a></td>
	            </tr>
	            <tr>
	                <td>渋谷区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.shibuya.tokyo.jp/kurashi/gomi/kateigomi/">渋谷区HP</a></td>
	            </tr>
	            <tr>
	                <td>中野区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.tokyo-nakano.lg.jp/kurashi/gomi/index.html">中野区HP</a></td>
	            </tr>
	            <tr>
	                <td>杉並区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.suginami.tokyo.jp/guide/gomi/index.html">杉並区HP</a></td>
	            </tr>
	            <tr>
	                <td>豊島区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.toshima.lg.jp/kurashi/gomi/index.html">豊島区HP</a></td>
	            </tr>
	            <tr>
	                <td>北区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.kita.tokyo.jp/kurashi/gomi/index.html">北区HP</a></td>
	            </tr>
	            <tr>
	                <td>荒川区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.arakawa.tokyo.jp/recycle/index.html">荒川区HP</a></td>
	            </tr>
	            <tr>
	                <td>板橋区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.itabashi.tokyo.jp/tetsuduki/gomi/index.html">板橋区HP</a></td>
	            </tr>
	            <tr>
	                <td>練馬区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.nerima.tokyo.jp/kurashi/gomi/index.html">練馬区HP</a></td>
	            </tr>
	            <tr>
	                <td>足立区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.adachi.tokyo.jp/kurashi/kankyo/gomi/index.html">足立区HP</a></td>
	            </tr>
	            <tr>
	                <td>葛飾区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.katsushika.lg.jp/kurashi/1000048/index.html">葛飾区HP</a></td>
	            </tr>
	            <tr>
	                <td>江戸川区</td>
	                <td><a href="URL">日本語</a></td>
	                <td><a href="https://www.city.edogawa.tokyo.jp/kurashi/gomi_recycle/index.html">江戸川区HP</a></td>
	            </tr>
	        </tbody>
	    </table>
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
