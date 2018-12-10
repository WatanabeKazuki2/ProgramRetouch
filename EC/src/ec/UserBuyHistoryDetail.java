package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.ItemDataBeans;
import dao.BuyDetailDAO;
import dao.UserDAO;

/**
 * 購入履歴画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションの開始
		HttpSession session = request.getSession();
		try {
			// ログイン時に取得したユーザーIDをセッションから取得
			int userId = (int) session.getAttribute("userId");
			//userdate.jspからidの値を取得
			int id = Integer.parseInt(request.getParameter("id"));

			//userIdとidから指定した履歴情報を取得
			BuyDataBeans userHistory= UserDAO.buyHistory(id,userId);
			//リクエストスコープにセット
			request.setAttribute("userHistory", userHistory);

			//idから品物のデータを取得
			ArrayList<ItemDataBeans> itemHistoryList = BuyDetailDAO.getItemDataBeansListByBuyId(id);
			//リクエストスコープにセット
			request.setAttribute("itemHistoryList", itemHistoryList);




			request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
