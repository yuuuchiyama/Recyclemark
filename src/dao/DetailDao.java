package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Detail;;

public class DetailDao extends Dao {
	/** リサイクルマークの詳細情報を取得するメソッド */
	public Detail getData(String markId, String language) throws Exception {
		// リサイクルマークインスタンスを初期化
		Detail detail = new Detail();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		String select = "japanese";

		if(language != null){
			if(language.equals("日本語")){
				select = "japanese";
			}else if(language.equals("English")){
				select = "english";
			}else if(language.equals("한국어")){
				select = "korean";
			}else if(language.equals("中文")){
				select = "chinese";
			}
		}

		// SQL文の条件
		String join = " inner join recyclemarkdata_"+ select +" detail on mark.RecycleId = detail.RecycleId"; // detail（意味：詳細）
		String condition = " where detail.RecycleId = ?;";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT mark.RecycleId, mark.RecycleImg, detail.RecycleName, detail.RecycleDescribe FROM recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, markId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			if (rSet.next()) {
				// リザルトセットが存在する場合
				// リサイクルマークインスタンスに検索結果をセット
				detail.setMarkId(rSet.getInt("RecycleId"));
				detail.setMarkImg(rSet.getString("RecycleImg"));
				detail.setMarkName(rSet.getString("RecycleName"));
				detail.setMarkDescribe(rSet.getString("RecycleDescribe"));
			} else {
				// リザルトセットが存在しない場合
				// 詳細インスタンスにnullをセット
				detail = null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			// プリペアードステートメントを閉じる
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			// コネクションを閉じる
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return detail;
	}
}
