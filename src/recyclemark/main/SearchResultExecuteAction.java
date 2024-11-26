package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Detail;
import dao.DetailDao;
import tool.Action;

public class SearchResultExecuteAction extends Action {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		Detail detail = null;
		DetailDao detailDao = new DetailDao();				// Daoのインスタンス化
		// Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		String markId = "";
		// リクエストパラメーターの取得 2
		markId = req.getParameter("recycleId");

		// DBからデータの取得 3
		System.out.println(markId);
		detail = detailDao.getData(markId);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(detail != null) {
			// DBにデータを保存 5

			// レスポンス値をセット 6
			req.setAttribute("detail", detail);

			// JSPへフォワード 7
			req.getRequestDispatcher("detail.jsp").forward(req, res);
		} else {
			// レスポンス値をセット 6

			System.out.println("エラーだよ");

			// JSPへフォワード 7
			res.sendRedirect("text_result.jsp");
		}
	}
}
