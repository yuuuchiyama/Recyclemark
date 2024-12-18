package recyclemark.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;
import bean.User;
import dao.FavoriteDao;
import tool.Action;

public class FavoriteExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		FavoriteDao favoriteDao = new FavoriteDao();	// Daoのインスタンス化
		List<Favorite> favorites = null;
		Map<String, String> errors = new HashMap<>();	// エラーメッセージ
		User user = null;
		String userId = "";

		// リクエストパラメーターの取得 2


		// セッション情報の取得
		HttpSession session = req.getSession();
		user = (User) session.getAttribute("user");
		// セッション情報のユーザーIDを取得
		userId = user.getId();
		System.out.println("userId:" + userId);

		// DBからデータの取得 3
		favorites = favoriteDao.getFavorite(userId);

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4
		// セッション情報に登録されているmarkIdを破棄
		session.removeAttribute("markId");
		if(favorites.size() > 0) {
			// DBにデータを保存 5

			// レスポンス値をセット 6
			System.out.println(favorites);
			req.setAttribute("favorites", favorites);

			// JSPへフォワード 7
			req.getRequestDispatcher("favorite_list.jsp").forward(req, res);
		} else {
			// レスポンス値をセット 6
			errors.put("favorite_error", "お気に入り情報はありません");
			req.setAttribute("errors", errors);

			// JSPへフォワード 7
			req.getRequestDispatcher("favorite_list.jsp").forward(req, res);
		}
	}
}
