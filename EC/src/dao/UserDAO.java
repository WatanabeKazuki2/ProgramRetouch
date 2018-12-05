package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import base.DBManager;
import beans.BuyDataBeans;
import beans.UserDataBeans;
import ec.EcHelper;

/**
 *
 * @author d-yamaguchi
 *
 */
public class UserDAO {
	// インスタンスオブジェクトを返却させてコードの簡略化

	/**
	 * データの挿入処理を行う。現在時刻は挿入直前に生成
	 *
	 * @param user
	 *            対応したデータを保持しているJavaBeans
	 * @throws SQLException
	 *             呼び出し元にcatchさせるためにスロー
	 */
	public static void insertUser(UserDataBeans udb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO t_user(name,login_id,address,login_password,create_date) VALUES(?,?,?,?,?)");
			st.setString(1, udb.getName());
			st.setString(2, udb.getLoginId());
			st.setString(3, udb.getAddress());
			st.setString(4, EcHelper.getSha256(udb.getPassword()));
			st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			st.executeUpdate();
			System.out.println("inserting user has been completed");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * ユーザーIDを取得
	 *
	 * @param loginId
	 *            ログインID
	 * @param password
	 *            パスワード
	 * @return int ログインIDとパスワードが正しい場合対象のユーザーID 正しくない||登録されていない場合0
	 * @throws SQLException
	 *             呼び出し元にスロー
	 */
	public static int getUserId(String loginId, String password) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM t_user WHERE login_id = ?");
			st.setString(1, loginId);

			ResultSet rs = st.executeQuery();

			int userId = 0;
			while (rs.next()) {
				if (EcHelper.getSha256(password).equals(rs.getString("login_password"))) {
					userId = rs.getInt("id");
					System.out.println("login succeeded");
					break;
				}
			}

			System.out.println("searching userId by loginId has been completed");
			return userId;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * ユーザーIDからユーザー情報を取得する
	 *
	 * @param useId
	 *            ユーザーID
	 * @return udbList 引数から受け取った値に対応するデータを格納する
	 * @throws SQLException
	 *             呼び出し元にcatchさせるためスロー
	 */
	public static UserDataBeans getUserDataBeansByUserId(int userId) throws SQLException {
		UserDataBeans udb = new UserDataBeans();
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT id,name, login_id, address FROM t_user WHERE id =" + userId);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				udb.setId(rs.getInt("id"));
				udb.setName(rs.getString("name"));
				udb.setLoginId(rs.getString("login_id"));
				udb.setAddress(rs.getString("address"));
			}

			st.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}

		System.out.println("searching UserDataBeans by userId has been completed");
		return udb;
	}

	/**
	 * ユーザー情報の更新処理を行う。
	 *
	 * @param user
	 *            対応したデータを保持しているJavaBeans
	 * @throws SQLException
	 *             呼び出し元にcatchさせるためにスロー
	 */
	public static void updateUser(UserDataBeans udb) throws SQLException {
		// 更新された情報をセットされたJavaBeansのリスト
		UserDataBeans updatedUdb = new UserDataBeans();
		Connection con = null;
		PreparedStatement st = null;

		try {

			con = DBManager.getConnection();
			st = con.prepareStatement("UPDATE t_user SET name=?, login_id=?, address=? WHERE id=?;");
			st.setString(1, udb.getName());
			st.setString(2, udb.getLoginId());
			st.setString(3, udb.getAddress());
			st.setInt(4, udb.getId());
			st.executeUpdate();
			System.out.println("update has been completed");

			st = con.prepareStatement("SELECT name, login_id, address FROM t_user WHERE id=" + udb.getId());
			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				updatedUdb.setName(rs.getString("name"));
				updatedUdb.setLoginId(rs.getString("login_id"));
				updatedUdb.setAddress(rs.getString("address"));
			}

			st.close();
			System.out.println("searching updated-UserDataBeans has been completed");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * loginIdの重複チェック
	 *
	 * @param loginId
	 *            check対象のログインID
	 * @param userId
	 *            check対象から除外するuserID
	 * @return bool 重複している
	 * @throws SQLException
	 */
	public static boolean isOverlapLoginId(String loginId, int userId) throws SQLException {
		// 重複しているかどうか表す変数
		boolean isOverlap = false;
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			// 入力されたlogin_idが存在するか調べる
			st = con.prepareStatement("SELECT login_id FROM t_user WHERE login_id = ? AND id != ?");
			st.setString(1, loginId);
			st.setInt(2, userId);
			ResultSet rs = st.executeQuery();

			System.out.println("searching loginId by inputLoginId has been completed");

			if (rs.next()) {
				isOverlap = true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}

		System.out.println("overlap check has been completed");
		return isOverlap;
	}

	//購入履歴用
	public static List<BuyDataBeans> buyHistoryAll(int userId) throws SQLException, ParseException{
		List<BuyDataBeans> buyHistoryList = new ArrayList<BuyDataBeans>();
		PreparedStatement st = null;
		Connection con = DBManager.getConnection();
		try {

			//購入履歴のテーブルを全件取得の準備
			st = con.prepareStatement("SELECT \n" +
					"t_buy.user_id\n" +
					",t_buy.total_price\n" +
					",t_buy.create_date\n" +
					",m_delivery_method.name\n" +
					"FROM\n" +
					"t_buy INNER JOIN m_delivery_method\n" +
					"ON \n" +
					"t_buy.delivery_method_id = m_delivery_method.id\n"
					+ "WHERE\n"
					+ "user_id = ?\n"
					+ "ORDER BY \n" +
					"t_buy.create_date DESC;")	;
			st.setInt(1,userId);
			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				userId = rs.getInt("t_buy.user_id");
				int totalPrice = rs.getInt("t_buy.total_price");
				String deliveryMethodName = rs.getString("m_delivery_method.name");
				Date createDate = rs.getTimestamp("t_buy.create_date");
				BuyDataBeans buyDatabeans = new BuyDataBeans(userId,totalPrice,deliveryMethodName,createDate);
				buyHistoryList.add(buyDatabeans);
			}
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}


		return buyHistoryList;
	}
	//購入履歴詳細用
	@SuppressWarnings({ "null", "finally" })
	public static BuyDataBeans buyHistory(int userId) {
		Connection con = DBManager.getConnection();
		PreparedStatement st = null;
		try {
			con.prepareStatement("SELECT\n" +
					"t_buy.user_id,\n" +
					"t_buy.total_price,\n" +
					"t_buy.create_date,\n" +
					"m_delivery_method.name\n" +
					"FROM\n" +
					"t_buy INNER JOIN m_delivery_method\n" +
					"ON\n" +
					"t_buy.delivery_method_id = m_delivery_method.id\n" +
					"WHERE\n" +
					"t_buy.id = ? ; ");
			st.setInt(1, userId);
			ResultSet rs = st.executeQuery();

			userId = rs.getInt("t_buy.user_id");
			int totalPrice = rs.getInt("t_buy.total_price");
			String deliveryMethodName = rs.getString("m_delivery_method.name");
			Date createDate = rs.getTimestamp("t_buy.create_date");
			return new BuyDataBeans(userId,totalPrice,deliveryMethodName,createDate);

		}catch(SQLException e){
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		return null;

	}
}
}