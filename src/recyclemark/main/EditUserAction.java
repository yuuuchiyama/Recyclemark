package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class EditUserAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1

		//リクエストパラメータ―の取得 2

		//DBからデータ取得 3
		//なし
		//ビジネスロジック 4

		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		//なし
		//JSPへフォワード 7
		req.getRequestDispatcher("edit.jsp").forward(req, res);
	}

}
