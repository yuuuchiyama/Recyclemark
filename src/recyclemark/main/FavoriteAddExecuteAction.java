package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.FavoriteDao;
import tool.Action;

public class FavoriteAddExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		FavoriteDao favoriteDao = new FavoriteDao();		// Daoのインスタンス化
		// Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		boolean addFavorite;

		User user = new User();
		String stringHeartStamp = "";
		int intHeartStamp = 0;
		String stringMarkId = "";
		int intMarkId = 0;
		String stringUserId = "";
		int intUserId = 0;

		// リクエストパラメーターの取得 2

		stringHeartStamp = req.getParameter("heartStamp");
		intHeartStamp = Integer.parseInt(stringHeartStamp);
		stringMarkId = req.getParameter("markId");
		intMarkId = Integer.parseInt(stringMarkId);

		// セッション情報の取得
		HttpSession session = req.getSession();
		user = (User) session.getAttribute("user");
		// セッション情報のユーザーIDを取得
		stringUserId = user.getId();
		intUserId = Integer.parseInt(stringUserId);
		System.out.println("userId:" + intUserId);
		System.out.println("markId:" + intMarkId);
		System.out.println("heartStamp" + intHeartStamp);

		// DBからデータの取得 3

		// ビジネスロジック 4

		// DBにデータを保存 5
		addFavorite = favoriteDao.saveFavorite(intHeartStamp, intUserId, intMarkId);

		// レスポンス値をセット 6

		// JSPへフォワード 7
		res.sendRedirect("detail.jsp");


//		if(detail != null) {
//			// DBにデータを保存 5
//
//			// レスポンス値をセット 6
//			req.setAttribute("detail", detail);
//
//			// JSPへフォワード 7
//			req.getRequestDispatcher("detail.jsp").forward(req, res);
//		} else {
//			// レスポンス値をセット 6
//
//			System.out.println("エラーだよ");
//
//			// JSPへフォワード 7
//			res.sendRedirect("text_result.jsp");
//		}
	}

}
