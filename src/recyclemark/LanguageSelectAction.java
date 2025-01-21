package recyclemark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LanguageSelectAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "login.jsp";
		String language = "";
		//リクエストパラメータ―の取得 2
		language = req.getParameter("language");//メールアドレス
		//DBからデータ取得 3
		//なし
		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		// セッション情報を取得
		HttpSession session = req.getSession(true);
		// セッションにログイン情報を保存
		session.setAttribute("language", language);

		//JSPへフォワード 7
		req.getRequestDispatcher(url).forward(req, res);
	}
}
