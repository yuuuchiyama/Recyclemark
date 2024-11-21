package recyclemarkback.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecycleMark;
import dao.RecycleMarkDao;
import tool.Action;


public class RankingAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "";
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();

		//リクエストパラメータ―の取得 2

		//DBからデータ取得 3
		List<RecycleMark> recycleMarks = recycleMarkDao.getRanking();//リサイクルマークリスト

		//ビジネスロジック 4
		//DBへデータ保存 5
		//レスポンス値をセット 6
		//フォワード 7
		//条件で手順4~7の内容が分岐
		if (recycleMarks != null) {// 認証成功の場合

			ArrayList<Integer> rankList = new ArrayList<>();
			int rank1 = recycleMarks.get(0).getSearchCount();
			int count = 1;
			for(RecycleMark recycleMark : recycleMarks){
				int rank2 = recycleMark.getSearchCount();
				if(rank1 == rank2){
					rankList.add(count);
				}else{
					count++;
					rankList.add(count);
				}
				rank1 = rank2;
			}
			req.setAttribute("recycleMark", recycleMarks);
			req.setAttribute("rankList", rankList);

			//フォワード
			url = "ranking.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		} else {
			// 認証失敗の場合
			// エラーメッセージをセット
			List<String> errors = new ArrayList<>();
			errors.add("ランキングを取得できませんでした");
			req.setAttribute("errors", errors);

			//フォワード
			url = "menu.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

//		req.getRequestDispatcher(url).forward(req, res);
	}

}

