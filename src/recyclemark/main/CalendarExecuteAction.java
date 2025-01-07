package recyclemark.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Calendar;
import bean.User;
import dao.CalendarDao;
import tool.Action;

public class CalendarExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		String userId = user.getId();

		CalendarDao calendarDao = new CalendarDao();
		List<Calendar> schedules = null;

		//リクエストパラメータ―の取得 2
		//なし

		//DBからデータ取得 3
		schedules = calendarDao.getSchedule(userId);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(schedules != null) {
			System.out.println(schedules);
			// DBにデータを保存 5

			// レスポンス値をセット 6
			req.setAttribute("schedules",schedules);

			//JSPへフォワード 7
			req.getRequestDispatcher("calender.jsp").forward(req, res);
		} else {
			// JSPへフォワード 7
			req.getRequestDispatcher("calender.jsp").forward(req, res);
		}
	}

}
