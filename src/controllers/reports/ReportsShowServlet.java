package controllers.reports;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Report;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/reports/show")
public class ReportsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int EGAO_TYPE = 1;
    private static final int NAKIGAO_TYPE = 2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportsShowServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Report r = em.find(Report.class, Integer.parseInt(request.getParameter("id")));

        // 日報の笑顔リアクション件数を取得
        long egaoCount = (Long)em.createNamedQuery("getReactionCountByType", Long.class)
                .setParameter("report_id", r.getId())
                .setParameter("type", EGAO_TYPE)
                .getSingleResult();

        // 日報の泣き顔リアクション件数を取得
        long nakigaoCount = (Long)em.createNamedQuery("getReactionCountByType", Long.class)
                .setParameter("report_id", r.getId())
                .setParameter("type", NAKIGAO_TYPE)
                .getSingleResult();

        em.close();

        request.setAttribute("report", r);
        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("egaoCount", egaoCount);
        request.setAttribute("nakigaoCount", nakigaoCount);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reports/show.jsp");
        rd.forward(request, response);
    }

}