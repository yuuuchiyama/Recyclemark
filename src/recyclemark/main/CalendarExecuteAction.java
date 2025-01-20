package recyclemark.main;

import java.util.ArrayList;
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
		List<String> dates = new ArrayList<>();
		List<Integer> stampIds = new ArrayList<>();
		List<String> stampImgs = new ArrayList<>();

		//リクエストパラメータ―の取得 2
		//なし

		//DBからデータ取得 3
		schedules = calendarDao.getSchedule(userId);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(schedules != null) {
			System.out.println(schedules);
			for (Calendar schedule : schedules) {
				dates.add('"' + schedule.getCalendarDate() + '"');
				stampIds.add(schedule.getStampId());
				stampImgs.add('"' + schedule.getStampImg() + '"');
			}

			System.out.println("予定情報のbean:" + dates);
			System.out.println("予定情報のスタンプID" + stampIds);
			System.out.println("予定情報のスタンプImg" + stampImgs);
			// DBにデータを保存 5

			// レスポンス値をセット 6
			req.setAttribute("dates", dates);
			req.setAttribute("stampIds",stampIds);
			req.setAttribute("stampImgs", stampImgs);

			//JSPへフォワード 7
			req.getRequestDispatcher("calendar.jsp").forward(req, res);
		} else {
			// JSPへフォワード 7
			req.getRequestDispatcher("calendar.jsp").forward(req, res);
		}
	}

}
