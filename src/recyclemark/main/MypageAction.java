package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
public class MypageAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
//		HttpSession session = req.getSession();//セッション
//		User user = (User)session.getAttribute("user");
//		String mail = user.getMailAddress();
//		String password = user.getPassword();
		//リクエストパラメータ―の取得 2
		//なし
		//DBからデータ取得 3
		//なし
		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
//		req.setAttribute("mail", id);
//		req.setAttribute("id", id);
		//JSPへフォワード 7
		req.getRequestDispatcher("mypage.jsp").forward(req, res);
	}
}
