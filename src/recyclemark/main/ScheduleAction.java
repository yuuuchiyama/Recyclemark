package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Calendar;
import bean.User;
import dao.CalendarDao;
import tool.Action;

public class ScheduleAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		String userId = user.getId();

		CalendarDao calendarDao = new CalendarDao();
		Calendar calendar = null;

		String originDate = "";
		String createDate = "";
		String stampId = "";
		String memo = "";
		String have = "";

		//リクエストパラメータ―の取得 2
		originDate = req.getParameter("date");
		stampId = req.getParameter("stamp_id");
		have = req.getParameter("have");

		//DBからデータ取得 3
		calendar = calendarDao.searchSchedule(userId, originDate);
		memo = calendar.getMemo();

		//ビジネスロジック 4
		createDate = '"' + originDate + '"';	// ダブルクォーテーションを付加する処理

		//DBへデータ保存 5
		//なし

		//レスポンス値をセット 6
		req.setAttribute("date", createDate);
		req.setAttribute("stampId", stampId);
		req.setAttribute("memo", memo);
		req.setAttribute("have", have);

		//JSPへフォワード 7
		req.getRequestDispatcher("calendar_schedule.jsp").forward(req, res);
	}
}
