<%-- 画像検索JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
     <c:param name="style">
     /* 全体をセンターに配置 */
    body {
      height: 130vh;
      margin: 0;
      background-image: url("../../images/20210729_1.jpg");
      background-size: cover;
      background-position: center top;
      background-attachment: fixed;
      color: #333;
      display: block; /* flexを解除 */
    }

    h1 {
      text-align: center;
      font-size: 35px;
      margin: 10px auto;
      width: fit-content; /* コンテンツの幅に合わせる */
    }

    /* ヘッダーのスタイル */
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

    /* カメラとラベルを縦に並べる */
    #container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 20px;
    }

    #webcam-container {
      margin-bottom: 20px;
    }

    /* ラベルコンテナ全体のスタイル */
    #label-container {
      display: flex;
      justify-content: center; /* 中央揃え */
      flex-wrap: wrap; /* 複数行で折り返し */
      gap: 10px;
    }

    /* 個別のラベルスタイル */
    .label-button {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 10px;
      width: 150px;
      text-align: center;
    }

    /* ボタンのスタイル */
    button {
      justify-content: center;
      font-size: 16px;
      padding: 10px 20px;
      margin-top: 5px;
      background-color: rgba(58, 92, 52, 0.8);
      color: white;
      border: 4px solid #3a5c34;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    button:hover {
        background-color: #3a5c34;
    }

    /* label-canvasの枠線を消す */
    #label-canvas {
      border: none;
    }
    </c:param>


    <c:param name="title">
		    画像検索
	  </c:param>

	  <c:param name="header">
		<a class="back" href="javascript:history.back();">＜</a>
	</c:param>



	<c:param name="content">
		<div id="container">
  			<h1>画像検索</h1>
			<div id="webcam-container"></div>
			<div id="label-container"></div>
			<canvas id="label-canvas" width="400" height="100"></canvas>
		</div>
	</c:param>
	<c:param name="script">
		// ★以下に、作成したAIのURLを記載してください
	    const URL = 'https://teachablemachine.withgoogle.com/models/Ohc0_mt_h/';

	    let model, webcam, labelContainer, maxPredictions;

	    // ラベル表示用の関数
	    function showLabel(str) {
	      var label_canvas = document.getElementById('label-canvas');  // HTMLCanvasElement
	          var ctx = label_canvas.getContext('2d');  // CanvasRenderingContext2D
	          ctx.clearRect(0, 0, label_canvas.width, label_canvas.height);
	          ctx.font = '50pt Arial';
	          ctx.fillStyle = 'rgba(0, 0, 255)';
	          ctx.fillText(str, 20, 70, label_canvas.width-40);
	    }

	    // 予測結果ごとのメッセージを定義（このオブジェクトを使ってメッセージを変更）
	    const alertMessages = {
	      "プラスチックマーク": "プラスチック製容器梱包やペットボトルのラベル、キャップなどの製品、グミの袋、飲料用・しょうゆ用ペットボトルを除く容器に使わます。",
	      "ペットボトルマーク": "飲料用・しょうゆ用のペットボトル容器に使われます。",
	      "アルミマーク": "ジュースや酒類、炭酸飲料や果汁飲料の缶に使われる、磁石を近づけてもくっつかなければアルミ缶です。'",
	      "スチールマーク":"ジュースやコーヒー、おでん缶など素材に鋼が使われ、高温・高圧殺菌が必要な飲料に使われる、ほかにも果物や魚の缶詰、お菓子などが入っている缶も分類される、磁石を近づけてくっつくとスチール缶です。",
	      "紙マーク":"一般的な紙製品全般、紙製包装容器(アルミが使用されている製品含む)に使用されます。",
	      "紙パックマーク":"飲料用の紙製包装容器に表示される、パックのものなどアルミが使用されていないものが対象",
	      "段ボールマーク":"段ボール製の包装容器全般に使用される、段ボールについているテープはプラスチックなので注意"
	    };


	    // Load the image model and setup the webcam
	    async function init() {
	        if(URL == "") {
	          showLabel('AIを読み込ませてください')
	          return;
	        }
	        const modelURL = URL + "model.json";
	        const metadataURL = URL + "metadata.json";

	        // load the model and metadata
	        model = await tmImage.load(modelURL, metadataURL);
	        maxPredictions = model.getTotalClasses();

	        // Convenience function to setup a webcam
	        const flip = false; //ウェブカメラを反転させる設定
	        webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
	        await webcam.setup(); // request access to the webcam
	        await webcam.play();
	        window.requestAnimationFrame(loop);

	        // append elements to the DOM
	        document.getElementById("webcam-container").appendChild(webcam.canvas);
	        labelContainer = document.getElementById("label-container");
	        for (let i = 0; i < 3; i++) { // 3つのラベルボタンを作成
	        	const form = document.createElement("form");
	        	form.action = 'SearchResultExecute.action';
               	form.method = 'get';
	            const labelDiv = document.createElement("div");
	            labelDiv.classList.add("label-button");
	            const button = document.createElement("button");
	            button.setAttribute("type", "submit");
	            button.textContent = "Action";  // ボタンに表示する内容
	            const inputMark = document.createElement("input");
                inputMark.setAttribute("type", "hidden");
                inputMark.setAttribute("name", "markId");
                inputMark.setAttribute("value", "0");
	            button.onclick = function() {
	            	const className = labelDiv.textContent.trim().split(":")[0];  // クラス名を取得


	                switch (className) {
					    case "プラスチックマーク":
					      inputMark.value = "1";
	                      //inputMark.setAttribute("value", "1");
					      break;
					    case "ペットボトルマーク":
					      inputMark.value = "2";
					      //inputMark.setAttribute("value", "2");
					      break;
					    case "アルミマーク":
					      inputMark.value = "3";
					      //inputMark.setAttribute("value", "3");
					      break;
					    case "スチールマーク":
					      inputMark.value = "4";
					      //inputMark.setAttribute("value", "4");
					      break;
					    case "紙マーク":
					      inputMark.value = "5";
					      //inputMark.setAttribute("value", "5");
					      break;
					    case "紙パックマーク":
					      inputMark.value = "5";
					      //inputMark.setAttribute("value", "5");
					      break;
					    case "段ボールマーク":
					      inputMark.value = "1";
					      //inputMark.setAttribute("value", "1");
					      break;
				 	}
	            }

	            const inputHidden = document.createElement("input");
                inputHidden.setAttribute("type", "hidden");
                inputHidden.setAttribute("name", "forimage");
                inputHidden.setAttribute("value", "1");

	            labelDiv.appendChild(form);
	            form.appendChild(button);
	            form.appendChild(inputMark);
	            form.appendChild(inputHidden);
	            labelContainer.appendChild(labelDiv);
	        }
	    }

	    async function loop() {
	        webcam.update(); // update the webcam frame
	        await predict();
	        window.requestAnimationFrame(loop);
	    }

	    // run the webcam image through the image model
	    async function predict() {
	        const prediction = await model.predict(webcam.canvas);

	        // 予測結果を確率が高い順にソート
	        const sortedPredictions = prediction.sort((a, b) => b.probability - a.probability);

	        // 上位3項目だけを表示
	        const topPredictions = sortedPredictions.slice(0, 3);

	        // ソート後の予測結果を表示
	        for (let i = 0; i < topPredictions.length; i++) {
	            // 確率をパーセント形式に変換
	            const probabilityPercent = Math.floor(topPredictions[i].probability * 100) + "%";
	            const classPrediction = topPredictions[i].className + ": " + probabilityPercent;

	            // 上位3項目のみを表示
	            labelContainer.childNodes[i].childNodes[0].childNodes[0].textContent = classPrediction;  // 更新された予測結果をボタンに表示
	        }

	        // 上位3項目が少ない場合、残りのボタンを非表示にする
	        for (let i = topPredictions.length; i < labelContainer.childNodes.length; i++) {
	            labelContainer.childNodes[i].style.display = 'none';
	        }
	    }
	</c:param>
</c:import>

