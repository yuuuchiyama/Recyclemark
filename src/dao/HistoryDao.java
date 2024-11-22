package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import bean.RecycleMark;

public class HistoryDao extends Dao {

	public boolean save(String userid,String recycleid) throws Exception{
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String sql = "insert into user (SearchId,UserId,RecycleID,SearchTime) values (?,?,?,?)";
		// 実行件数
		int count = 0;
		//現在時刻
		LocalDateTime nowDate = LocalDateTime.now();
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatNowDate = dtf1.format(nowDate);
		try {

			// プリペアードステートメントにUPDATE文をセット
			statement = connection.prepareStatement(sql);
			// プリペアードステートメントに値をバインド
			statement.setString(1, null);
			statement.setString(2, userid);
			statement.setString(3, recycleid);
			statement.setString(4, formatNowDate);
			// プリペアードステートメントを実行
			count = statement.executeUpdate();
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

		if (count > 0) {
			// 実行件数が1件以上ある場合
			return true;
		} else {
			// 実行件数が０件の場合
			return false;
		}
	}

	public List<History> getHistory() throws Exception {

		// リストを初期化
		List<History> list = new ArrayList<>();
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

