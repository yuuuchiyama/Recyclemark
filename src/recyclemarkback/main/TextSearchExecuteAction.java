package recyclemarkback.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecycleMark;
import dao.RecycleMarkDao;
import tool.Action;

public class TextSearchExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();	// Daoのインスタンス化
		List<RecycleMark> recycleMarks = null;
		Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		String detail = "";
		// リクエストパラメーターの取得 2
		detail = req.getParameter("detail");

		// DBからデータの取得 3
		recycleMarks = recycleMarkDao.getRecyclemark(detail);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(recycleMarks != null) {
			// DBにデータを保存 5

			// レスポンス値をセット 6
			req.setAttribute("detail", detail);
			req.setAttribute("recycleMarks",recycleMarks);

			// JSPへフォワード 7
			req.getRequestDispatcher("text_result.jsp").forward(req, res);
		} else {
			// レスポンス値をセット 6
			errors.put("mark_error", "そのリサイクルマークは存在しません");
			req.setAttribute("errors", errors);
			req.setAttribute("detail", detail);

			// JSPへフォワード 7
			req.getRequestDispatcher("text.jsp").forward(req, res);
		}
	}
}