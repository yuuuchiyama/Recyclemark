package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDao;
import tool.Action;


public class UserDeleteExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "";
		String password = "";
		String error = "";
		boolean delete = false;
		UserDao userDao = new UserDao();

		//リクエストパラメータ―の取得 2
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		password = req.getParameter("password");//パスワード

		//DBからデータ取得 3

		//条件で手順4~7の内容が分岐
		if(password.length() <= 16){
			if(password.equals(user.getPassword())){//パスワードが合っている場合

				delete = userDao.delete(user.getId());//アカウント削除
				//アカウント削除に成功した場合
				if(delete){
					// セッションオブジェクトを作成
					// 引数(false) → セッションがなければnullを返す
					HttpSession admin_session = req.getSession(false);

					if(admin_session != null) {
						System.out.println("セッションが存在しています。そのため、セッションを破棄します。");
						// セッションを破棄する
						admin_session.invalidate();
					} else {
						System.out.println("セッションが存在していません。");
					}

					admin_session = req.getSession(false);

					if(admin_session == null) {
						System.out.println("セッションが破棄されました。");
					};

					//リダイレクト
					url = "../Login.action";
					res.sendRedirect(url);
				}else{
					System.out.println("削除失敗");
					//リダイレクト
					url = "../Login.action";
					res.sendRedirect(url);
				}
			}else{
				error = "パスワードが一致しません";
				req.setAttribute("error", error);
				url = "delete.jsp";
				req.getRequestDispatcher(url).forward(req, res);
			}
		}else{
			error = "パスワードは16文字以内で入力してください";
			req.setAttribute("error", error);

			//フォワード
			url = "delete.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

	}
}
