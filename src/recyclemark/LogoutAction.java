package recyclemark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LogoutAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		int logout = 1;
		HttpSession session = req.getSession();
		session.invalidate();

		req.setAttribute("logout", logout);

		req.getRequestDispatcher("login.jsp").forward(req, res);
	}
}
