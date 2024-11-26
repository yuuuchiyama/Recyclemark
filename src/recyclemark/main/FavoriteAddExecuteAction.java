package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Detail;
import bean.User;
import dao.FavoriteDao;
import tool.Action;

public class FavoriteAddExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		Detail detail = new Detail();
		FavoriteDao favoriteDao = new FavoriteDao();		// Daoのインスタンス化
		// Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		// リダイレクト先で使用するデータ
		String markName = "";
		String markImg = "";
		String markDescribe = "";

		User user = new User();
		String stringHeartStamp = "";
		int intHeartStamp = 0;
		String stringMarkId = "";
		int intMarkId = 0;
		String stringUserId = "";
		int intUserId = 0;

		// リクエストパラメーターの取得 2
		markName = req.getParameter("markName");
		markImg = req.getParameter("markImg");
		markDescribe = req.getParameter("markDescribe");

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

		// DBからデータの取得 3

		// ビジネスロジック 4
		// detailのBeanに値をセット
		System.out.println("markId:" + intMarkId);
		detail.setMarkId(intMarkId);
		detail.setMarkImg(markImg);
		detail.setMarkName(markName);
		detail.setMarkDescribe(markDescribe);

		// DBにデータを保存 5
		intHeartStamp = favoriteDao.saveFavorite(intHeartStamp, intUserId, intMarkId);

		// レスポンス値をセット 6
		req.setAttribute("detail", detail);
		req.setAttribute("heartStamp",intHeartStamp);

		// JSPへフォワード 7
//		res.sendRedirect("detail.jsp");
		req.getRequestDispatcher("detail.jsp").forward(req, res);



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
