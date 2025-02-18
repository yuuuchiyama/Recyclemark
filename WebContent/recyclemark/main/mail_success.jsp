<%-- メール送信成功JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	 body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url("../../images/20210729_1.jpg");
        background-size: cover;
        background-position: center top;
        background-attachment: fixed;
        color: #333;
        overflow: hidden; /* スクロールバーを非表示にする */

    }
    .main-container {
        width: 400px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 40px 70px;
        border-radius: 15px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 500px;
        width: 100%;
    }
</style>
<title>メール送信成功</title>

</head>
	<body>
	<input type="hidden" value="${language }" id="language" />
		<div class="main-container">
	    	<h2 id="mail_success">メール送信が完了しました。</h2>
	    </div>
	    <script>
		const language = document.getElementById("language").value;
	    const mail_success = document.getElementById("mail_success");

	 // jsonファイルの読み込み
		fetch("../JSON/mail_success.json")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// レスポンスを処理するコード
			// dataにはjsonファイルの中身が格納されている
			mail_success.innerHTML = data[language]["mail_success"];

		})
		.catch(error => {
			// エラー処理
		});
	</script>
	</body>
</html>