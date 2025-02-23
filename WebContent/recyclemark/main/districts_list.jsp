<%-- 検索結果詳細画面JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>23区一覧</title>
    <style>
        /* 基本スタイル */
		 body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-image: url("../../images/20210729_1.jpg");
	        background-size: cover;
	        background-size: cover;
	        background-position: center top;
	        background-attachment: fixed;
	        color: #333;
    	}
	    h1 {
        font-size: 50px;
        margin-top: 0;
        margin-bottom: 50px;
        text-align: center; /* 中央揃え */
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
	    .main-container {
	    padding: 20px 30px 50px 50px;
	    border-radius: 15px;
	    max-width: 1000px; /* 任意の幅 */
	    width: 100%;
	    text-align: center;
	    display: flex;
	    justify-content: center; /* 水平方向に中央揃え */
	    align-items: center; /* 垂直方向に中央揃え */
	    margin: 0 auto; /* 自動的に中央に配置 */
	    }
	    li {
	        font-size: 30px;
	        margin-left: 50px;
	        color: #333;
	        padding: 5px 10px; /* リストアイテムにパディングを追加 */
	        background-color: #f0f0f0; /* 背景色を設定 */
	        border-radius: 5px; /* 背景に丸みをつける */

	    }
	    .link {
	        font-size: 30px;
	        font-weight: bold;
	        color: #333;
	        background-color: rgba(255, 255, 255, 0.7);
	        display: inline-block;
	        margin-left: 140px;
	    }
	    a {
	        padding: 20px;
	        color: #333; /* リンクの色を変更（青色の例） */
	    }
	    table {
	        width: 100%;
	        border-collapse: collapse;
	        margin: 20px 0;
	        border: 3px solid #333;
	    }

	    th, td {
	        border: 1.5px solid #333;
	        padding: 10px;
	        text-align: center;
	        font-size: 20px;
	        font-weight: bold;
	    }

	    th {
	        background-color: rgba(58, 92, 52, 0.6);;
	        font-weight: bold;
	    }

	    tr{
	        background-color: rgba(255, 255, 255, 0.7);
	    }

	</style>
	<script>
		const language = document.getElementById("language").value;

		// jsonファイルの読み込み
		fetch("../../JSON/mypage.json")
		  .then(response => response.json())
		  .then(data => {
			for (var i = 1;  i < 24;  i++) {
				var districtPDF = document.getElementById("districtsPDF" + i);
				var district = document.getElementById("districts" + i);

				// レスポンスを処理するコード
			  	// dataにはjsonファイルの中身が格納されている
				edit.innerHTML = data[language]["edit"]
				fav.innerHTML = data[language]["fav"]
				search_his.innerHTML = data[language]["search_his"]
				calendar.innerHTML = data[language]["calendar"]
			}
		  })
		  .catch(error => {
		    // エラー処理
		  });

	    const chiyoda = document.getElementById("chiyoda");
	    const chuo = document.getElementById("chuo");


	    let link = document.getElementById('link');
	    let url = 'https://into-the-program.com';
	    //href属性の値を書き換える
	    link.setAttribute('href', url);
	</script>
</head>
<body>

<!-- 戻るリンク -->
<a href="SearchResultExecute.action" class="back">＜</a>

<h1>東京都　23区</h1>
<div class="link">
<a href="https://www.union.tokyo23-seisou.lg.jp/joho/index.html">・23区のホームページ一覧</a>
</div>
<div class="main-container">
<p>${language }</p>
<input type="hidden" value="${language }" id="language" />
<table>
    <thead>
        <tr>
            <th>PDF</th>
            <th>区のHP</th>
        </tr>
    </thead>
    <tbody>
         <tr>
            <td><a id="districtsPDF1" href="https://www.city.chiyoda.lg.jp/documents/1952/wakekataposter-jp_1.pdf">千代田区</a></td>
            <td><a id="districts1" href="https://www.city.chiyoda.lg.jp/koho/kurashi/gomi/index.html">千代田区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF2" href="https://www.city.minato.tokyo.jp/gomigenryou/kurashi/gomi/kate/k-wakekata/documents/guidebookjapanese.pdf">中央区</a></td>
            <td><a id="districts2" href="https://www.city.chuo.lg.jp/kurashi/gomi/index.html">中央区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF3" href="https://www.city.minato.tokyo.jp/gomigenryou/kurashi/gomi/kate/k-wakekata/documents/guidebookjapanese.pdf">港区</a></td>
            <td><a id="districts3" href="https://www.city.minato.tokyo.jp/kurashi/gomi/index.html">港区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF4" href="https://www.city.shinjuku.lg.jp/content/000259254.pdf">新宿区</a></td>
            <td><a id="districts4" href="https://www.city.shinjuku.lg.jp/seikatsu/index09.html">新宿区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF5" href="URL">文京区</a></td>
            <td><a id="districts5" href="https://www.city.bunkyo.lg.jp/tetsuzuki/gomi/index.html">文京区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF6" href="URL">台東区</a></td>
            <td><a id="districts6" href="https://www.city.taito.lg.jp/kurashi/gomi/index.html">台東区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF7" href="URL">墨田区</a></td>
            <td><a id="districts7" href="https://www.city.sumida.lg.jp/kurashi/gomi_recycle/index.html">墨田区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF8" href="URL">江東区</a></td>
            <td><a id="districts8" href="https://www.city.koto.lg.jp/kurashi/gomi/index.html">江東区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF9" href="URL">品川区</a></td>
            <td><a id="districts9" href="https://www.city.shinagawa.tokyo.jp/PC/kankyo/kankyo-gomi/index.html">品川区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF10" href="URL">目黒区</a></td>
            <td><a id="districts10" href="https://www.city.meguro.tokyo.jp/kurashi/gomi/index.html">目黒区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF11" href="URL">大田区</a></td>
            <td><a id="districts11" href="https://www.city.ota.tokyo.jp/seikatsu/gomi/index.html">大田区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF12" href="URL">世田谷区</a></td>
            <td><a id="districts12" href="https://www.city.setagaya.lg.jp/kurashi/gomi/11535.html">世田谷区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF13" href="URL">渋谷区</a></td>
            <td><a id="districts13" href="https://www.city.shibuya.tokyo.jp/kurashi/gomi/kateigomi/">渋谷区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF14" href="URL">中野区</a></td>
            <td><a id="districts14" href="https://www.city.tokyo-nakano.lg.jp/kurashi/gomi/index.html">中野区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF15" href="URL">杉並区</a></td>
            <td><a id="districts15" href="https://www.city.suginami.tokyo.jp/guide/gomi/index.html">杉並区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF16" href="URL">豊島区</a></td>
            <td><a id="districts16" href="https://www.city.toshima.lg.jp/kurashi/gomi/index.html">豊島区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF17" href="URL">北区</a></td>
            <td><a id="districts17" href="https://www.city.kita.tokyo.jp/kurashi/gomi/index.html">北区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF18" href="URL">荒川区</a></td>
            <td><a id="districts18" href="https://www.city.arakawa.tokyo.jp/recycle/index.html">荒川区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF19" href="URL">板橋区</a></td>
            <td><a id="districts19" href="https://www.city.itabashi.tokyo.jp/tetsuduki/gomi/index.html">板橋区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF20" href="URL">練馬区</a></td>
            <td><a id="districts20" href="https://www.city.nerima.tokyo.jp/kurashi/gomi/index.html">練馬区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF21" href="URL">足立区</a></td>
            <td><a id="districts21" href="https://www.city.adachi.tokyo.jp/kurashi/kankyo/gomi/index.html">足立区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF22" href="URL">葛飾区</a></td>
            <td><a id="districts22" href="https://www.city.katsushika.lg.jp/kurashi/1000048/index.html">葛飾区HP</a></td>
        </tr>
        <tr>
            <td><a id="districtsPDF23" href="URL">江戸川区</a></td>
            <td><a id="districts23" href="https://www.city.edogawa.tokyo.jp/kurashi/gomi_recycle/index.html">江戸川区HP</a></td>
        </tr>
    </tbody>
</table>
</div>
</body>
</html>