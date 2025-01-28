package recyclemark.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;
import tool.Action;


public class PasswordResetExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String mail = "";
		String password1 = "";
		String password2 = "";
		UserDao userDao = new UserDao();
		User user = new User();
		Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		//リクエストパラメータ―の取得 2
		mail = req.getParameter("mail");
		password1 = req.getParameter("password1");//パスワード
		password2 = req.getParameter("password2");//パスワード

		//DBからデータ取得 3
		user = userDao.get(mail);

		//条件で手順4~7の内容が分岐
		//ビジネスロジック 4
		if(password1.equals(password2)){	// 入力された2つのパスワードが同じか判別
			if (user.getPassword().equals(password1)) {		// 新しいパスワードが登録されているパスワードと違うものか判別
				errors.put("password_error", "入力されたパスワードは使えません");

				//レスポンス値をセット 6
				req.setAttribute("errors", errors);

				// JSPへフォワード 7
				req.getRequestDispatcher("password_reset.jsp").forward(req, res);
			}else {
				//DBへデータ保存 5
				if(userDao.save(password1, Integer.parseInt(user.getId()))){

					// JSPへフォワード 7
					req.getRequestDispatcher("password_reset_success.jsp").forward(req, res);
				}
			}
		}
	}
}
