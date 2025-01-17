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
		String trait = "";
		String forRanking = "";
		String forText = "";
		String forImage = "";


		// セッション情報の取得
		HttpSession session = req.getSession();
		user = (User) session.getAttribute("user");
		// セッション情報のユーザーIDを取得
		userId = user.getId();
//		System.out.println("userId:" + userId);
		if (req.getParameter("markId") != null) {
			session.removeAttribute("markId");
		}
		// セッション情報の有無によってmarkIdの取得方法が変化
		if (session.getAttribute("markId") != null) {
			markId = (String)session.getAttribute("markId");
			System.out.println("セッション情報のmarkId:" + markId);
		} else {
			// リクエストパラメーターの取得 2
			markId = req.getParameter("markId");
			forImage = req.getParameter("forimage");
			session.setAttribute("markId",markId);
			System.out.println("リクエストパラメータのmarkId:" + markId);
		}
		if (session.getAttribute("forRanking") != null) {
			forRanking = (String) session.getAttribute("forRanking");
		} else {
			forText = req.getParameter("fortext");
			trait = req.getParameter("trait");
			System.out.println("セッションに格納する前のtrait：" + trait);
			session.setAttribute("trait", trait); // セッションにテキスト検索のワードを保存

			System.out.println("text:" + forText);
			System.out.println("nullです");
			System.out.println("forRanking:" + forRanking);
		}
		session.removeAttribute("forRanking");

		// DBからデータの取得 3
		System.out.println("markId:" + markId);
		detail = detailDao.getData(markId);
//		System.out.println("detail:" + detail);
//		System.out.println(detail.getMarkId());
//		System.out.println(detail.getMarkImg());
//		System.out.println(detail.getMarkName());
//		System.out.println(detail.getMarkDescribe());
		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		if(detail != null) {
			if (favoriteDao.getRegisteredFav(userId, markId)) {
				System.out.println("1");
				System.out.println("heartStampSR:" + heartStamp);
				heartStamp ++;

				// DBにデータを保存 5
				historyDao.save(Integer.parseInt(userId),Integer.parseInt(markId));
				// レスポンス値をセット 6
				req.setAttribute("heartStamp", heartStamp);
				req.setAttribute("detail", detail);
				req.setAttribute("forRanking", forRanking);
				req.setAttribute("forText", forText);
				req.setAttribute("forImage", forImage);

				// JSPへフォワード 7
				req.getRequestDispatcher("detail.jsp").forward(req, res);
			} else {
				System.out.println("00");
				System.out.println("heartStamp:" + heartStamp);
				// DBにデータを保存 5
				historyDao.save(Integer.parseInt(userId),Integer.parseInt(markId));
				// レスポンス値をセット 6
				req.setAttribute("heartStamp", heartStamp);
				req.setAttribute("detail", detail);
				req.setAttribute("forRanking", forRanking);
				req.setAttribute("forText", forText);
				req.setAttribute("forImage", forImage);

				// JSPへフォワード 7
				req.getRequestDispatcher("detail.jsp").forward(req, res);
			}

		} else {
			// レスポンス値をセット 6

			System.out.println("詳細情報がNULLだよ");

			// JSPへフォワード 7
			res.sendRedirect("text_result.jsp");
		}
	}
}
