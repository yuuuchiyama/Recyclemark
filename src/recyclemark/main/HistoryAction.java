package recyclemark.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.History;
import bean.RecycleMark;
import bean.User;
import dao.HistoryDao;
import dao.RecycleMarkDao;
import tool.Action;


public class HistoryAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "";
		HistoryDao historyDao = new HistoryDao();
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();
		HttpSession session = req.getSession();//セッション
		User user = (User)session.getAttribute("user");
		String language = (String)session.getAttribute("language");
		List<RecycleMark> recycleMarks = new ArrayList<RecycleMark>();


		//リクエストパラメータ―の取得 2

		//DBからデータ取得 3

		List<History> historys = historyDao.getHistory(user.getId());//履歴リスト
		for(History history : historys){
//			System.out.println(history.getRecycleId());

			recycleMarks.add(0,recycleMarkDao.getHistory(history.getRecycleId(),language));
		}
		System.out.println(recycleMarks);

		//ビジネスロジック 4
		//DBへデータ保存 5
		//レスポンス値をセット 6
		req.setAttribute("recyclemarks", recycleMarks);
		//フォワード 7
		url = "search_history.jsp";
		req.getRequestDispatcher(url).forward(req, res);

	}

}

