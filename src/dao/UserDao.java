package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;

public class UserDao extends Dao {
	/**
	 * getメソッド 教員IDを指定して教員インスタンスを1件取得する
	 *
	 * @param id:String
	 *            教員ID
	 * @return 教員クラスのインスタンス 存在しない場合はnull
	 * @throws Exception
	 */
	public User get(String id) throws Exception {
		// 教員インスタンスを初期化
		User user = new User();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select * from user where id=?");
			// プリペアードステートメントに教員IDをバインド
			statement.setString(1, id);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) {
				// リザルトセットが存在する場合
				// 教員インスタンスに検索結果をセット
				user.setId(rSet.getString("id"));
				user.setPassword(rSet.getString("password"));
			} else {
				// リザルトセットが存在しない場合
				// 教員インスタンスにnullをセット
				user = null;
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

		return user;
	}

	/**
	 * loginメソッド 教員IDとパスワードで認証する
	 *
	 * @param id:String
	 *            教員ID
	 * @param password:String
	 *            パスワード
	 * @return 認証成功:教員クラスのインスタンス, 認証失敗:null
	 * @throws Exception
	 */
	public User login(String id, String password) throws Exception {
		// 教員クラスのインスタンスを取得
		User user = get(id);
		// 教員がnullまたはパスワードが一致しない場合
		if (user == null || !user.getPassword().equals(password)) {
			return null;
		}
		return user;
	}
}
