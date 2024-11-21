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

		UserDao userDao = new UserDao();

		userDao.create(mail, password);

		//JSPへフォワード 7
		req.getRequestDispatcher("login.jsp").forward(req, res);
	}

}
