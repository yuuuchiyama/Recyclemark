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
//		String img = recycleMarks.get(0).getMarkImg();
		//ビジネスロジック 4
		//DBへデータ保存 5
		//レスポンス値をセット 6
		//フォワード 7
		//条件で手順4~7の内容が分岐
		if (recycleMarks != null) {// 認証成功の場合
//			System.out.println("1");
			ArrayList<String> rankList = new ArrayList<>();
			ArrayList<String> rankingList = new ArrayList<>();
			ArrayList<String> ranking = new ArrayList<>();


//			recycleMark = recycleMarks.get(0);
			int rank1 = recycleMarks.get(0).getSearchCount();
//			System.out.println(recycleMarks.get(0).getMarkImg());
			int count = 1;
			for(RecycleMark recycleMark : recycleMarks){
				int rank2 = recycleMark.getSearchCount();
//				System.out.println(rank1+":"+rank2);
//				System.out.println(rank1 == rank2);
				if(rank1 == rank2){
					rankUrl = "../../images/" + count + ".png";
					rankList.add(rankUrl);
				}else{
					count++;
					if(count == 4){
						break;
					}
					rankUrl = "../../images/" + count + ".png";
					rankList.add(rankUrl);
				}
//				System.out.println(count);
				rank1 = rank2;
			}
//			System.out.println(rankList);
			count = 0;
			for(String rank : rankList){
//				System.out.println(rank);
//				System.out.println(recycleMarks.get(count).getMarkImg());
//				System.out.println(ranking);
//				System.out.println(count);
				ranking.add(rank);
				ranking.add(recycleMarks.get(count).getMarkImg());
				rankingList.addAll(ranking);
				ranking.clear();
				count++;
			}
			System.out.println(rankingList);
//			req.setAttribute("recycleMarks", recycleMarks);
//			req.setAttribute("img", img);
//			req.setAttribute("rankList", rankList);
			req.setAttribute("rankinglist", rankingList);

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

