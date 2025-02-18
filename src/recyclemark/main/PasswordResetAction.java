package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String forlogin = req.getParameter("forlogin");
		mail = req.getParameter("mail");

		//DBからデータ取得 3

		//ビジネスロジック 4

		//DBへデータ保存 5

		//レスポンス値をセット 6

		//フォワード 7
		if(userDao.get(mail) != null){
			req.getRequestDispatcher("SendMail.action").forward(req, res);
		}else{
			HttpSession session = req.getSession();
			String language = (String)session.getAttribute("language");
			if(language != null){
				if(language.equals("日本語")){
					error = "入力されたメールアドレスは存在しません";
				}else if(language.equals("English")){
					error = "The email address entered does not exist.";
				}else if(language.equals("한국어")){
					error = "입력하신 이메일 주소가 존재하지 않습니다.";
				}else if(language.equals("中文")){
					error = "输入的电子邮件地址不存在。";
				}
			}else{
				error = "入力されたメールアドレスは存在しません";
			}
			req.setAttribute("error", error);
			req.setAttribute("forlogin", forlogin);
			// JSPへフォワード 7
			req.getRequestDispatcher("reset_mail.jsp").forward(req, res);
		}

	}
}
