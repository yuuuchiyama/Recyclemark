<%-- メニューJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		RecycleMark
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<!-- メインコンテンツ部分 -->
		<div class="main-content">
			<div class="button-container">
				<button>テキスト検索</button>
				<button>画像検索</button>
				<button>ランキング</button>
				<button>言語選択に戻る</button>
			</div>
		</div>
	</c:param>
</c:import>