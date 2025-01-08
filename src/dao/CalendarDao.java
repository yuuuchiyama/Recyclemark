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

	/** 日付に応じた予定があるかを探すメソッド */
	public boolean searchSchedule(String userId, String date) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String condition = " where userId = ? AND CalendarDate = ?";

		// 実行件数
		int count = 0;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT * FROM calendar" + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, userId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();
			if (rSet.next()) {
				count = 1;
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

		if (count > 0) {
			// 実行件数がある場合
			return true;
		} else {
			// 実行件数がない場合
			return false;
		}
	}

	/** 新規予定登録 */
	public boolean createSchedule(String date, int userId, int stampId, String stampImg, String memo) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String sql = "insert into calendar value(?, ?, ?, ?, ?)";
		// 実行件数
		int count = 0;
		try {
			// プリペアードステートメントにUPDATE文をセット
			statement = connection.prepareStatement(sql);
			// プリペアードステートメントに値をバインド
			statement.setString(1, date);
			statement.setInt(2, userId);
			statement.setInt(3, stampId);
			statement.setString(4, stampImg);
			statement.setString(5, memo);
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

	/** 予定削除 */
	public boolean delete(String userId, String date) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String condition = "where UserId = ? AND CalendarDate = ?";
		// 実行件数
		int count = 0;
		try {

			// プリペアードステートメントにUPDATE文をセット
			statement = connection.prepareStatement("delete from calendar" + condition);
			// プリペアードステートメントに値をバインド
			statement.setString(1, userId);
			statement.setString(1, date);
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
}
