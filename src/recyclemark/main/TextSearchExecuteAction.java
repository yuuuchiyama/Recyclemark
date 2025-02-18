package recyclemark.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.RecycleMark;
import dao.RecycleMarkDao;
import tool.Action;

public class TextSearchExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ローカル変数の宣言 1
		// セッション情報の取得
		HttpSession session = req.getSession();
		RecycleMarkDao recycleMarkDao = new RecycleMarkDao();	// Daoのインスタンス化
		List<RecycleMark> recycleMarks = null;
		Map<String, String> errors = new HashMap<>();	// エラーメッセージ

		String trait = null;


		// リクエストパラメーターの取得 2
		trait = (String)session.getAttribute("trait");
		String language = (String)session.getAttribute("language");
		System.out.println("セッションの方：" + trait);
		if (trait == null) {
			trait = req.getParameter("trait");
			System.out.println("セッションじゃ無い方：" + trait);
		}

		// DBからデータの取得 3
		recycleMarks = recycleMarkDao.getRecyclemark(trait,language);
		System.out.println(recycleMarks.size());

		//条件で手順4~7の内容が分岐
		// ビジネスロジック 4

		// 検索結果のデータの有無を判別
		if(recycleMarks.size() > 0) {
			// DBにデータを保存 5

			// レスポンス値をセット 6
			req.setAttribute("trait", trait);
			req.setAttribute("recycleMarks",recycleMarks);

			// セッションに格納されているtraitの値を削除
			session.removeAttribute("trait");

			// JSPへフォワード 7
			req.getRequestDispatcher("text_result.jsp").forward(req, res);
		} else {
			// レスポンス値をセット 6
			if(language != null){
				if(language.equals("日本語")){
					errors.put("mark_error", "そのリサイクルマークは存在しません");
				}else if(language.equals("English")){
					errors.put("mark_error", "Its recycling mark does not exist.");
				}else if(language.equals("한국어")){
					errors.put("mark_error", "그 재활용 마크는 존재하지 않습니다");
				}else if(language.equals("中文")){
					errors.put("mark_error", "其回收标志并不存在。");
				}
			}else{
				errors.put("mark_error", "そのリサイクルマークは存在しません");
			}
			req.setAttribute("errors", errors);
			req.setAttribute("trait", trait);

			// セッションに格納されているtraitの値を削除
			session.removeAttribute("trait");

			// JSPへフォワード 7
			req.getRequestDispatcher("text.jsp").forward(req, res);
		}
	}
}