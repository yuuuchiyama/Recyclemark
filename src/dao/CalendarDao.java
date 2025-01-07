package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Calendar;

public class CalendarDao extends Dao {
	/** userIdに対応するカレンダーの予定情報を取得するメソッド */
	public List<Calendar> getSchedule(String userId) throws Exception {
		// リストを初期化
		List<Calendar> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String condition = " where userId = ?;";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT * FROM calendar" + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, userId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// カレンダーインスタンスを初期化
				Calendar calendar = new Calendar();
				// リサイクルマークインスタンスに検索結果をセット
				calendar.setCalendarDate(rSet.getString("CalendarDate"));
				calendar.setUserId(rSet.getInt("UserId"));
				calendar.setStampId(rSet.getInt("StampId"));
				calendar.setStampImg(rSet.getString("StampImg"));
				calendar.setMemo(rSet.getString("Memo"));
				// リストに追加
				list.add(calendar);
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
