package recyclemark;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import tool.Action;
public class LanguageSelectAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		String url = "login.jsp";
		ObjectMapper mapper = new ObjectMapper();
		//リクエストパラメータ―の取得 2
		String language = req.getParameter("language");//言語
		//DBからデータ取得 3
		try {
            JsonNode node = mapper.readTree(new File("/recyclemark/WebContent/JSON/login_l.json"));
//
            
//            int age = node.get("age").asInt();
//            System.out.println(age);
//
//            String city = node.get("address").get("city").asText();
//            System.out.println(city);
//
//            String number = node.get("phoneNumbers").get(0).get("number").asText();
//            System.out.println(number);
    		req.setAttribute("node", node);
        } catch (IOException e) {
            e.printStackTrace();
        }
		//ビジネスロジック 4
		//なし
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		// セッション情報を取得
		HttpSession session = req.getSession(true);
		// セッションにログイン情報を保存
		session.setAttribute("language", language);

		//JSPへフォワード 7
		req.getRequestDispatcher(url).forward(req, res);
	}
}
