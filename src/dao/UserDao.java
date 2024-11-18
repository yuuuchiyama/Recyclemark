package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;

public class UserDao extends Dao {

	//ユーザ情報取得
	public User get(String id) throws Exception {
		// ユーザインスタンスを初期化
		User user = new User();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select * from user where UserId=?");
			// プリペアードステートメントにユーザIDをバインド
			statement.setString(1, id);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) {
				// リザルトセットが存在する場合
				// ユーザインスタンスに検索結果をセット
				user.setId(rSet.getString("UserId"));
				user.setPassword(rSet.getString("Password"));
			} else {
				// リザルトセットが存在しない場合
				// ユーザインスタンスにnullをセット
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

	//ユーザID、パスワード参照でログインする
	public User login(String id, String password) throws Exception {
		// ユーザクラスのインスタンスを取得
		User user = get(id);
		// ユーザがnullまたはパスワードが一致しない場合
		if (user == null || !user.getPassword().equals(password)) {
			return null;
		}
		return user;
	}
}
