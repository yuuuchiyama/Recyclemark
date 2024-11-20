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

	public boolean create(String mail,String password) throws Exception {
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// SQL文の条件
		String sql = "insert into user (UserId,MailAddress,Password,LanguageSelect) values (?,?,?,?)";
		// 実行件数
		int count = 0;
		try {

			// プリペアードステートメントにUPDATE文をセット
			statement = connection.prepareStatement(sql);
			// プリペアードステートメントに値をバインド
			statement.setString(1, null);
			statement.setString(2, mail);
			statement.setString(3, password);
			statement.setString(4, "1");
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

