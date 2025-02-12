package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Favorite;

public class FavoriteDao extends Dao {
	/** ユーザーのIDをもとにお気に入りリサイクルマークを取得する */
	public List<Favorite> getFavorite(String userId) throws Exception {
		// リストを初期化
		List<Favorite> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String join = " inner join favdata favorite on mark.RecycleId = favorite.RecycleId";
		String condition = " where favorite.UserId = ?";  // ?はユーザーID

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select favorite.FavId, favorite.UserId, favorite.RecycleId, RecycleName, mark.RecycleImg from recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, userId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				Favorite favorite = new Favorite();
				// リサイクルマークインスタンスに検索結果をセット
				favorite.setFavId(rSet.getInt("FavId"));
				favorite.setUserId(rSet.getString("UserId"));
				favorite.setRecycleId(rSet.getInt("RecycleId"));
				favorite.setRecycleName(rSet.getString("RecycleName"));
				favorite.setRecycleImg(rSet.getString("RecycleImg"));
				System.out.println(favorite.getFavId());
				System.out.println(favorite.getUserId());
				System.out.println(favorite.getRecycleId());
				System.out.println(favorite.getRecycleName());
				System.out.println(favorite.getRecycleImg());
				// リストに追加
				list.add(favorite);
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

	/** userIdとmarkIdからリサイクルマークがお気に入り登録されているかを判別する */
	public boolean getRegisteredFav(String userId, String markId) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String join = " inner join favdata fav on mark.RecycleId = fav.RecycleId";
		String condition = " where fav.UserId = ? and fav.RecycleID = ?;";  // ?はユーザーID

		// カウント変数の宣言
		int valueCnt = 0;
		int count = 0;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT count(mark.RecycleId) as count FROM recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, userId);
			statement.setString(2, markId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			rSet.next();
			valueCnt = rSet.getInt("count");
			System.out.println(valueCnt);

			// リザルトセットを全権走査
			// 登録済みのリサイクルマークがある場合
			if (valueCnt != 0) {
				count ++;
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

		// 実行件数が1件以上ある場合
		if (count > 0) {
			return true;

		// 実行件数が0件の場合
		} else {
			return false;
		}
	}

	/** お気に入りリサイクルマークを登録する */
	public int saveFavorite(int heartStamp, int userId, int markId) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String condition = " where UserId = ? and RecycleID = ?;";

		// カウント変数の宣言
		int insertCnt = 0;

		try {
			if (heartStamp == 0) {
				// プリペアードステートメントにSQL文をセット
				statement = connection.prepareStatement("insert into favdata values(?, ?, ?)");
				// プリペアードステートメントに値をバインド
				statement.setString(1, null);
				statement.setInt(2, userId);
				statement.setInt(3, markId);

				// プリペアードステートメントを実行
				insertCnt = statement.executeUpdate();
			} else {
				// プリペアードステートメントにSQL文をセット
				statement = connection.prepareStatement("DELETE FROM favdata" + condition);
				// プリペアードステートメントに値をバインド
				statement.setInt(1, userId);
				statement.setInt(2, markId);

				// プリペアードステートメントを実行
				statement.executeUpdate();
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
		// 実行件数が1件以上ある場合
		if (insertCnt > 0) {
			heartStamp ++;
			return heartStamp;

		// 実行件数が0件の場合
		} else {
			heartStamp --;
			return heartStamp;
		}
	}
}
