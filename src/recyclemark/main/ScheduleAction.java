package recyclemark.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.RecycleMark;
import bean.User;
import dao.CalendarDao;
import dao.RecycleMarkDao;
import tool.Action;

public class ScheduleAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		String userId = user.getId();

		RecycleMark recycleMark = new RecycleMark();
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();
		CalendarDao calendarDao = new CalendarDao();
		List<RecycleMark> recycleMarks = null;

		String date = "";
		String year = "";
		String month = "";
		String day = "";
		int have = 0;
		//リクエストパラメータ―の取得 2
		date = req.getParameter("date");
		year = req.getParameter("year");
		month = req.getParameter("month");
		day = req.getParameter("day");
		System.out.println(date);

		//DBからデータ取得 3
		recycleMarks =  recycleMarkDao.getMarkAll();

		//ビジネスロジック 4
		if (calendarDao.searchSchedule(userId, date)) {
			have = 1;
		}

		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		req.setAttribute("date", date);
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("day", day);
		req.setAttribute("recycleMarks", recycleMarks);
		req.setAttribute("have", have);

		//JSPへフォワード 7
		req.getRequestDispatcher("calendar_schedule.jsp").forward(req, res);
	}
}
