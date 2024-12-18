package recyclemark.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecycleMark;
import dao.RecycleMarkDao;
import tool.Action;

public class ScheduleAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		RecycleMark recycleMark = new RecycleMark();
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();
		List<RecycleMark> recycleMarks = null;

		//リクエストパラメータ―の取得 2
		//なし
		//DBからデータ取得 3
		recycleMarks =  recycleMarkDao.getMarkAll();

		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		req.setAttribute("recycleMarks", recycleMarks);

		//JSPへフォワード 7
		req.getRequestDispatcher("calendar_schedule.jsp").forward(req, res);
	}
}
