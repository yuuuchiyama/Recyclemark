<%@page contentType="text/html; cherset=UTF-8" %>
<%@include file="/common/header.html"%>

<form action="LoginExecute.action" method="post">

<table>
	<tr>
		<td></td>
	</tr>
</table>
<p>USER ID <input type="text" name="id"></p>
<p>PASSWORD <input type="password" name="password"></p>
<p><input type="submit" value="ログイン"></p>
<a href="#">新規登録はこちら</a>
</form>

<%@include file="/common/footer.html" %>