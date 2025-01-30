package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import tool.Action;


public class PasswordResetAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String mail = "";
		UserDao userDao = new UserDao();
		String error = "";

		//リクエストパラメータ―の取得 2
		mail = req.getParameter("mail");

		//DBからデータ取得 3

		//ビジネスロジック 4

		//DBへデータ保存 5

		//レスポンス値をセット 6

		//フォワード 7
		if(userDao.get(mail) != null){
			req.getRequestDispatcher("SendMail.action").forward(req, res);
		}else{
			error = "入力されたメールアドレスは存在しません";
			req.setAttribute("error", error);

			req.getRequestDispatcher("reset_mail.jsp").forward(req, res);
		}

	}
}
