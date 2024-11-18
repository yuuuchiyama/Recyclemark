package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.RecycleMark;;

public class RecycleMarkDao extends Dao {

	/** 特徴に応じたリサイクルマーク取得するメソッド */
	public RecycleMark getRecyclemark(String detail) throws Exception {
		// リサイクルマークインスタンスを初期化
		RecycleMark recycleMark = new RecycleMark();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String join = "inner join recyclemarkdata_japanese detail on markdata.RecycleId = detail.RecycleId"; // detail（意味：詳細）
		String condition = "where CONCAT(ifnull(MaterialWord1,''),ifnull(MaterialWord2,''),ifnull(MaterialWord3,'')) like '%?%'";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT mark.RecycleId, mark.RecycleImg, mark.SearchCnt FROM recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, detail);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) {
				// リザルトセットが存在する場合
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("RecycleId"));
				recycleMark.setMarkImg(rSet.getString("RecycleImg"));
				recycleMark.setSearchCount(rSet.getInt("SearchCnt"));
			} else {
				// リザルトセットが存在しない場合
				// 教員インスタンスにnullをセット
				recycleMark = null;
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

		return recycleMark;
	}
}
