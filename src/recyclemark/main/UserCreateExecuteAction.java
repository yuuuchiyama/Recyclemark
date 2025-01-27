package recyclemark.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import tool.Action;


public class UserCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// student_create.jspからデータを受け取る
		String mail=req.getParameter("mail");
		String password=req.getParameter("password");
		String url = "";
		String error;
		UserDao userDao = new UserDao();
//		User user = userDao.get(mail);
		if(password.length() <= 16){
			if(userDao.get(mail) == null){
				userDao.create(mail, password);
				res.sendRedirect("../login.jsp");
			}else{
				error = "既にアカウントが存在しています。";
				req.setAttribute("error", error);

				//フォワード
				url = "create.jsp";
				req.getRequestDispatcher(url).forward(req, res);

			}
		}else{
			error = "パスワードは16文字以内で入力してください";
			req.setAttribute("error", error);

			//フォワード
			url = "create.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

	}

}
