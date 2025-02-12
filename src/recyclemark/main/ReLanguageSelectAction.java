package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
public class ReLanguageSelectAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "menu.jsp";
		//リクエストパラメータ―の取得 2
		String language = req.getParameter("language");//言語
		//DBからデータ取得 3

		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		// セッション情報を取得
		HttpSession session = req.getSession();
		// セッションにログイン情報を保存
		session.setAttribute("language", language);

		//JSPへフォワード 7
		req.getRequestDispatcher(url).forward(req, res);
	}
}
