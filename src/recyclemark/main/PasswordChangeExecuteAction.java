package recyclemark.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDao;
import tool.Action;

public class PasswordChangeExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String originpas = "";
		String password1 = "";
		String password2 = "";
		UserDao userDao = new UserDao();
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		//リクエストパラメータ―の取得 2
		originpas = req.getParameter("originpas");//現在のパスワード
		password1 = req.getParameter("password1");//パスワード
		password2 = req.getParameter("password2");//パスワード

		//DBからデータ取得 3

		//条件で手順4~7の内容が分岐
		//ビジネスロジック 4
		if(password1.equals(password2)){	// 入力された2つのパスワードが同じか判別
			if(password1.length() <= 16){
				if (user.getPassword().equals(originpas)) {		// 現在のパスワードが登録されているパスワードと一致しているか判別
					if (user.getPassword().equals(password1)) {		// 新しいパスワードが登録されているパスワードと違うものか判別
						errors.put("password_error", "入力されたパスワードは使えません");

						//レスポンス値をセット 6
						req.setAttribute("errors", errors);

						// JSPへフォワード 7
						req.getRequestDispatcher("password_change.jsp").forward(req, res);
					}else {
						//DBへデータ保存 5
						if(userDao.save(password1, Integer.parseInt(user.getId()))){
							// セッションの破棄
							session.invalidate();

							// JSPへフォワード 7
							req.getRequestDispatcher("password_change_success.jsp").forward(req, res);
						}
					}
				}else {
					errors.put("password_error", "現在のパスワードが違います");

					//レスポンス値をセット 6
					req.setAttribute("errors", errors);

					// JSPへフォワード 7
					req.getRequestDispatcher("password_change.jsp").forward(req, res);
				}
			}else{
				errors.put("password_error", "パスワードは16文字以内で入力してください");

				//レスポンス値をセット 6
				req.setAttribute("errors", errors);

				// JSPへフォワード 7
				req.getRequestDispatcher("password_change.jsp").forward(req, res);
			}
		}else{
			errors.put("password_error", "パスワードが一致しません");

			//レスポンス値をセット 6
			req.setAttribute("errors", errors);

			// JSPへフォワード 7
			req.getRequestDispatcher("password_change.jsp").forward(req, res);
		}
	}

}
