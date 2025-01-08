package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class ScheduleExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String schedule = "";
		String date = "";

		//リクエストパラメータ―の取得 2
		date = req.getParameter("date");
		schedule = req.getParameter("schedule");

		//DBからデータ取得 3

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(schedule == "0") {
			// DBにデータを保存 5


			// レスポンス値をセット 6
//			req.setAttribute("schedules",schedules);

			//JSPへフォワード 7
			req.getRequestDispatcher("calender.jsp").forward(req, res);
		} else {
			// DBにデータを保存 5

			// JSPへフォワード 7
			req.getRequestDispatcher("calender.jsp").forward(req, res);
		}
	}

}
