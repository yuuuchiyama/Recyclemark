package recyclemark.main;

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
		String rankUrl = "";
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();
//		RecycleMark recycleMark = null;


		//リクエストパラメータ―の取得 2

		//DBからデータ取得 3
		List<RecycleMark> recycleMarks = recycleMarkDao.getRanking();//リサイクルマークリスト
//		System.out.println(recycleMarks);
		String img = recycleMarks.get(0).getMarkImg();
		//ビジネスロジック 4
		//DBへデータ保存 5
		//レスポンス値をセット 6
		//フォワード 7
		//条件で手順4~7の内容が分岐
		if (recycleMarks != null) {// 認証成功の場合
//			System.out.println("1");
			ArrayList<String> rankList = new ArrayList<>();

//			recycleMark = recycleMarks.get(0);
			int rank1 = recycleMarks.get(0).getSearchCount();
//			System.out.println(recycleMarks.get(0).getMarkImg());
			int count = 1;
			for(RecycleMark recycleMark : recycleMarks){
				int rank2 = recycleMark.getSearchCount();
				if(rank1 == rank2){
					rankUrl = "../../images/" + count + ".gif";
					rankList.add(rankUrl);
				}else{
					count++;
					rankList.add(rankUrl);
				}
				rank1 = rank2;
			}
			System.out.println(rankList);
			req.setAttribute("recycleMarks", recycleMarks);
			req.setAttribute("img", img);
			req.setAttribute("rankList", rankList);

			//フォワード
			url = "ranking.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		} else {
//			System.out.println("0");
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

