package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class ScheduleExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1


		//リクエストパラメータ―の取得 2
		//なし
		//DBからデータ取得 3


		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6


		//JSPへフォワード 7
		req.getRequestDispatcher("calendar.jsp").forward(req, res);
	}

}
