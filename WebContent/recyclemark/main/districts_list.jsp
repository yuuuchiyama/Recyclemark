<%-- 検索結果詳細画面JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
     <c:param name="style">
      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        /* ヘッダーのスタイル */
        .header {
            display: flex;
            background-color: #ddd;
            padding: 30px 20px;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 4px 2px -2px gray;
        }
        .title {
            font-size: 30px;
            font-weight: bold;
        }
        h1 {
            font-size: 30px;
            margin-bottom: 20px;
            text-align: center; /* 中央揃え */
        }
        /* 戻るリンクのスタイル */
        .back {
            text-decoration: underline;
            margin: 10px auto;
            padding: 10px 20px;
            font-size: 20px;
            max-width: 500px;
        }
        .back:hover {
            text-decoration: underline;
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
	 <!-- 戻るリンク -->
    <a href="#" class="back">＜戻る</a>

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
</body>
</html>
</c:param>
</c:import>
