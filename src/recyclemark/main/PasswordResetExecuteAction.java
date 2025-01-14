package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDao;
import tool.Action;


public class PasswordResetExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String password1 = "";
		String password2 = "";
		UserDao userDao = new UserDao();

		//リクエストパラメータ―の取得 2
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		password1 = req.getParameter("password1");//パスワード
		password2 = req.getParameter("password2");//パスワード

		//DBからデータ取得 3


		//ビジネスロジック 4
		//DBへデータ保存 5
		if(password1.equals(password2)){
			if(userDao.save(password1, Integer.parseInt(user.getId()))){
				req.getRequestDispatcher("password_reset_success.jsp").forward(req, res);
			}
		}
		//レスポンス値をセット 6
		//フォワード 7
		//条件で手順4~7の内容が分岐

	}
}
