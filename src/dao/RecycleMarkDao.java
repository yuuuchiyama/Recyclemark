package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.RecycleMark;;

public class RecycleMarkDao extends Dao {

	/** 特徴に応じたリサイクルマーク取得するメソッド */
	public List<RecycleMark> getRecyclemark(String detail) throws Exception {
		// リストを初期化
		List<RecycleMark> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String join = " inner join recyclemarkdata_japanese detail on mark.RecycleId = detail.RecycleId"; // detail（意味：詳細）
		String condition = " where CONCAT(ifnull(MaterialWord1,''),ifnull(MaterialWord2,''),ifnull(MaterialWord3,'')) like ?";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT mark.RecycleId, mark.RecycleImg, mark.SearchCnt, detail.RecycleName FROM recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, "%%" + detail + "%%");
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				RecycleMark recycleMark = new RecycleMark();
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("mark.RecycleId"));
				recycleMark.setMarkImg(rSet.getString("mark.RecycleImg"));
				recycleMark.setSearchCount(rSet.getInt("mark.SearchCnt"));
				recycleMark.setMarkName(rSet.getString("detail.RecycleName"));
				// リストに追加
				list.add(recycleMark);
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

		return list;
	}

	public List<RecycleMark> getRanking() throws Exception {

		// リストを初期化
		List<RecycleMark> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select * from recyclemarkdata order by SearchCnt desc");
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();
			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				RecycleMark recycleMark = new RecycleMark();
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("RecycleId"));
				recycleMark.setMarkImg(rSet.getString("RecycleImg"));
				recycleMark.setSearchCount(rSet.getInt("SearchCnt"));
				// リストに追加
				list.add(recycleMark);
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

		return list;
	}
}
