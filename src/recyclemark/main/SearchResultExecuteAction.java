package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Detail;
import bean.User;
import dao.DetailDao;
import dao.FavoriteDao;
import dao.HistoryDao;
import tool.Action;

public class SearchResultExecuteAction extends Action {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		Detail detail = null;
		User user = null;
		DetailDao detailDao = new DetailDao();				// Daoのインスタンス化
		FavoriteDao favoriteDao = new FavoriteDao();
		HistoryDao historyDao = new HistoryDao();
		// Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		String markId = "";
		String userId = "";
		int heartStamp = 0;

		// リクエストパラメーターの取得 2
		markId = req.getParameter("markId");

		// セッション情報の取得
		HttpSession session = req.getSession();
		user = (User) session.getAttribute("user");
		// セッション情報のユーザーIDを取得
		userId = user.getId();
		System.out.println("userId:" + userId);

		// DBからデータの取得 3
		System.out.println("markId:" + markId);
		detail = detailDao.getData(markId);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(detail != null) {
			if (favoriteDao.getRegisteredFav(userId, markId)) {
				System.out.println("heartStampSR:" + heartStamp);
				heartStamp ++;

				// DBにデータを保存 5
				historyDao.save(Integer.parseInt(userId),Integer.parseInt(markId));
				// レスポンス値をセット 6
				req.setAttribute("heartStamp", heartStamp);
				req.setAttribute("detail", detail);

				// JSPへフォワード 7
				req.getRequestDispatcher("detail.jsp").forward(req, res);
			} else {
				System.out.println("heartStamp:" + heartStamp);
				// DBにデータを保存 5

				// レスポンス値をセット 6
				req.setAttribute("heartStamp", heartStamp);
				req.setAttribute("detail", detail);

				// JSPへフォワード 7
				req.getRequestDispatcher("detail.jsp").forward(req, res);
			}

		} else {
			// レスポンス値をセット 6

			System.out.println("エラーだよ");

			// JSPへフォワード 7
			res.sendRedirect("text_result.jsp");
		}
	}
}
