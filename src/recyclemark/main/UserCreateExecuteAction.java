package recyclemark.main;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import tool.Action;


public class UserCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// student_create.jspからデータを受け取る
		String email=request.getParameter("mail");
		String password=request.getParameter("password");

		UserDao uesrDao = new UserDao();



        // 入力画面にフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("student_create.jsp");
        dispatcher.forward(request, response);
	}

}
