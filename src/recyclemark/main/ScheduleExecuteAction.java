package recyclemark.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Stampdata;
import bean.User;
import dao.CalendarDao;
import tool.Action;

public class ScheduleExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		String userId = user.getId();
		int intUserId = 0;

		Stampdata stampdata = null;

		CalendarDao calendarDao = new CalendarDao();	// Daoのインスタンス化

		Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		String schedule = "";
		String originDate = "";
		String createDate = "";
		String icon = "";
		int intIcon = 0;
		String memo = "";

		//リクエストパラメータ―の取得 2
		originDate = req.getParameter("date");
		icon = req.getParameter("icon");
		memo = req.getParameter("memo");
		schedule = req.getParameter("schedule");
		System.out.println("日付：" + originDate);
		System.out.println("アイコン：" + icon);
		System.out.println("メモ：" + memo);
		System.out.println("判別：" + schedule);

		//DBからデータ取得 3
		stampdata = calendarDao.getStamps(icon);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		// スタンプアイコンが選択されているかを判別
		switch (icon) {
			case "0":
				// レスポンス値をセット 6
				errors.put("icon_error", "アイコンを選択してください");
				req.setAttribute("errors", errors);

				req.setAttribute("date", originDate);
				req.setAttribute("icon", icon);
				req.setAttribute("memo", memo);
				req.setAttribute("schedule", schedule);

				//JSPへフォワード 7
				req.getRequestDispatcher("calendar_schedule.jsp").forward(req, res);
				break;
			case "7":
				createDate = originDate.replace("\"", "");	// ダブルクォーテーションを消す処理
				calendarDao.delete(userId, createDate);	// 予定を削除

				//JSPへフォワード 7
				res.sendRedirect("CalendarExecute.action");
				break;
			default:
				createDate = originDate.replace("\"", "");	// ダブルクォーテーションを消す処理
				intUserId = Integer.parseInt(userId);	// int型に変換
				intIcon = Integer.parseInt(icon);		// ↑同じ

				// 予定の登録か編集かを判別
				if(schedule.equals("0")) {
					// DBにデータを保存 5
					calendarDao.createSchedule(createDate, intUserId, intIcon, stampdata.getStampImg(), memo);
				} else {
					calendarDao.delete(userId, createDate);	// 編集前の予定を削除

					// DBにデータを保存 5
					calendarDao.createSchedule(createDate, intUserId, intIcon, stampdata.getStampImg(), memo);
				}

				// レスポンス値をセット 6
				req.setAttribute("date", originDate);
				req.setAttribute("icon", icon);

				//JSPへフォワード 7
				res.sendRedirect("CalendarExecute.action");
				break;
		}
	}
}
