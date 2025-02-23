package recyclemark.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Ranking;
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
		HttpSession session = req.getSession();
		String language = (String)session.getAttribute("language");

		//DBからデータ取得 3
		List<RecycleMark> recycleMarks = recycleMarkDao.getRanking();//リサイクルマークリスト

		//条件で手順4~7の内容が分岐
		if (recycleMarks != null) {// 認証成功の場合

			ArrayList<String> rankUrlList = new ArrayList<>();
			ArrayList<Ranking> rankingList = new ArrayList<>();

			int rank1 = recycleMarks.get(0).getSearchCount();
			int count = 1;

			for(RecycleMark recycleMark : recycleMarks){
				int rank2 = recycleMark.getSearchCount();

				if(rank1 == rank2){
					rankUrl = "../../images/" + count + ".png";
					rankUrlList.add(rankUrl);
				}else{
					count++;
					if(count == 4){
						break;
					}
					rankUrl = "../../images/" + count + ".png";
					rankUrlList.add(rankUrl);
				}

				rank1 = rank2;
			}
//			System.out.println(rankUrlList);
			count = 0;
			for(String rankUrl2 : rankUrlList){

				Ranking ranking = new Ranking();

				int markId = recycleMarks.get(count).getMarkId();
				String imgUrl = recycleMarks.get(count).getMarkImg();
				String name = recycleMarkDao.getName(markId,language);

				ranking.setRankUrl(rankUrl2);
				ranking.setImgUrl(imgUrl);
				ranking.setName(name);
				ranking.setMarkId(markId);
				rankingList.add(ranking);

				count++;
			}

			// 内山追加
			// セッション情報の取得
			String forRanking = "1";
			// セッション情報の追加
			session.setAttribute("forRanking", forRanking);

			req.setAttribute("rankinglist", rankingList);

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
	}
}

