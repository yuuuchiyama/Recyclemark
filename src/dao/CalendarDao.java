package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Calendar;
import bean.Stampdata;

public class CalendarDao extends Dao {
	/** stampIdに対応するスタンプを取得するメソッド */
	public Stampdata getStamps(String stampId) throws Exception {
		// スタンプインスタンスを初期化
		Stampdata stampdata = new Stampdata();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String condition = " where stampId = ?;";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT * FROM stampdata" + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, stampId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットが存在する場合
			if (rSet.next()) {
				// スタンプインスタンスに検索結果をセット
				stampdata.setStampId(rSet.getInt("StampId"));
				stampdata.setStampNameJapanese(rSet.getString("StampNameJapanese"));
				stampdata.setStampNameEnglish(rSet.getString("StampNameEnglish"));
				stampdata.setStampNameChinese(rSet.getString("StampNameChinese"));
				stampdata.setStampNameKorean(rSet.getString("StampNameKorean"));
				stampdata.setStampImg(rSet.getString("StampImg"));

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

		return stampdata;
	}

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
				// カレンダーインスタンスに検索結果をセット
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

	/** 日付に応じた予定を取得するメソッド */
	public Calendar searchSchedule(String userId, String date) throws Exception {
		// カレンダーインスタンスを初期化
		Calendar calendar = new Calendar();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String condition = " where userId = ? AND CalendarDate = ?";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT * FROM calendar" + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, userId);
			statement.setString(2, date);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();
			if (rSet.next()) {
				// カレンダーインスタンスに検索結果をセット
				calendar.setCalendarDate(rSet.getString("CalendarDate"));
				calendar.setUserId(rSet.getInt("UserId"));
				calendar.setStampId(rSet.getInt("StampId"));
				calendar.setStampImg(rSet.getString("StampImg"));
				calendar.setMemo(rSet.getString("Memo"));
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
		return calendar;
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
		String condition = " where UserId = ? AND CalendarDate = ?";
		// 実行件数
		int count = 0;
		try {

			// プリペアードステートメントにUPDATE文をセット
			statement = connection.prepareStatement("delete from calendar" + condition);
			// プリペアードステートメントに値をバインド
			statement.setString(1, userId);
			statement.setString(2, date);
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
