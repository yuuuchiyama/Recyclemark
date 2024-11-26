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
			statement = connection.prepareStatement("select favorite.FavId, favorite.UserId, favorite.RecycleId, mark.RecycleName, mark.RecycleImg from recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, userId);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				Favorite favorite = new Favorite();
				// リサイクルマークインスタンスに検索結果をセット
				favorite.setFavId(rSet.getInt("favorite.FavId"));
				favorite.setUserId(rSet.getString("favorite.UserId"));
				favorite.setRecycleId(rSet.getInt("favorite.RecycleId"));
				favorite.setRecycleName(rSet.getString("mark.RecycleName"));
				favorite.setRecycleImg(rSet.getString("mark.RecycleImg"));
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

	/** お気に入りリサイクルマークを登録する */
	public boolean saveFavorite(int heartStamp, int userId, int markId) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// カウント変数の宣言
		int count = 0;

		try {
			if (heartStamp == 1) {
				// プリペアードステートメントにSQL文をセット
				statement = connection.prepareStatement("insert into favdata values(?, ?, ?)");
				// プリペアードステートメントに教員IDをバインド
				statement.setString(1, null);
				statement.setInt(2, userId);
				statement.setInt(3, markId);
			} else {
				System.out.print("取り消し作成してないよ！");
			}

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
		// 実行件数が1件以上ある場合
		if (count > 0) {
			return true;

		// 実行件数が0件の場合
		} else {
			return false;
		}
	}
}
