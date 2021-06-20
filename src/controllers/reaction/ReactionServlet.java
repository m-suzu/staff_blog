package controllers.reaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.Employee;
import models.Reaction;
import utils.DBUtil;

/**
 * Servlet implementation class ReactionServret
 */
@WebServlet(urlPatterns={"/saveReaction" })
public class ReactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReactionServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        //パラメータ取得
        int reportId = Integer.parseInt(req.getParameter("report_id"));
        int type = Integer.parseInt(req.getParameter("type"));
        Employee employee = (Employee)req.getSession().getAttribute("login_employee");
        Long countByType = null;

        try {

            // ユーザーのリアクションが既に登録されている件数を取得
            Long count = (Long)em.createNamedQuery("getReactionCountByTypeAndUser", Long.class)
                    .setParameter("report_id", reportId)
                    .setParameter("type", type)
                    .setParameter("employee", employee)
                    .getSingleResult();

            // 件数を判定
            if (count == 0) {
                // 0件の場合、未登録として扱い、データを登録する
                Reaction r = new Reaction();
                r.setReport_id(reportId);
                r.setType(type);
                r.setEmployee(employee);

                em.getTransaction().begin();
                em.persist(r);
                em.getTransaction().commit();


                // 日報のリアクション件数を取得
                countByType = (Long)em.createNamedQuery("getReactionCountByType", Long.class)
                        .setParameter("report_id", reportId)
                        .setParameter("type", type)
                        .getSingleResult();
            } else {
                // 既に登録されている場合、何もしない
                countByType = null;
            }
            em.close();
            //出力(レスポンスをmapに格納してJSON化)

            //JSONマップ
            Map<String, Long> mapMsg = new HashMap<String, Long>();

            //追加
            mapMsg.put("count", countByType);

            //マッパ(JSON <-> Map, List)
            ObjectMapper mapper = new ObjectMapper();

            //json文字列
            String jsonStr = mapper.writeValueAsString(mapMsg); //list, map

            //ヘッダ設定
            res.setContentType("application/json;charset=UTF-8"); //JSON形式, UTF-8

            //pwオブジェクト
            PrintWriter pw = res.getWriter();

            //出力
            pw.print(jsonStr);

            //クローズ
            pw.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
