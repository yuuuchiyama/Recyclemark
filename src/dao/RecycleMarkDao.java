package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.RecycleMark;;

public class RecycleMarkDao extends Dao {

	/** リサイクルマークを全件取得するメソッド */
	public List<RecycleMark> getMarkAll() throws Exception {
		// リストを初期化
		List<RecycleMark> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT * FROM recyclemarkdata");
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				RecycleMark recycleMark = new RecycleMark();
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("recycleid"));
				recycleMark.setMarkImg(rSet.getString("RecycleImg"));
				recycleMark.setSearchCount(rSet.getInt("SearchCnt"));
				recycleMark.setMarkName(rSet.getString("RecycleName"));
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

	/** 特徴に応じたリサイクルマーク取得するメソッド */
	public List<RecycleMark> getRecyclemark(String trait) throws Exception {
		// リストを初期化
		List<RecycleMark> list = new ArrayList<>();
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		// SQL文の条件
		String join = " inner join recyclemarkdata_japanese detail on mark.recycleid = detail.recycleid"; // detail（意味：詳細）
		String condition = " where CONCAT(ifnull(MaterialWord1,''),ifnull(MaterialWord2,''),ifnull(MaterialWord3,''),ifnull(GoodsWord1,''),ifnull(GoodsWord2,''),ifnull(GoodsWord3,''),ifnull(GoodsWord4,''),ifnull(GoodsWord5,'')) like ?";

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("SELECT mark.recycleid, mark.RecycleImg, mark.SearchCnt, detail.RecycleName FROM recyclemarkdata mark" + join + condition);
			// プリペアードステートメントに特徴をバインド
			statement.setString(1, "%%" + trait + "%%");
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();

			// リザルトセットを全権走査
			while (rSet.next()) {
				// リサイクルマークインスタンスを初期化
				RecycleMark recycleMark = new RecycleMark();
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("recycleid"));
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
				recycleMark.setMarkId(rSet.getInt("recycleid"));
				recycleMark.setMarkImg(rSet.getString("RecycleImg"));
				recycleMark.setSearchCount(rSet.getInt("SearchCnt"));
				// リストに追加
				list.add(recycleMark);
//				System.out.println(recycleMark);
//				System.out.println(recycleMark.getMarkId());
//				System.out.println(recycleMark.getMarkImg());
//				System.out.println(recycleMark.getSearchCount());
			}
		} catch (Exception e) {
//			System.out.println("error");
//			System.out.println(e);
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

	public RecycleMark getHistory(int recycleid) throws Exception {

		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;
		// リサイクルマークインスタンスを初期化
		RecycleMark recycleMark = new RecycleMark();
		// SQL文の条件
		String join = " inner join recyclemarkdata_japanese japanese on mark.recycleid = japanese.recycleid";
		String condition = " where japanese.recycleid = ?;";
		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select mark.recycleid, mark.RecycleImg, japanese.RecycleName from recyclemarkdata mark" + join + condition);
			// プリペアードステートメントにユーザIDをバインド
			statement.setInt(1, recycleid);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();
			// リザルトセットを全権走査
			if (rSet.next()) {
				// リサイクルマークインスタンスに検索結果をセット
				recycleMark.setMarkId(rSet.getInt("recycleid"));
				recycleMark.setMarkImg(rSet.getString("RecycleImg"));
				recycleMark.setMarkName(rSet.getString("RecycleName"));
			}else{
				return null;
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

		return recycleMark;
	}

	public String getName(int recycleid) throws Exception {
		String name = "";
		// コネクションを確立
		Connection connection = getConnection();
		// プリペアードステートメント
		PreparedStatement statement = null;

		try {
			// プリペアードステートメントにSQL文をセット
			statement = connection.prepareStatement("select RecycleName from recyclemarkdata_japanese where recycleid = ?");
			// プリペアードステートメントにユーザIDをバインド
			statement.setInt(1, recycleid);
			// プリペアードステートメントを実行
			ResultSet rSet = statement.executeQuery();
			// リザルトセットを全権走査
			if (rSet.next()) {
				// リサイクルマークインスタンスに検索結果をセット
				name = rSet.getString("RecycleName");
			}else{
				return null;
			}
		} catch (Exception e) {
//			System.out.println("error");
//			System.out.println(e);
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

		return name;
	}

}
