package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import tool.Action;


public class PasswordResetAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String mail = "";
		String forlogin = "0";

		//リクエストパラメータ―の取得 2
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		mail = req.getParameter("mail");//パスワード
		forlogin = req.getParameter("forlogin");
		System.out.println(forlogin);

		//DBからデータ取得 3


		//ビジネスロジック 4


		//DBへデータ保存 5
		//レスポンス値をセット 6
		//フォワード 7
		//条件で手順4~7の内容が分岐
//		if(user.getMailAddress().equals(mail)){
//			req.getRequestDispatcher("SendMail.action").forward(req, res);
//		}
		req.getRequestDispatcher("SendMail.action").forward(req, res);
	}
}
