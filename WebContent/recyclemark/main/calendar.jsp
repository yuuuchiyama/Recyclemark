<%-- カレンダー画面JSP --%>
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
	    .main-container {
	        padding: 30px 50px;
	        max-width: 900px; /* 任意の幅 */
	        width: 100%;
	        text-align: center;
	    }

	    /* カレンダーのコンテナ */
	    .calendar-container {
	        width: 100%;
	        background-color: rgba(255, 255, 255, 0.7);
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	        text-align: center; /* カレンダー全体の中央揃え */
	        align-items: center;
	        text-align: center;
	    }
	    .calendar {
	        width: 100%;
	        border-collapse: collapse;
	        margin: 0 auto;
	        border: 2.5px solid #000;
	    }

	    .calendar th, .calendar td {
	        border: 1px solid #000;
	        width: 14.28%;
	        height: 50px;
	        text-align: center;
	    }
	    .month_day th {
	        background-color: rgba(58, 92, 52, 0.7);
	        border: 2px solid #000;
	    }
	    .month_day button{
	        background-color: rgba(255, 255, 255, 0.8);
	        border: none;
	    }

	    .week th {
	        background-color: rgba(78, 118, 68,0.6);
	        border: 1px solid #000;
	    }

	    .calendar td {
	        padding: 0; /* セルの余白をなくす */
	        height: 110px; /* 任意の高さに設定 */
	        width: 100px; /* 同じ幅に設定 */
	        vertical-align: top; /* 上に揃える */
    		text-align: center; /* 横方向は中央揃えのまま */
    		 background-color: rgba(255, 255, 255, 0.5);
	    }

		.calendar img{
			hight:50px;
			width:60px;
		}

		.calendar td form{
	        width: 100%; /* 親要素に対して全幅 */
	        height: 100%; /* 親要素に対して全高 */
	        border: none;
	        font-size: 1.5em;
	        cursor: pointer;
	        background-color: rgba(255, 255, 255, 0.5);
	    }

	    .calendar td button {
	    	margin-top: -28.6px;
		    width: 100%; /* 親要素に対して全幅 */
	        height: 101.5%; /* 親要素に対して全高 */
	        border: none;
	        font-size: 1em;
	        cursor: pointer;
	        background-color: rgba(255, 255, 255, 0);
	    }

	    .calendar td:empty {
	        background-color: rgba(255, 255, 255); /* 空のセルに背景色を設定 */
	    }
	    .calendar td button:hover {
	        background-color: rgba(58, 92, 52, 0.6);
	    }
    </c:param>

    <c:param name="title">
		カレンダー
	</c:param>

	<c:param name="header">
		<a class="back" href="mypage.jsp">＜</a>
	</c:param>

	<c:param name="content">
		<!-- メインコンテンツ -->
		<div class="main">
		<!-- カレンダー部分 -->
		    <div class="main-container">
		        <div class="calender-container">
		            <table class="calendar">
		                <thead>
		                    <tr class="month_day">
		                        <th colspan="7">
		                            <button onclick="prevMonth()" style="font-size: 30px;">&#x3C;</button>
		                            <span id="month-year" style="font-size: 30px; font-weight: bold;"></span>
		                            <button onclick="nextMonth()" style="font-size: 30px;">&#x3E;</button>
		                        </th>
		                    </tr>
		                    <tr class="week">
		                        <th>日</th>
		                        <th>月</th>
		                        <th>火</th>
		                        <th>水</th>
		                        <th>木</th>
		                        <th>金</th>
		                        <th>土</th>
		                    </tr>
		                </thead>
		                <tbody id="calendar-body" class="calendar-body">
		                    <!-- JavaScriptで日付を挿入 -->
		                </tbody>
		            </table>
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

	    function generateCalendar(year, month) {
	        const calendarBody = document.getElementById('calendar-body');
	        const monthYear = document.getElementById('month-year');
	        calendarBody.innerHTML = ''; // 既存のカレンダーをクリア
	        monthYear.textContent = year + "/" + month;

	        const firstDay = new Date(year, month, 1).getDay();
	        const daysInMonth = new Date(year, month, 0).getDate();

	        let date = 1;
	        for (let i = 0; i < 6; i++) { // 最大6行
	            const row = document.createElement('tr');

	            for (let j = 0; j < 7; j++) {
	                const cell = document.createElement('td');
	                const form = document.createElement('form');
	                const button = document.createElement('button');
	                const input = document.createElement('input');
	                const inputYear = document.createElement('input');
	                const inputMonth = document.createElement('input');
	                const inputDay = document.createElement('input');
	                const inputSche = document.createElement('input');

	                if (i === 0 && j < firstDay) {
	                    // 空のセルにもボタンを追加
	                    button.style.visibility = 'hidden'; // 表示されないようにする
	                    cell.appendChild(button);
	                } else if (date > daysInMonth) {
	                    button.style.visibility = 'hidden'; // 表示されないようにする
	                    cell.appendChild(button);
	                } else {
	                	button.setAttribute("type", "submit");
	                	// ゼロ埋め
	                	console.log(month.toString().padStart(2, '0'));
	                	month = month.toString().padStart(2, '0');
	                	const zeroDate = date.toString().padStart(2, '0');

	                	const nowday = year + "-" + month + "-" + date;
	                	const zeroNowDay = year + "-" + month + "-" + zeroDate;

	                    form.textContent = date;
	                    form.action = 'Schedule.action';
	                    form.method = 'get';

	                    input.setAttribute("type", "hidden");
	                    input.setAttribute("name", "date");
	                    input.setAttribute("value", nowday);

	                    inputYear.setAttribute("type", "hidden");
	                    inputYear.setAttribute("name", "year");
	                    inputYear.setAttribute("value", year);

	                    inputMonth.setAttribute("type", "hidden");
	                    inputMonth.setAttribute("name", "month");
	                    inputMonth.setAttribute("value", month);
	                    console.log(month);

	                    inputDay.setAttribute("type", "hidden");
	                    inputDay.setAttribute("name", "day");
	                    inputDay.setAttribute("value", date);

	                    inputSche.setAttribute("type", "hidden");
	                    inputSche.setAttribute("name", "stamp_id");
	                    inputSche.setAttribute("value", "0");

	                    cell.appendChild(form);
	                    form.appendChild(input);
	                    form.appendChild(inputYear);
	                    form.appendChild(inputMonth);
	                    form.appendChild(inputDay);
	                    form.appendChild(button);
	                    form.appendChild(inputSche);
	                    date++;

	                    var have = "0";
						// カレンダーページを最初に開いた時の処理
						console.log(<%=request.getAttribute("dates") %>)
						if (<%=request.getAttribute("dates") %>) {
							// 予定がある場合
							var dates = <%=request.getAttribute("dates") %>;
							var stampIds = <%=request.getAttribute("stampIds") %>;
							console.log(stampIds);
							let count = 0;
		                    for (var schedule of dates) {
		                    	console.log(schedule);
		                    	console.log(nowday);
		                    	if(schedule == zeroNowDay) {
		                    		have = "1";
		                    		inputSche.setAttribute("type", "hidden");
				                    inputSche.setAttribute("name", "stamp_id");
				                    inputSche.setAttribute("value", stampIds[count]);

		                    		const imgSchedule = document.createElement('img');
		                    		imgSchedule.setAttribute("src", "../../images/リンゴ.png");

									button.appendChild(imgSchedule);
		                    		form.appendChild(inputSche);
		                    	}
		                    	count++;
		                    }
						} else {
							// 予定登録、編集をした後に通る処理
							if (<%=request.getAttribute("date") %>) {
								// 予定がある場合
								var returnDate = <%=request.getAttribute("date") %>;	// date	にすると変数名が被ってエラーになる
								var stampId = <%=request.getAttribute("icon") %>;
								console.log(stampIds);
								let count = 0;
			                    if(date == nowday) {
		                    		have = "1";
		                    		inputSche.setAttribute("type", "hidden");
				                    inputSche.setAttribute("name", "stamp_id");
				                    inputSche.setAttribute("value", stampId);

		                    		const imgSchedule = document.createElement('img');
		                    		imgSchedule.setAttribute("src", "../../images/リンゴ.png");

		                    		button.appendChild(imgSchedule);
		                    		form.appendChild(inputSche);
	                    		}
	                    		count++;
		                    }
						}


	                    // 予定の有無を判別する隠しなんたら
	                    const inputHave = document.createElement('input');
	                    inputHave.setAttribute("type", "hidden");
	                    inputHave.setAttribute("name", "have");
	                    inputHave.setAttribute("value", have);
	                    form.appendChild(inputHave);
	                }

	                row.appendChild(cell);
	            }

	            calendarBody.appendChild(row);
	        }
	    }

	    window.onload = updateCalendar;

	     // 現在の年と月を追跡する変数
	     let currentYear, currentMonth;

	     function updateCalendar() {
	         const today = new Date();
	         currentYear = today.getFullYear();
	         currentMonth = today.getMonth() + 1;
	         generateCalendar(currentYear, currentMonth);
	     }

	     // 前月に移動する関数
	     function prevMonth() {
	         currentMonth--;
	         if (currentMonth < 0) {
	             currentMonth = 11;
	             currentYear--;
	         }
	         generateCalendar(currentYear, currentMonth);
	     }

	     // 翌月に移動する関数
	     function nextMonth() {
	         currentMonth++;
	         if (currentMonth > 11) {
	             currentMonth = 0;
	             currentYear++;
	         }
	         generateCalendar(currentYear, currentMonth);
	     }
    </c:param>
</c:import>